// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:herraf_app/practiceGamePlay.dart';

import 'package:google_fonts/google_fonts.dart';

class WonPage extends StatefulWidget {
  String gameWinner = '';
  WonPage(this.gameWinner);

  @override
  State<WonPage> createState() => _WonPageState();
}

class _WonPageState extends State<WonPage> {
  final GlobalKey webViewKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  @override
  Widget build(BuildContext context) {
    print(widget.gameWinner);
    return Scaffold(
        backgroundColor: Color(0xffE5E5E5),
        body: SafeArea(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                margin: new EdgeInsets.symmetric(vertical: 20),
                height: 131,
                width: 130,
                child: new Image.asset(
                  "assets/images/trophy.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              child: Text(
                "Victory!",
                style: GoogleFonts.poppins(
                    color: Color(0xff212121),
                    fontSize: 32,
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              child: Text(
                widget.gameWinner,
                style: GoogleFonts.poppins(
                    color: Color(0xff212121),
                    fontSize: 25,
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
            // Container(
            //   padding: const EdgeInsets.only(top: 0),
            //   child: Container(
            //     margin: EdgeInsets.symmetric(vertical: 0),
            //     child: RichText(
            //       text: TextSpan(children: [
            //         TextSpan(
            //           text: 'Exp',
            //           style: GoogleFonts.poppins(
            //               color: Color(0xff212121),
            //               fontSize: 16,
            //               fontWeight: FontWeight.w500),
            //         ),
            //         TextSpan(
            //           text: '+75',
            //           style: GoogleFonts.poppins(
            //               color: Color(0xff0C8F5D),
            //               fontSize: 16,
            //               fontWeight: FontWeight.w500),
            //         ),
            //       ]),
            //     ),
            //   ),
            // ),
            Container(
                padding: const EdgeInsets.only(top: 60),
                margin: new EdgeInsets.symmetric(horizontal: 15.0, vertical: 0),
                height: 250.0,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          padding: const EdgeInsets.only(top: 10),
                          child: Center(
                            child: Container(
                              margin: new EdgeInsets.symmetric(
                                  horizontal: 0.0, vertical: 10),
                              padding: EdgeInsets.only(
                                top: 10,
                              ),
                              width: 175,
                              height: 175,
                              child: Card(
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(17.0),
                                  ),
                                  color: Color(0xfffffffff),
                                  child: Column(children: [
                                    Container(
                                      margin: new EdgeInsets.symmetric(
                                          horizontal: 30.0, vertical: 10),
                                      child: Text(
                                        "Spelled correctly",
                                        style: GoogleFonts.poppins(
                                            color: Color(0xff212121),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 10,
                                          ),
                                        ),
                                        Image.asset(
                                          'assets/images/daily_streak.png',
                                          height: 67,
                                          width: 65,
                                        ), // <-- SEE
                                        Text(
                                          '26',
                                          style: GoogleFonts.poppins(
                                              color: Color(0xff212121),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 10,
                                          ),
                                        ),

                                        Text(
                                          '+1',
                                          style: GoogleFonts.poppins(
                                              color: Color(0xff06A669),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ])),
                            ),
                          ));
                    })),
            Padding(
              padding: const EdgeInsets.only(
                top: 130,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content:
                              Text('Please wait we are working on it...')));
                    },
                    child: Container(
                      margin: new EdgeInsets.symmetric(
                          horizontal: 4.0, vertical: 4),
                      alignment: Alignment.center,
                      height: 56,
                      width: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color(0xffDADADA),
                        border: Border.all(
                          color: Colors.grey,
                          width: 1,
                        ),
                      ),
                      child: Text(
                        "Share",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            color: Color(0xffB0A9A9),
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 5,
                    right: 5,
                  ),
                ),
                InkWell(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => PracticeGamePlay()),
                      // );

                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  PracticeGamePlay()),
                          (Route<dynamic> route) => false);
                    },
                    child: Container(
                      margin: new EdgeInsets.symmetric(
                          horizontal: 4.0, vertical: 4),
                      alignment: Alignment.center,
                      height: 56,
                      width: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color(0xffCE8C8C),
                      ),
                      //  color: Color(0xff267693),
                      child: Text(
                        "Play again",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            color: Color(0xffffffff),
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    )),
              ],
            )
          ]),
        ));
  }
}

// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:herraf_app/bottomNavBar.dart';

class OppenentWon extends StatefulWidget {
  String gameWinner = '';
  String expEarned = '';
  OppenentWon(this.gameWinner, this.expEarned);

  @override
  State<OppenentWon> createState() => _OppenentWonState();
}

class _OppenentWonState extends State<OppenentWon> {
  _back() {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => BottomNav(2)));
  }

  @override
  Widget build(BuildContext context) {
    print('${widget.gameWinner}');
    print('${widget.expEarned}');

    return Scaffold(
        backgroundColor: Color(0xffE5E5E5),
        body: WillPopScope(
          onWillPop: () async {
            bool confirm = Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => BottomNav(2))) as bool;
            return confirm;
          },
          child: SafeArea(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
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
                          fontSize: 30,
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
                  Container(
                    padding: const EdgeInsets.only(top: 0),
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 0),
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: '${widget.expEarned}',
                            style: GoogleFonts.poppins(
                                color: Color(0xff0C8F5D),
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ]),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Container(
                    child: Text(
                      "Opponents has left the game",
                      style: GoogleFonts.poppins(
                          color: Color(0xff212121),
                          fontSize: 27,
                          fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        'Please wait we are working on it...')));
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
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => BottomNav(2)));
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
          ),
        ));
  }
}

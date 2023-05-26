import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:herraf_app/newscan2.dart';
import 'package:herraf_app/slides2.dart';
import 'package:herraf_app/slides3.dart';

class Series4 extends StatefulWidget {
  const Series4({Key? key}) : super(key: key);

  @override
  State<Series4> createState() => _Series4State();
}

class _Series4State extends State<Series4> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding:
            EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.0100),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(
              child: Column(children: [
            SizedBox(
              child: Stack(
                  alignment: Alignment.topCenter,
                  clipBehavior: Clip.none,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.30,
                      width: double.infinity,
                      child: Image.asset("assets/images/background-top(2).png"),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.115,
                      child: Container(
                          alignment: Alignment.center,
                          height: MediaQuery.of(context).size.height * 0.25,
                          width: MediaQuery.of(context).size.width * 0.533,
                          child: Image.asset("assets/images/Group1.png")),
                    ),
                  ]),
            ),
            // Container(
            //   height: 260,
            //   child: Image.asset(
            //     'assets/images/background-top(2).png',
            //     // height: 230,
            //     width: MediaQuery.of(context).size.width,
            //     // width: MediaQuery.of(context).size.width * 0.94,
            //     // height: MediaQuery.of(context).size.height * 0.14,
            //   ), // <-- SEE HERE
            // ),
            // Container(
            //   //  height: 217,
            //   width: 170,
            //   padding:
            //       new EdgeInsets.symmetric(horizontal: 0.0, vertical: 0),
            //   child: Image.asset(
            //     'assets/images/Group1.png',
            //     // height: 230,
            //     //width: MediaQuery.of(context).size.width,
            //     // width: MediaQuery.of(context).size.width * 0.94,
            //     // height: MediaQuery.of(context).size.height * 0.14,
            //   ), // <-- SEE HERE
            // ),
            Container(
              margin: new EdgeInsets.only(
                top: 60,
              ),
              padding: new EdgeInsets.symmetric(
                horizontal: 30.0,
              ),
              child:
                  // alignment: Alignment.centerLeft,

                  Text(
                "Rediscover the pleasure of learning medicine!",
                style: GoogleFonts.poppins(
                    color: Color(0xff212121),
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: new EdgeInsets.only(
                top: 10,
              ),
              padding: new EdgeInsets.symmetric(
                horizontal: 30.0,
              ),
              child:
                  // alignment: Alignment.centerLeft,

                  Text(
                "Learning has never been as fun as before. Improve your medical knowledge in a pain-free way.",
                style: GoogleFonts.poppins(
                    color: Color(0xff6C6363),
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 260,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //  Padding(padding: new EdgeInsets.only(left: 12, right: 12)),
                InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Series3()),
                      );
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
                      //  color: Color(0xff267693),
                      child: Text(
                        "Skip",
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Series2()),
                      );
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
                        "Next",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            color: Color(0xffffffff),
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    )),
              ],
            )
          ])),
        ]),
      ),
    ));
  }
}

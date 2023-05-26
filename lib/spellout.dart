import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import 'package:herraf_app/acronym1.dart';
import 'package:herraf_app/gamescreen2.dart';
import 'package:herraf_app/newfile.dart';
import 'package:herraf_app/quitquiz.dart';
import 'package:page_transition/page_transition.dart';

class SpelloutPage extends StatefulWidget {
  const SpelloutPage({Key? key}) : super(key: key);

  @override
  State<SpelloutPage> createState() => _SpelloutPageState();
}

class _SpelloutPageState extends State<SpelloutPage> {
  @override
  void initState() {
    super.initState();
  }

  double _currentSliderValue = 20;

  @override
  Widget build(BuildContext context) {
    var imageFile;
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color(0xffDADADA),
            title: InkWell(
              onTap: (() {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => MyCoursePage()),
                // );
              }),
              child: Text(
                "Quit the quiz",
                style: GoogleFonts.poppins(
                    color: Color(0xff212121),
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
            leading: InkWell(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.only(
                  left: 20,
                ),
                child: Icon(
                  Icons.arrow_back,
                  color: Color(0xff000000),
                ),
              ),
            )),
        backgroundColor: Color(0xffE5E5E5),
        body: SingleChildScrollView(
            padding: const EdgeInsets.only(
              top: 10,
            ),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      padding: const EdgeInsets.only(right: 10),
                      height: 57,
                      width: 57,
                      alignment: Alignment.center,
                      child: Image.asset("assets/images/sand clock.png")),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Row(
                      children: [
                        TweenAnimationBuilder<Duration>(
                            duration: const Duration(minutes: 3),
                            tween: Tween(
                                begin: const Duration(minutes: 3),
                                end: Duration.zero),
                            onEnd: () {
                              print('Timer ended');
                            },
                            builder: (BuildContext context, Duration value,
                                Widget? child) {
                              final minutes = value.inMinutes;
                              final seconds = value.inSeconds % 60;
                              return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: Text('$minutes:$seconds',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          color: Color(0xff00253A),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18)));
                            }),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(top: 7),
                margin: new EdgeInsets.symmetric(horizontal: 3.0, vertical: 0),
                height: 70.0,
                child: ListView(
                  padding: const EdgeInsets.only(
                    left: 0,
                    right: 10,
                  ),

                  // This next line does the trick.
                  scrollDirection: Axis.horizontal,

                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.only(
                      left: 60,
                    )),
                    Padding(
                        padding: const EdgeInsets.only(
                      left: 10,
                    )),
                    Padding(
                        padding: const EdgeInsets.only(
                      left: 10,
                    )),
                    InkWell(
                      onTap: () {
                        // Navigator.pushReplacement(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => groupsdetailpage("Agriculture")),
                        // );
                      },
                      child: Center(
                        child: Container(
                          alignment: Alignment.center,
                          // width: 120,
                          // height: 55,
                          child: Text(
                            "T",
                            style: GoogleFonts.poppins(
                                //  decoration: TextDecoration.underline,
                                decorationColor: Color(0xff2F80ED),
                                decorationThickness: 2,
                                // decorationStyle: TextDecorationStyle.dashed,
                                color: Color(0xff2F80ED),
                                fontSize: 24,
                                fontWeight: FontWeight.w600),
                          ),
                          // decoration: BoxDecoration(
                          //   // border: Border.all(
                          //   //  color: Color(0xffF1F6FF),
                          //   //   width: 5,
                          //   // ),
                          //   color: Color(0xffF1F6FF),
                          // ),
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(
                      left: 15,
                    )),
                    InkWell(
                      onTap: () {
                        // Navigator.pushReplacement(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => groupsdetailpage("Agriculture")),
                        // );
                      },
                      child: Center(
                        child: Container(
                          alignment: Alignment.center,
                          // width: 120,
                          // height: 55,
                          child: Text(
                            "A",
                            style: GoogleFonts.poppins(
                                color: Color(0xffBDBDBD),
                                fontSize: 24,
                                fontWeight: FontWeight.w600),
                          ),
                          // decoration: BoxDecoration(
                          //   // border: Border.all(
                          //   //  color: Color(0xffF1F6FF),
                          //   //   width: 5,
                          //   // ),
                          //   color: Color(0xffF1F6FF),
                          // ),
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(
                      left: 15,
                    )),
                    InkWell(
                      onTap: () {
                        // Navigator.pushReplacement(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => groupsdetailpage("Agriculture")),
                        // );
                      },
                      child: Center(
                        child: Container(
                          alignment: Alignment.center,
                          // width: 120,
                          // height: 55,
                          child: Text(
                            "P",
                            style: GoogleFonts.poppins(
                                color: Color(0xffBDBDBD),
                                fontSize: 24,
                                fontWeight: FontWeight.w600),
                          ),
                          // decoration: BoxDecoration(
                          //   // border: Border.all(
                          //   //  color: Color(0xffF1F6FF),
                          //   //   width: 5,
                          //   // ),
                          //   color: Color(0xffF1F6FF),
                          // ),
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(
                      left: 15,
                    )),
                    InkWell(
                      onTap: () {
                        // Navigator.pushReplacement(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => groupsdetailpage("Agriculture")),
                        // );
                      },
                      child: Center(
                        child: Container(
                          alignment: Alignment.center,
                          // width: 120,
                          // height: 55,
                          child: Text(
                            "E",
                            style: GoogleFonts.poppins(
                                color: Color(0xffBDBDBD),
                                fontSize: 24,
                                fontWeight: FontWeight.w600),
                          ),
                          // decoration: BoxDecoration(
                          //   // border: Border.all(
                          //   //  color: Color(0xffF1F6FF),
                          //   //   width: 5,
                          //   // ),
                          //   color: Color(0xffF1F6FF),
                          // ),
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(
                      left: 15,
                    )),
                    InkWell(
                      onTap: () {
                        // Navigator.pushReplacement(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => groupsdetailpage("Agriculture")),
                        // );
                      },
                      child: Center(
                        child: Container(
                          alignment: Alignment.center,
                          // width: 120,
                          // height: 55,
                          child: Text(
                            "le",
                            style: GoogleFonts.poppins(
                                color: Color(0xff2B1B1F),
                                fontSize: 24,
                                fontWeight: FontWeight.w400),
                          ),
                          // decoration: BoxDecoration(
                          //   // border: Border.all(
                          //   //  color: Color(0xffF1F6FF),
                          //   //   width: 5,
                          //   // ),
                          //   color: Color(0xffF1F6FF),
                          // ),
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(
                      left: 15,
                    )),
                    InkWell(
                      onTap: () {
                        // Navigator.pushReplacement(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => groupsdetailpage("Agriculture")),
                        // );
                      },
                      child: Center(
                        child: Container(
                          alignment: Alignment.center,
                          // width: 120,
                          // height: 55,
                          child: Text(
                            "V",
                            style: GoogleFonts.poppins(
                                color: Color(0xffBDBDBD),
                                fontSize: 24,
                                fontWeight: FontWeight.w600),
                          ),
                          // decoration: BoxDecoration(
                          //   // border: Border.all(
                          //   //  color: Color(0xffF1F6FF),
                          //   //   width: 5,
                          //   // ),
                          //   color: Color(0xffF1F6FF),
                          // ),
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(
                      left: 15,
                    )),
                    InkWell(
                      onTap: () {
                        // Navigator.pushReplacement(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => groupsdetailpage("Agriculture")),
                        // );
                      },
                      child: Center(
                        child: Container(
                          alignment: Alignment.center,
                          // width: 120,
                          // height: 55,
                          child: Text(
                            "C",
                            style: GoogleFonts.poppins(
                                color: Color(0xffBDBDBD),
                                fontSize: 24,
                                fontWeight: FontWeight.w600),
                          ),
                          // decoration: BoxDecoration(
                          //   // border: Border.all(
                          //   //  color: Color(0xffF1F6FF),
                          //   //   width: 5,
                          //   // ),
                          //   color: Color(0xffF1F6FF),
                          // ),
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(
                      left: 15,
                    )),
                    InkWell(
                      onTap: () {
                        // Navigator.pushReplacement(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => groupsdetailpage("Agriculture")),
                        // );
                      },
                      child: Center(
                        child: Container(
                          alignment: Alignment.center,
                          // width: 120,
                          // height: 55,
                          child: Text(
                            "D",
                            style: GoogleFonts.poppins(
                                color: Color(0xffBDBDBD),
                                fontSize: 24,
                                fontWeight: FontWeight.w600),
                          ),
                          // decoration: BoxDecoration(
                          //   // border: Border.all(
                          //   //  color: Color(0xffF1F6FF),
                          //   //   width: 5,
                          //   // ),
                          //   color: Color(0xffF1F6FF),
                          // ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: new EdgeInsets.symmetric(
                  horizontal: 25.0,
                ),
                child: Slider(
                  value: _currentSliderValue,
                  max: 100,
                  divisions: 5,
                  activeColor: Color(0xffCE8C8C),
                  inactiveColor: Color(0xffEBE9E9),
                  label: _currentSliderValue.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _currentSliderValue = value;
                    });
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 40),
                margin: new EdgeInsets.symmetric(horizontal: 3.0, vertical: 0),
                height: 90.0,
                child: ListView(
                  padding: const EdgeInsets.only(
                    left: 0,
                    right: 10,
                  ),

                  // This next line does the trick.
                  scrollDirection: Axis.horizontal,

                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.only(
                      left: 70,
                    )),
                    InkWell(
                      onTap: () {
                        // Navigator.pushReplacement(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => groupsdetailpage("Agriculture")),
                        // );
                      },
                      child: Center(
                        child: Container(
                          alignment: Alignment.center,
                          width: 120,
                          height: 55,
                          child: Text(
                            "Tachycardia",
                            style: GoogleFonts.poppins(
                                color: Color(0xff212121),
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color(0xff333333), width: 0),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                            color: const Color(0xfffffffffff),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(
                      left: 10,
                    )),
                    InkWell(
                      onTap: () {
                        // Navigator.pushReplacement(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => groupsdetailpage("Agriculture")),
                        // );
                      },
                      child: Center(
                        child: Container(
                          alignment: Alignment.center,
                          width: 120,
                          height: 55,
                          child: Text(
                            "Tachycardia",
                            style: GoogleFonts.poppins(
                                color: Color(0xff212121),
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color(0xff333333), width: 0),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                            color: const Color(0xfffffffffff),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 20),
                margin: new EdgeInsets.symmetric(horizontal: 3.0, vertical: 0),
                height: 90.0,
                child: ListView(
                  padding: const EdgeInsets.only(
                    left: 0,
                    right: 10,
                  ),

                  // This next line does the trick.
                  scrollDirection: Axis.horizontal,

                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.only(
                      left: 70,
                    )),
                    InkWell(
                      onTap: () {
                        // Navigator.pushReplacement(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => groupsdetailpage("Agriculture")),
                        // );
                      },
                      child: Center(
                        child: Container(
                          alignment: Alignment.center,
                          width: 120,
                          height: 55,
                          child: Text(
                            "Tachycardia",
                            style: GoogleFonts.poppins(
                                color: Color(0xff212121),
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color(0xff333333), width: 0),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                            color: const Color(0xfffffffffff),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(
                      left: 10,
                    )),
                    InkWell(
                      onTap: () {
                        // Navigator.pushReplacement(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => groupsdetailpage("Agriculture")),
                        // );
                      },
                      child: Center(
                        child: Container(
                          alignment: Alignment.center,
                          width: 120,
                          height: 55,
                          child: Text(
                            "Tachycardia",
                            style: GoogleFonts.poppins(
                                color: Color(0xff212121),
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color(0xff333333), width: 0),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                            color: const Color(0xfffffffffff),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 15),
                margin: new EdgeInsets.symmetric(horizontal: 3.0, vertical: 0),
                height: 90.0,
                child: ListView(
                  padding: const EdgeInsets.only(
                    left: 0,
                    right: 10,
                  ),

                  // This next line does the trick.
                  scrollDirection: Axis.horizontal,

                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.only(
                      left: 70,
                    )),
                    InkWell(
                      onTap: () {
                        // Navigator.pushReplacement(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => groupsdetailpage("Agriculture")),
                        // );
                      },
                      child: Center(
                        child: Container(
                          alignment: Alignment.center,
                          width: 190,
                          height: 55,
                          child: Text(
                            "Trombocytose moderee",
                            style: GoogleFonts.poppins(
                                color: Color(0xff212121),
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color(0xff333333), width: 0),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                            color: const Color(0xfffffffffff),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(
                      left: 10,
                    )),
                  ],
                ),
              ),
              InkWell(
                  onTap: () {
                    // Navigator.pushReplacement(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => Quitquiz()),
                    // );
                  },
                  child: Container(
                      padding: const EdgeInsets.only(top: 120),
                      child: Container(
                        height: 60,
                        width: 230,
                        margin: EdgeInsets.all(40),
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Color(0xffBDBDBD),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(40.0),
                            bottomLeft: Radius.circular(40.0),
                          ),
                        ),
                        child: Text(
                          'Joseph started observing',
                          style: GoogleFonts.poppins(
                              color: Color(0xff786E6E),
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ))),
            ])));
  }
}

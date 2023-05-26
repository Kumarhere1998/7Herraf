// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:herraf_app/finishgame4.dart';
import 'package:page_transition/page_transition.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:toggle_switch/toggle_switch.dart';

//import 'package:infinumgrowth/main.dart';
//import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:convert';

class GamePage5 extends StatefulWidget {
  // ignore: use_key_in_widget_constructors

  var child;

  // const leftnavigatorPage({Key? key}) : super(key: key);

  @override
  State<GamePage5> createState() => _GamePage5State();
}

class _GamePage5State extends State<GamePage5> {
  final GlobalKey webViewKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var imageFile;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffE5E5E5),
          title: InkWell(
            onTap: (() {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => MyCoursePage()),
              // );
            }),
            child: Container(
              padding: const EdgeInsets.only(
                left: 250,
              ),
              child: Text(
                "You won!",
                style: GoogleFonts.poppins(
                    color: Color(0xff00253A),
                    fontSize: 26,
                    fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          leading: InkWell(
            onTap: (() {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.leftToRight,
                      child: GamePage4()));
            }),
            child: Container(
              padding: const EdgeInsets.only(
                left: 20,
              ),
              child: Icon(
                Icons.arrow_back_ios,
                color: Color(0xff0093ED),
              ),
            ),
          ),
          actions: <Widget>[
            // Padding(padding: const EdgeInsets.only(right: 25)),
            InkWell(
              onTap: (() {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => CatalogPage3()),
                //  );
              }),
              child: Image.asset(
                'assets/images/Group 240.png',
                height: 26,
                width: 45,
                // width: MediaQuery.of(context).size.width * 0.94,
                // height: MediaQuery.of(context).size.height * 0.14,
              ), // <-- SEE
            ),
            Padding(padding: const EdgeInsets.only(right: 20)),
            Container(
              padding: const EdgeInsets.only(right: 20),
              child: Image.asset(
                'assets/images/Auto Layout Horizontal(6).png',
                height: 26,
                width: 45,
                // width: MediaQuery.of(context).size.width * 0.94,
                // height: MediaQuery.of(context).size.height * 0.14,
              ), // <-- SEE
            )
            // IconButton(
            //   onPressed: () {
            //     // Navigator.of(context)
            //     //     .push(MaterialPageRoute(builder: (context) => ShoppingBag()));
            //   },
            //   icon: Image.asset('assets/images/Group(16).png'),
            //   //               height: 20,
            //   //               width: 20,'),
            //   iconSize: 128,
            // ),
            // IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {}),
            // IconButton(icon: Icon(Icons.message), onPressed: () {}),
          ],
        ),
        backgroundColor: Color(0xffE5E5E5),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 3),

          child: Center(
              child: Column(children: [
            Container(
              padding: const EdgeInsets.only(top: 0),
              // margin: new EdgeInsets.symmetric(horizontal: 3.0, vertical: 0),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 0),
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: 'Exp',
                      style: GoogleFonts.poppins(
                          color: Color(0xff00253A),
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                    TextSpan(
                      text: '+150',
                      style: GoogleFonts.poppins(
                          color: Color(0xff06A669),
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ]),
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 30),
            // ),
            // Padding(
            //   padding: EdgeInsets.only(top: 10, left: 90),
            // ),
            Container(
                padding: const EdgeInsets.only(top: 10),
                child: Center(
                  child: Container(
                    margin:
                        new EdgeInsets.symmetric(horizontal: 0.0, vertical: 10),
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
                              "Streak extended",
                              style: GoogleFonts.poppins(
                                  color: Color(0xff00253A),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
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
                                'assets/images/flames 1.png',
                                height: 67,
                                width: 65,
                                // width: MediaQuery.of(context).size.width * 0.94,
                                // height: MediaQuery.of(context).size.height * 0.14,
                              ), // <-- SEE
                              Text(
                                '26',
                                style: GoogleFonts.poppins(
                                    color: Color(0xff00253A),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                              // textDirection: TextDirection.rtl,
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
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ])),
                  ),
                )),
            Container(
                padding: const EdgeInsets.only(
                  top: 10,
                ),
                child: Container(
                  height: 48,
                  width: 158,
                  color: Color(0xff0093ED),
                  child: ElevatedButton(
                      onPressed: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => InvitefriendPage()));
                      },
                      child: Text(
                        "Play again",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600, fontSize: 16),
                      )),
                )),
          ])),

          //
        ));
  }
}

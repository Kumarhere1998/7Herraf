// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:toggle_switch/toggle_switch.dart';

//import 'package:infinumgrowth/main.dart';
//import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:convert';

class GamePage1 extends StatefulWidget {
  // ignore: use_key_in_widget_constructors

  var child;

  // const leftnavigatorPage({Key? key}) : super(key: key);

  @override
  State<GamePage1> createState() => _GamePage1State();
}

class _GamePage1State extends State<GamePage1> {
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
          leading: Container(
            padding: const EdgeInsets.only(
              left: 20,
            ),
            child: Icon(
              Icons.arrow_back_ios,
              color: Color(0xff000000),
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
          padding: const EdgeInsets.only(
            top: 10,
          ),
          child: Column(children: [
            Container(
              padding: const EdgeInsets.only(top: 7),
              // margin: new EdgeInsets.symmetric(horizontal: 3.0, vertical: 0),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 5),
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
            Row(
              children: <Widget>[
                Container(
                  margin:
                      new EdgeInsets.symmetric(horizontal: 80.0, vertical: 5),
                  padding: EdgeInsets.only(
                    top: 10,
                  ),
                  width: 191,
                  height: 123,
                  child: Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17.0),
                      ),
                      color: Color(0xffF1F6FF),
                      child: Column(children: [
                        Container(
                          padding: const EdgeInsets.only(
                              top: 30, left: 30, right: 30),
                          child: Text(
                            "Games",
                            style: GoogleFonts.poppins(
                                color: Color(0xff00253A),
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ])),
                ),
                Container(
                  margin: new EdgeInsets.symmetric(vertical: 5),
                  padding: EdgeInsets.only(top: 10),
                  width: 191,
                  height: 143,
                  child: Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17.0),
                      ),
                      color: Color(0xffF1F6FF),
                      child: Column(children: [
                        Container(
                          padding: const EdgeInsets.only(
                              top: 30, left: 30, right: 30),
                          child: Text(
                            "Avg. spelling accuracy",
                            style: GoogleFonts.poppins(
                                color: Color(0xff00253A),
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ])),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 30,
              ),
            ),
            Container(
              height: 45,
              width: 150,
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
            )
          ]),

          //
        ));
  }
}

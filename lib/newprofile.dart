// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:herraf_app/achievment.dart';
import 'package:herraf_app/eitprofile.dart';
import 'package:herraf_app/viewfriend.dart';
import 'package:image_picker/image_picker.dart';

//import 'package:infinumgrowth/main.dart';
//import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:convert';

class profilePage2 extends StatefulWidget {
  // ignore: use_key_in_widget_constructors

  var child;

  // const leftnavigatorPage({Key? key}) : super(key: key);

  @override
  State<profilePage2> createState() => _profilePage2State();
}

class ProfileData {
  String name = "";
}

class _profilePage2State extends State<profilePage2> {
  final GlobalKey webViewKey = GlobalKey();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController last_namecontroller = TextEditingController();
  TextEditingController user_idcontroller = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController user_passwordcontroller = TextEditingController();
  final typecontroller = TextEditingController();

  ProfileData _profileData = new ProfileData();

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final nameController = TextEditingController();
  var box;

  bool _showPassword = false;
  void _togglevisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  //var facebookLogin = FacebookLogin();

  var _isLoading = false;

  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  bool _switchValue = true;
  bool isSwitched = false;
  var textValue = 'Switch is OFF';

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        textValue = 'Switch Button is ON';
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitched = false;
        textValue = 'Switch Button is OFF';
      });
      print('Switch Button is OFF');
    }
  }

  void initState() {
    super.initState();
    _cartData();
    //_editprofile();

    //_profile();
  }

  // ignore: unused_element
  // _profile() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     _profileData.name = prefs.getString("name")!;
  //   });
  // }
  var name;
  var last_name;
  var user_password;
  var user_id;
  var user_email;
  var type;

  Future<void> _cartData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString("name");
      last_name = prefs.getString('last_name');
      user_id = prefs.getString('user_id');
      user_email = prefs.getString('user_email');
      user_password = prefs.getString('user_password');
      type = prefs.getString('type');
      namecontroller.text = name;
      last_namecontroller.text = last_name;
      user_idcontroller.text = user_id;
      user_passwordcontroller.text = user_password;
      typecontroller.text = type;

      print("AllDataPrint");
    });
  }

  @override
  Widget build(BuildContext context) {
    var imageFile;
    var name;
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      appBar: AppBar(
        backgroundColor: Color(0xffE5E5E5),
        //  backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          "Profile",
          style: GoogleFonts.poppins(
              color: Color(0xff0093ED),
              fontSize: 18,
              fontWeight: FontWeight.w600),
        ),
        leading: InkWell(
          onTap: (() {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => profilePage2()),
            // );
          }),
          child: Container(
            padding: const EdgeInsets.only(
              left: 20,
            ),
            child: Icon(
              Icons.arrow_back_ios,
              color: Color(0xff0093ED),
            ),
            // Image.asset(
            //   'assets/images/Vector(53).png',
            //   height: 0,
            //   width: 0,
            //   // width: MediaQuery.of(context).size.width * 0.94,
            //   // height: MediaQuery.of(context).size.height * 0.14,
            // ),
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
          ),
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => MyHomePage()),
                  // );
                },
                child: Icon(
                  Icons.more_vert,
                  color: Color(0xff2B1B1F),
                ),
              )),
        ],
      ),
      body: SingleChildScrollView(
          child: Container(
        child: Container(
          padding: EdgeInsets.only(top: 20),
          width: double.infinity,

          //  height: 350.0,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  // onTap: _getFromGallery,
                  child: Container(
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/images/Group(8).png',
                          height: 80.0,
                          width: 80.0,
                          // width: MediaQuery.of(context).size.width * 0.94,
                          // height: MediaQuery.of(context).size.height * 0.14,
                        ),
                        Positioned(
                          top: 52,
                          left: 22,
                          child: Container(
                            height: 30.0,
                            width: 30.0,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage("assets/images/Group(9).png"),
                              fit: BoxFit.cover,
                            )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  child: Container(
                    padding: const EdgeInsets.only(
                      top: 20,
                    ),
                    // child: Text(
                    //   '$name',
                    //   style: GoogleFonts.poppins(
                    //       color: Color(0xff0093ED),
                    //       fontSize: 16,
                    //       fontWeight: FontWeight.w600),
                    // ),
                  ),
                ),
                Container(
                    // child: Text(
                    //   "$namecontroller.text",
                    //   style: GoogleFonts.poppins(
                    //       color: Color(0xff0093ED),
                    //       fontSize: 16,
                    //       fontWeight: FontWeight.w600),
                    // ),
                    ),
                Container(
                  margin:
                      new EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
                  padding: EdgeInsets.only(top: 10),
                  width: 390,
                  height: 70,
                  child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      elevation: 0,
                      color: Color(0xffF1F6FF),
                      child: Column(children: [
                        Container(
                          padding: EdgeInsets.only(top: 9, left: 13),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              // Padding(
                              //   padding: const EdgeInsets.only(
                              //     left: 3,
                              //   ),
                              // ),
                              Text('Ann',
                                  style: GoogleFonts.poppins(
                                      //color: Colors.red,
                                      color: Color(0xff00253A),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600)),
                              Padding(
                                padding: EdgeInsets.only(left: 240),
                              ),
                              Image.asset(
                                'assets/images/edit.png',
                                height: 27,
                                width: 27,
                                // width: MediaQuery.of(context).size.width * 0.94,
                                // height: MediaQuery.of(context).size.height * 0.14,
                              ), // <-- SEE
                            ],
                          ),
                        ),
                      ])),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 0, right: 290),
                  child: Text(
                    "Stats",
                    style: GoogleFonts.poppins(
                        color: Color(0xff00253A),
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 20, top: 12),
                      width: 170,
                      height: 80,
                      child: Card(
                        elevation: 0,
                        color: Color(0xffF1F6FF),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(left: 0, top: 23),
                              child: Text(
                                "Games total",
                                style: GoogleFonts.poppins(
                                  color: Color(0xff828282),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 12, right: 20),
                      width: 170,
                      height: 80,
                      child: Card(
                        elevation: 0,
                        color: Color(0xffF1F6FF),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(left: 0, top: 23),
                              child: Text(
                                "Discussions forums",
                                style: GoogleFonts.poppins(
                                  color: Color(0xff828282),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 20, top: 0),
                      width: 170,
                      height: 80,
                      child: Card(
                        elevation: 0,
                        color: Color(0xffF1F6FF),
                        child: Row(
                          children: <Widget>[
                            Container(
                              height: 45,
                              padding: EdgeInsets.only(left: 30, right: 12),
                              child: Image.asset('assets/images/Polygon.png'),
                            ),
                            GestureDetector(
                              onTap: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (BuildContext context) =>
                                //             MygroupnewPage()));
                              },
                              child: Container(
                                padding: EdgeInsets.only(left: 0),
                                child: Text(
                                  "Bronze",
                                  style: GoogleFonts.poppins(
                                    color: Color(0xff00253A),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 0, right: 20),
                      width: 170,
                      height: 80,
                      child: Card(
                        elevation: 0,
                        color: Color(0xffF1F6FF),
                        child: Row(
                          children: <Widget>[
                            Container(
                              height: 45,
                              padding: EdgeInsets.only(left: 50, right: 8),
                              child: Image.asset('assets/images/flames 1.png'),
                            ),
                            GestureDetector(
                              onTap: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (BuildContext context) =>
                                //             Activityfeed()));
                              },
                              child: Container(
                                padding: EdgeInsets.only(left: 0),
                                child: Text(
                                  "25",
                                  style: GoogleFonts.poppins(
                                    color: Color(0xff00253A),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin:
                      new EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
                  padding: EdgeInsets.only(top: 10),
                  width: 390,
                  height: 230,
                  child: Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      color: Color(0xffF1F6FF),
                      child: Column(children: [
                        Container(
                          padding: const EdgeInsets.only(
                              top: 70, left: 30, right: 30),
                          child: Text(
                            "Playing statistics for the last 7 days (day/experience)",
                            style: GoogleFonts.poppins(
                                color: Color(0xff000000),
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ])),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, right: 20, left: 20),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 18),
                  margin:
                      new EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
                  alignment: Alignment.centerLeft,
                  child: Row(children: <Widget>[
                    Text(
                      "Friends",
                      style: GoogleFonts.poppins(
                          color: Color(0xff00253A),
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                    Padding(padding: const EdgeInsets.only(right: 236)),
                    InkWell(
                        onTap: (() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ViewfriendPage()),
                          );
                        }),
                        child: Text(
                          "View all",
                          style: GoogleFonts.poppins(
                              color: Color(0xff0093ED),
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ))
                  ]),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.44,
                  child: ListView.builder(
                    itemCount: 4,
                    //scrollDirection: Axis.vertical,
                    padding: const EdgeInsets.all(16),
                    itemBuilder: (context, i) {
                      return InkWell(
                          onTap: () {
                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (context) => LoginDemo()));
                          },
                          child: Container(
                            height: 80,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                //<-- 1. SEE HERE
                                side: BorderSide(
                                  color: Colors.grey.withOpacity(0.7),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                              color: Color(0xfffffffff),
// Colors.blue,
                              elevation: 0,
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: Text(
                                        "1",
                                        style: GoogleFonts.poppins(
                                            color: Color(0xffBDBDBD),
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 41.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xffB6E1F3),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/Group 173.png'),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)),
                                      // ignore: prefer_const_literals_to_create_immutables
                                      // boxShadow: [
                                      //   BoxShadow(blurRadius: 7.0, color: Colors.black)
                                      // ]
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      "Wade Warren",
                                      style: GoogleFonts.poppins(
                                          color: Color(0xff00253A),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(left: 91),
                                    child: Text(
                                      "Exp 1400",
                                      style: GoogleFonts.poppins(
                                          color: Color(0xff828282),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  // child: Chip(
                                  //   label: Text('France'),
                                  //   // shadowColor: Colors.blue,
                                  //   // backgroundColor: Colors.green,
                                  //   // elevation: 10,
                                  //   // autofocus: true,
                                  // )),
                                ],
                              ),
                            ),
                          ));
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, right: 20, left: 20),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 18),
                  margin:
                      new EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
                  alignment: Alignment.centerLeft,
                  child: Row(children: <Widget>[
                    Text(
                      "Achivements",
                      style: GoogleFonts.poppins(
                          color: Color(0xff00253A),
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                    Padding(padding: const EdgeInsets.only(right: 10)),
                    Text(
                      "15/45",
                      style: GoogleFonts.poppins(
                          color: Color(0xff0093ED),
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                    Padding(padding: const EdgeInsets.only(right: 137)),
                    InkWell(
                        onTap: (() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AchievmentPage2()),
                          );
                        }),
                        child: Text(
                          "View all",
                          style: GoogleFonts.poppins(
                              color: Color(0xff0093ED),
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ))
                  ]),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 7),
                  margin:
                      new EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
                  height: 100.0,
                  child: ListView(
                    // padding: const EdgeInsets.only(
                    //   left: 0,
                    //   right: 10,
                    // ),

                    // This next line does the trick.
                    scrollDirection: Axis.horizontal,

                    children: <Widget>[
                      Container(
                        margin: new EdgeInsets.symmetric(
                          horizontal: 8.0,
                        ),
                        // padding: EdgeInsets.only(top: 10),
                        width: 114,
                        height: 114,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                          color: Color(0xffF1F6FF),
                          // child: Column(children: [
                          //   Container(
                          //     padding: const EdgeInsets.only(
                          //         top: 70, left: 30, right: 30),
                          //     child: Text(
                          //       "Playing statistics for the last 7 days (day/experience)",
                          //       style: GoogleFonts.poppins(
                          //           color: Color(0xff000000),
                          //           fontSize: 14,
                          //           fontWeight: FontWeight.w600),
                          //     ),
                        ),
                      ),
                      Container(
                        margin: new EdgeInsets.symmetric(
                          horizontal: 8.0,
                        ),
                        // padding: EdgeInsets.only(top: 10),
                        width: 114,
                        height: 114,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                          color: Color(0xffF1F6FF),
                          // child: Column(children: [
                          //   Container(
                          //     padding: const EdgeInsets.only(
                          //         top: 70, left: 30, right: 30),
                          //     child: Text(
                          //       "Playing statistics for the last 7 days (day/experience)",
                          //       style: GoogleFonts.poppins(
                          //           color: Color(0xff000000),
                          //           fontSize: 14,
                          //           fontWeight: FontWeight.w600),
                          //     ),
                        ),
                      ),
                      Container(
                        margin: new EdgeInsets.symmetric(
                          horizontal: 8.0,
                        ),
                        // padding: EdgeInsets.only(top: 10),
                        width: 114,
                        height: 114,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                          color: Color(0xffF1F6FF),
                          // child: Column(children: [
                          //   Container(
                          //     padding: const EdgeInsets.only(
                          //         top: 70, left: 30, right: 30),
                          //     child: Text(
                          //       "Playing statistics for the last 7 days (day/experience)",
                          //       style: GoogleFonts.poppins(
                          //           color: Color(0xff000000),
                          //           fontSize: 14,
                          //           fontWeight: FontWeight.w600),
                          //     ),
                        ),
                      ),
                      Container(
                        margin: new EdgeInsets.symmetric(
                          horizontal: 8.0,
                        ),
                        // padding: EdgeInsets.only(top: 10),
                        width: 114,
                        height: 114,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                          color: Color(0xffF1F6FF),
                          // child: Column(children: [
                          //   Container(
                          //     padding: const EdgeInsets.only(
                          //         top: 70, left: 30, right: 30),
                          //     child: Text(
                          //       "Playing statistics for the last 7 days (day/experience)",
                          //       style: GoogleFonts.poppins(
                          //           color: Color(0xff000000),
                          //           fontSize: 14,
                          //           fontWeight: FontWeight.w600),
                          //     ),
                        ),
                      ),
                      Container(
                        margin: new EdgeInsets.symmetric(
                          horizontal: 8.0,
                        ),
                        // padding: EdgeInsets.only(top: 10),
                        width: 114,
                        height: 114,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                          color: Color(0xffF1F6FF),
                          // child: Column(children: [
                          //   Container(
                          //     padding: const EdgeInsets.only(
                          //         top: 70, left: 30, right: 30),
                          //     child: Text(
                          //       "Playing statistics for the last 7 days (day/experience)",
                          //       style: GoogleFonts.poppins(
                          //           color: Color(0xff000000),
                          //           fontSize: 14,
                          //           fontWeight: FontWeight.w600),
                          //     ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, right: 20, left: 20),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 18),
                  margin:
                      new EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
                  alignment: Alignment.centerLeft,
                  child: Row(children: <Widget>[
                    Text(
                      "Pack collection    3/4",
                      style: GoogleFonts.poppins(
                          color: Color(0xff00253A),
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                    Padding(padding: const EdgeInsets.only(right: 10)),
                    Text(
                      "Matches",
                      style: GoogleFonts.poppins(
                          color: Color(0xff0093ED),
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                    Padding(padding: const EdgeInsets.only(right: 67)),
                    Transform.scale(
                        scale: 1,
                        child: Switch(
                          onChanged: toggleSwitch,
                          value: isSwitched,
                          activeColor: Colors.blue,
                          activeTrackColor: Color(0xff7DD8FF),
                          inactiveThumbColor: Color(0xff0072B1),
                          inactiveTrackColor: Color(0xff7DD8FF),
                        )),
                  ]),
                ),
                Container(
                  height: 200,
                  child: Row(
                    children: [
                      Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width / 2 -
                            32, // minus 32 due to the margin
                        margin: EdgeInsets.all(16.0),
                        padding: EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Color(0xffF1F6FF),
                          // background color of the cards
                          borderRadius: BorderRadius.all(Radius.circular(0.0)),
                          boxShadow: [],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment
                              .end, // posion the everything to the bottom
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // place here your image
                            Image.asset(
                              'assets/images/Group 114(1).png',
                              height: 65,
                              width: 65,
                            ),
                            Padding(padding: const EdgeInsets.only(top: 20)),
                            Text(
                              "Pack 1 name",
                              style: GoogleFonts.poppins(
                                  color: Color(0xff2B1B1F),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width / 2 -
                            32, // minus 32 due to the margin
                        margin: EdgeInsets.all(16.0),
                        padding: EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Color(0xffF1F6FF),

                          // background color of the cards
                          borderRadius: BorderRadius.all(Radius.circular(0.0)),
                          boxShadow: [],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment
                              .end, // posion the everything to the bottom
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // place here your image
                            Image.asset(
                              'assets/images/Group 114(1).png',
                              height: 65,
                              width: 65,
                            ),
                            Padding(padding: const EdgeInsets.only(top: 20)),
                            Text(
                              "Pack 1 name",
                              style: GoogleFonts.poppins(
                                  color: Color(0xff2B1B1F),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 200,
                  child: Row(
                    children: [
                      Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width / 2 -
                            32, // minus 32 due to the margin
                        margin: EdgeInsets.all(16.0),
                        padding: EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Color(0xffF1F6FF),
                          // background color of the cards
                          borderRadius: BorderRadius.all(Radius.circular(0.0)),
                          boxShadow: [],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment
                              .end, // posion the everything to the bottom
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // place here your image
                            Image.asset(
                              'assets/images/Group 114(1).png',
                              height: 65,
                              width: 65,
                            ),
                            Padding(padding: const EdgeInsets.only(top: 20)),
                            Text(
                              "Pack 1 name",
                              style: GoogleFonts.poppins(
                                  color: Color(0xff2B1B1F),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width / 2 -
                            32, // minus 32 due to the margin
                        margin: EdgeInsets.all(16.0),
                        padding: EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Color(0xffF1F6FF),
                          // background color of the cards
                          borderRadius: BorderRadius.all(Radius.circular(0.0)),
                          boxShadow: [],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment
                              .end, // posion the everything to the bottom
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // place here your image
                            Image.asset(
                              'assets/images/Group 114(1).png',
                              height: 65,
                              width: 65,
                            ),
                            Padding(padding: const EdgeInsets.only(top: 20)),
                            Text(
                              "Pack 1 name",
                              style: GoogleFonts.poppins(
                                  color: Color(0xff2B1B1F),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 200,
                  child: Row(
                    children: [
                      Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width / 2 -
                            32, // minus 32 due to the margin
                        margin: EdgeInsets.all(16.0),
                        padding: EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Color(0xffF1F6FF),
                          // background color of the cards
                          borderRadius: BorderRadius.all(Radius.circular(0.0)),
                          boxShadow: [],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment
                              .end, // posion the everything to the bottom
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // place here your image
                            Image.asset(
                              'assets/images/Group 114(1).png',
                              height: 65,
                              width: 65,
                            ),
                            Padding(padding: const EdgeInsets.only(top: 20)),
                            Text(
                              "Pack 1 name",
                              style: GoogleFonts.poppins(
                                  color: Color(0xff2B1B1F),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width / 2 -
                            32, // minus 32 due to the margin
                        margin: EdgeInsets.all(16.0),
                        padding: EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Color(0xffF1F6FF),
                          // background color of the cards
                          borderRadius: BorderRadius.all(Radius.circular(0.0)),
                          boxShadow: [],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment
                              .end, // posion the everything to the bottom
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // place here your image
                            Image.asset(
                              'assets/images/Group 114(1).png',
                              height: 65,
                              width: 65,
                            ),
                            Padding(padding: const EdgeInsets.only(top: 20)),
                            Text(
                              "Pack 1 name",
                              style: GoogleFonts.poppins(
                                  color: Color(0xff2B1B1F),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }

  static ImagePicker() {}
}

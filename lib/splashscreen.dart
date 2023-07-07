import 'dart:async';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:herraf_app/bottomNavBar.dart';
import 'package:herraf_app/bottomtab.dart';
import 'package:herraf_app/newlogin.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage3 extends StatefulWidget {
  @override
  State<MyHomePage3> createState() => _MyHomePage3State();
}

class _MyHomePage3State extends State<MyHomePage3> {
  @override
  void initState() {
    _checkAuth();
    super.initState();
  }

  Future _checkAuth() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print('USer Id On spalshScreen ==> ${prefs.getString('user_id')}');

    // setState(() {
    // prefs.setString('user_id', 'first_name');
    // });
    if (prefs.getString('user_id') == null) {
      Timer(
          Duration(seconds: 2),
          () => {
                Navigator.of(context).popUntil((route) => route.isFirst),
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => GoogleloginPage1())),
              });
    } else if (prefs.getString('user_id') == null) {
      Timer(
          Duration(seconds: 2),
          () => {
                Navigator.of(context).popUntil((route) => route.isFirst),
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => GoogleloginPage1())),
              });
    } else {
      Timer(
          Duration(seconds: 2),
          () => {
                Navigator.of(context).popUntil((route) => route.isFirst),
                // Navigator.of(context).pushReplacement(
                //     MaterialPageRoute(builder: (context) => Home(4))),
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => BottomNav(2)),
                ),
              });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          flex: 1,
          child: Center(
              child: Image.asset(
            'assets/images/logo.png',
            height: 118,
            width: 142,
          )),
        ),
        Container(
          height: 150,
          width: 320,
          child: Stack(alignment: Alignment.bottomCenter, children: <Widget>[
            Image(
              image: AssetImage('assets/images/pattern(1).png'),
            ),
            Positioned(
              bottom: 30,
              child: RichText(
                text: TextSpan(
                    text: "Designed by",
                    style: GoogleFonts.poppins(
                        color: Color(0xff7E7E7E),
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                    children: [
                      TextSpan(
                        text: " P.Learn",
                        style: GoogleFonts.poppins(
                            color: Color(0xff212121),
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      )
                    ]),
              ),
            )
          ]),
        )
      ],
    ));
  }
}

class Shared {
  static String loginSharedPreference = "LOGGEDINKEY";

  // save data

  static Future<bool> saveLoginSharedPreference(islogin) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setBool(loginSharedPreference, islogin);
  }

  //fetch data

  static Future getUserSharedPreferences() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(loginSharedPreference);
  }
}

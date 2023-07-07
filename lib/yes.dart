// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:herraf_app/api_servivce.dart';
import 'package:herraf_app/newslide.dart';
import 'package:herraf_app/scan.dart';

// This widget is the root of your application.

class YesPage extends StatefulWidget {
  // const YesPage({Key? key}) : super(key: key);

  @override
  State<YesPage> createState() => _YesPageState();
}

class _YesPageState extends State<YesPage> {
  List<dynamic> country = [];
  @override
  void initState() {
    selectcountrydata();

    super.initState();
  }

  selectcountrydata() {
    ApiService.selectcountrydata().then((value) {
      // ApiService.class_data("3,4", pref.getString("token"),date).then((value) {

      setState(() {
        country = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Color(0xffDADADA),
        body: SingleChildScrollView(
            // padding: const EdgeInsets.only(
            //   top: 10,
            // ),
            child: Column(children: [
      Container(
        height: 260,
        child: Image.asset(
          'assets/images/background-top(2).png',
          // height: 230,
          width: MediaQuery.of(context).size.width,
          // width: MediaQuery.of(context).size.width * 0.94,
          // height: MediaQuery.of(context).size.height * 0.14,
        ), // <-- SEE HERE
      ),
      Container(
        padding: new EdgeInsets.symmetric(horizontal: 35.0, vertical: 0),
        child: Image.asset(
          'assets/images/yes.png',
          // height: 230,
          width: MediaQuery.of(context).size.width,
          // width: MediaQuery.of(context).size.width * 0.94,
          // height: MediaQuery.of(context).size.height * 0.14,
        ), // <-- SEE HERE
      ),
      Container(
        margin: new EdgeInsets.only(
          top: 40,
        ),
        padding: new EdgeInsets.symmetric(
          horizontal: 30.0,
        ),
        child:
            // alignment: Alignment.centerLeft,

            Text(
          "Have you ever bought our packs of flashcards?",
          style: GoogleFonts.poppins(
              color: Color(0xff212121),
              fontSize: 20,
              fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
      ),
      Padding(
        padding: new EdgeInsets.symmetric(vertical: 15),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePageMain()),
                );
              },
              child: Container(
                margin: new EdgeInsets.symmetric(horizontal: 4.0, vertical: 4),
                alignment: Alignment.center,
                height: 56,
                width: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Color(0xffCE8C8C),
                ),
                //  color: Color(0xff267693),
                child: Text(
                  "No",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      color: Color(0xffffffff),
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              )),
          Padding(padding: new EdgeInsets.only(left: 12, right: 12)),
          InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Onboarding()),
                );
              },
              child: Container(
                margin: new EdgeInsets.symmetric(horizontal: 4.0, vertical: 4),
                alignment: Alignment.center,
                height: 56,
                width: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  // color: Color(0xffDADADA),
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
                //  color: Color(0xff267693),
                child: Text(
                  "Yes",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      // color: Color(0xffffffff),
                      color: Colors.grey,
                      fontSize: 11,
                      fontWeight: FontWeight.w500),
                ),
              ))
        ],
      )
    ])));

    // _navigateRegistration() {
    //   Navigator.push(
    //       context, MaterialPageRoute(builder: (context) => LoginPage()));
    // }
  }
}

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:google_fonts/google_fonts.dart';
import 'package:herraf_app/mainscreen.dart';
//import 'package:herraf_app/slideone.dart';
import 'package:page_transition/page_transition.dart';

//import 'package:infinumgrowth/api/api_service.dart';
//import 'package:infinumgrowth/services/analytics_service.dart';

class LoginPage1 extends StatefulWidget {
  const LoginPage1({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginPage1State createState() => _LoginPage1State();
}

class _LoginPage1State extends State<LoginPage1> {
  ///GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  // _HomeData _homeData = new _HomeData();
  //final _analyticsService = AnalyticsServices();

  var profileData;

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  var postmodified;

  //var facebookLogin = FacebookLogin();
  @override
  void initState() {
    super.initState();
    ;
  }

  //  bool isLoading = true;
  // var author;
  // var res;
  // var result;
  // var number;
  // bool flag = true;
  // void articledetail(id) {
  //   ApiService.articledetail(id).then((value) {
  //     res = value["data"];
  //     setState(() {
  //       isLoading = false;
  //       number = value["data"]["post_id"];
  //       author = value["data"]["id"];
  //     });
  //   });
  //   print("helloabc${res}");
  // }

  @override
  Widget build(BuildContext context) {
    var imageFile;
    return Scaffold(
        backgroundColor: Color(0xffE5E5E5),
        body: SingleChildScrollView(
            child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.only(
            top: 120,
          ),
          margin: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(children: <Widget>[
            Container(
              width: 167,
              height: 252,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/images/card.png"),
                fit: BoxFit.cover,
              )),
            ),
            // Container(
            //   width: 165,
            //   height: 252,
            //   //  margin: EdgeInsets.all(86),
            //   //padding: EdgeInsets.all(5),

            //   decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(5.0),
            //       color: Color(0xffB6E1F3),
            //       border: Border.all(
            //         color: Color(0xff0093ED),
            //         width: 2,
            //       )),
            // ),
            Container(
              padding: const EdgeInsets.only(
                top: 20,
              ),
              child: Text(
                "Flashcards",
                style: GoogleFonts.poppins(
                    color: Color(0xff00253A),
                    fontSize: 24,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 37, vertical: 12),
              // margin: new EdgeInsets.symmetric(horizontal: 43.0, vertical: 4),
              child: Text(
                "Learn more what the flashcards are and why you should buy them.",
                style: GoogleFonts.poppins(
                    color: Color(0x99333333),
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              ),
            ),
            InkWell(
              onTap: () {
                // Navigator.push(
                //     context,
                //     PageTransition(
                //         type: PageTransitionType.topToBottom,
                //         child: SlideOne()));
              },
              child: Container(
                padding: const EdgeInsets.only(top: 10, bottom: 20),
                child: Text(
                  "Discover more",
                  style: GoogleFonts.poppins(
                      color: Color(0xff0093ED),
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 110, top: 90),
              //margin: new EdgeInsets.symmetric(vertical: 4),
              child: Text(
                "Already familiar?",
                style: GoogleFonts.poppins(
                    color: Color(0xff00253A),
                    fontSize: 24,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              constraints: BoxConstraints(maxWidth: 380.0, minHeight: 50.0),
              margin: EdgeInsets.all(8),
              // child: RaisedButton(
              //   onPressed: () {
              //     Navigator.of(context).push(MaterialPageRoute(
              //         builder: (context) => MainScreen
              //             //CatalogPage
              //             ()));
              //   },
              //   color: const Color(0xff0093ED),
              //   child: Padding(
              //     padding: EdgeInsets.all(0),
              //     child: Container(
              //       alignment: Alignment.center,
              //       padding: const EdgeInsets.only(left: 30),
              //       child: Row(
              //         //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: <Widget>[
              //           Text(
              //             'Physical cards catalog',
              //             style: GoogleFonts.poppins(
              //                 color: Color(0xfffffffff),
              //                 fontSize: 16,
              //                 fontWeight: FontWeight.w600),
              //           ),
              //           Padding(
              //             padding: const EdgeInsets.only(left: 20),
              //           ),
              //           Icon(
              //             Icons.arrow_forward,
              //             color: Colors.white,
              //             size: 20,
              //           )
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 10, top: 10),
              margin: new EdgeInsets.symmetric(vertical: 0),
              child: Text(
                "Skip and start playing",
                style: GoogleFonts.poppins(
                    color: Color(0xff0093ED),
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ]),
        )));
  }

  void initiateFacebookLogin() async {}
}

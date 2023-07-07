// // ignore_for_file: prefer_const_constructors

// import 'dart:async';
// import 'dart:io';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// import 'package:google_fonts/google_fonts.dart';
// import 'package:herraf_app/acronym2.dart';
// import 'package:toggle_switch/toggle_switch.dart';

// //import 'package:infinumgrowth/main.dart';
// //import 'package:flutter_login_facebook/flutter_login_facebook.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import 'dart:convert';

// class AcronymPage1 extends StatefulWidget {
//   // ignore: use_key_in_widget_constructors

//   var child;

//   // const leftnavigatorPage({Key? key}) : super(key: key);

//   @override
//   State<AcronymPage1> createState() => _AcronymPage1State();
// }

// class _AcronymPage1State extends State<AcronymPage1> {
//   final GlobalKey webViewKey = GlobalKey();

//   @override
//   void initState() {
//     super.initState();
//     SystemChrome.setPreferredOrientations([
//       DeviceOrientation.landscapeRight,
//       DeviceOrientation.landscapeLeft,
//     ]);
//   }

//   @override
//   dispose() {
//     SystemChrome.setPreferredOrientations([
//       DeviceOrientation.landscapeRight,
//       DeviceOrientation.landscapeLeft,
//       DeviceOrientation.portraitUp,
//       DeviceOrientation.portraitDown,
//     ]);
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     var imageFile;
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Color(0xffE5E5E5),
//           title: InkWell(
//             onTap: (() {
//               // Navigator.push(
//               //   context,
//               //   MaterialPageRoute(builder: (context) => MyCoursePage()),
//               // );
//             }),
//             child: Text(
//               "Quit the quiz",
//               style: GoogleFonts.poppins(
//                   color: Color(0xff333333),
//                   fontSize: 14,
//                   fontWeight: FontWeight.w600),
//             ),
//           ),
//           leading: Container(
//             padding: const EdgeInsets.only(
//               left: 20,
//             ),
//             child: Icon(
//               Icons.arrow_back,
//               color: Color(0xff000000),
//             ),
//           ),
//           actions: <Widget>[
//             Padding(padding: const EdgeInsets.only(right: 25)),
//             InkWell(
//               onTap: (() {
//                 // Navigator.push(
//                 //   context,
//                 //   MaterialPageRoute(builder: (context) => CatalogPage3()),
//                 //  );
//               }),
//               child: Image.asset(
//                 'assets/images/Auto Layout Horizontal(5).png',
//                 height: 72,
//                 width: 72,
//                 // width: MediaQuery.of(context).size.width * 0.94,
//                 // height: MediaQuery.of(context).size.height * 0.14,
//               ), // <-- SEE
//             ),
//             Padding(padding: const EdgeInsets.only(right: 200)),
//             Container(
//               padding: const EdgeInsets.only(right: 20),
//               child: Image.asset(
//                 'assets/images/acronym1.png',
//                 height: 26,
//                 width: 40,
//                 // width: MediaQuery.of(context).size.width * 0.94,
//                 // height: MediaQuery.of(context).size.height * 0.14,
//               ), // <-- SEE
//             )
//             // IconButton(
//             //   onPressed: () {
//             //     // Navigator.of(context)
//             //     //     .push(MaterialPageRoute(builder: (context) => ShoppingBag()));
//             //   },
//             //   icon: Image.asset('assets/images/Group(16).png'),
//             //   //               height: 20,
//             //   //               width: 20,'),
//             //   iconSize: 128,
//             // ),
//             // IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {}),
//             // IconButton(icon: Icon(Icons.message), onPressed: () {}),
//           ],
//         ),
//         backgroundColor: Color(0xffE5E5E5),
//         body: SingleChildScrollView(
//           padding: const EdgeInsets.only(
//             top: 10,
//           ),
//           child: Column(children: [
//             Container(
//               padding: const EdgeInsets.only(top: 7),
//               margin: new EdgeInsets.symmetric(horizontal: 3.0, vertical: 0),
//               height: 70.0,
//               child: ListView(
//                 padding: const EdgeInsets.only(
//                   left: 0,
//                   right: 10,
//                 ),

//                 // This next line does the trick.
//                 scrollDirection: Axis.horizontal,

//                 children: <Widget>[
//                   Padding(
//                       padding: const EdgeInsets.only(
//                     left: 160,
//                   )),
//                   Padding(
//                       padding: const EdgeInsets.only(
//                     left: 10,
//                   )),
//                   Padding(
//                       padding: const EdgeInsets.only(
//                     left: 10,
//                   )),
//                   InkWell(
//                     onTap: () {
//                       // Navigator.pushReplacement(
//                       //   context,
//                       //   MaterialPageRoute(
//                       //       builder: (context) => groupsdetailpage("Agriculture")),
//                       // );
//                     },
//                     child: Center(
//                       child: Container(
//                         alignment: Alignment.center,
//                         // width: 120,
//                         // height: 55,
//                         child: Text(
//                           "T",
//                           style: GoogleFonts.poppins(
//                               decoration: TextDecoration.underline,
//                               decorationColor: Color(0xff2F80ED),
//                               decorationThickness: 2,
//                               // decorationStyle: TextDecorationStyle.dashed,
//                               color: Color(0xff2F80ED),
//                               fontSize: 24,
//                               fontWeight: FontWeight.w600),
//                         ),
//                         // decoration: BoxDecoration(
//                         //   // border: Border.all(
//                         //   //  color: Color(0xffF1F6FF),
//                         //   //   width: 5,
//                         //   // ),
//                         //   color: Color(0xffF1F6FF),
//                         // ),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                       padding: const EdgeInsets.only(
//                     left: 45,
//                   )),
//                   InkWell(
//                     onTap: () {
//                       // Navigator.pushReplacement(
//                       //   context,
//                       //   MaterialPageRoute(
//                       //       builder: (context) => groupsdetailpage("Agriculture")),
//                       // );
//                     },
//                     child: Center(
//                       child: Container(
//                         alignment: Alignment.center,
//                         // width: 120,
//                         // height: 55,
//                         child: Text(
//                           "A",
//                           style: GoogleFonts.poppins(
//                               color: Color(0xffBDBDBD),
//                               fontSize: 24,
//                               fontWeight: FontWeight.w600),
//                         ),
//                         // decoration: BoxDecoration(
//                         //   // border: Border.all(
//                         //   //  color: Color(0xffF1F6FF),
//                         //   //   width: 5,
//                         //   // ),
//                         //   color: Color(0xffF1F6FF),
//                         // ),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                       padding: const EdgeInsets.only(
//                     left: 45,
//                   )),
//                   InkWell(
//                     onTap: () {
//                       // Navigator.pushReplacement(
//                       //   context,
//                       //   MaterialPageRoute(
//                       //       builder: (context) => groupsdetailpage("Agriculture")),
//                       // );
//                     },
//                     child: Center(
//                       child: Container(
//                         alignment: Alignment.center,
//                         // width: 120,
//                         // height: 55,
//                         child: Text(
//                           "P",
//                           style: GoogleFonts.poppins(
//                               color: Color(0xffBDBDBD),
//                               fontSize: 24,
//                               fontWeight: FontWeight.w600),
//                         ),
//                         // decoration: BoxDecoration(
//                         //   // border: Border.all(
//                         //   //  color: Color(0xffF1F6FF),
//                         //   //   width: 5,
//                         //   // ),
//                         //   color: Color(0xffF1F6FF),
//                         // ),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                       padding: const EdgeInsets.only(
//                     left: 45,
//                   )),
//                   InkWell(
//                     onTap: () {
//                       // Navigator.pushReplacement(
//                       //   context,
//                       //   MaterialPageRoute(
//                       //       builder: (context) => groupsdetailpage("Agriculture")),
//                       // );
//                     },
//                     child: Center(
//                       child: Container(
//                         alignment: Alignment.center,
//                         // width: 120,
//                         // height: 55,
//                         child: Text(
//                           "E",
//                           style: GoogleFonts.poppins(
//                               color: Color(0xffBDBDBD),
//                               fontSize: 24,
//                               fontWeight: FontWeight.w600),
//                         ),
//                         // decoration: BoxDecoration(
//                         //   // border: Border.all(
//                         //   //  color: Color(0xffF1F6FF),
//                         //   //   width: 5,
//                         //   // ),
//                         //   color: Color(0xffF1F6FF),
//                         // ),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                       padding: const EdgeInsets.only(
//                     left: 45,
//                   )),
//                   InkWell(
//                     onTap: () {
//                       // Navigator.pushReplacement(
//                       //   context,
//                       //   MaterialPageRoute(
//                       //       builder: (context) => groupsdetailpage("Agriculture")),
//                       // );
//                     },
//                     child: Center(
//                       child: Container(
//                         alignment: Alignment.center,
//                         // width: 120,
//                         // height: 55,
//                         child: Text(
//                           "le",
//                           style: GoogleFonts.poppins(
//                               color: Color(0xff2B1B1F),
//                               fontSize: 24,
//                               fontWeight: FontWeight.w400),
//                         ),
//                         // decoration: BoxDecoration(
//                         //   // border: Border.all(
//                         //   //  color: Color(0xffF1F6FF),
//                         //   //   width: 5,
//                         //   // ),
//                         //   color: Color(0xffF1F6FF),
//                         // ),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                       padding: const EdgeInsets.only(
//                     left: 45,
//                   )),
//                   InkWell(
//                     onTap: () {
//                       // Navigator.pushReplacement(
//                       //   context,
//                       //   MaterialPageRoute(
//                       //       builder: (context) => groupsdetailpage("Agriculture")),
//                       // );
//                     },
//                     child: Center(
//                       child: Container(
//                         alignment: Alignment.center,
//                         // width: 120,
//                         // height: 55,
//                         child: Text(
//                           "V",
//                           style: GoogleFonts.poppins(
//                               color: Color(0xffBDBDBD),
//                               fontSize: 24,
//                               fontWeight: FontWeight.w600),
//                         ),
//                         // decoration: BoxDecoration(
//                         //   // border: Border.all(
//                         //   //  color: Color(0xffF1F6FF),
//                         //   //   width: 5,
//                         //   // ),
//                         //   color: Color(0xffF1F6FF),
//                         // ),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                       padding: const EdgeInsets.only(
//                     left: 45,
//                   )),
//                   InkWell(
//                     onTap: () {
//                       // Navigator.pushReplacement(
//                       //   context,
//                       //   MaterialPageRoute(
//                       //       builder: (context) => groupsdetailpage("Agriculture")),
//                       // );
//                     },
//                     child: Center(
//                       child: Container(
//                         alignment: Alignment.center,
//                         // width: 120,
//                         // height: 55,
//                         child: Text(
//                           "C",
//                           style: GoogleFonts.poppins(
//                               color: Color(0xffBDBDBD),
//                               fontSize: 24,
//                               fontWeight: FontWeight.w600),
//                         ),
//                         // decoration: BoxDecoration(
//                         //   // border: Border.all(
//                         //   //  color: Color(0xffF1F6FF),
//                         //   //   width: 5,
//                         //   // ),
//                         //   color: Color(0xffF1F6FF),
//                         // ),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                       padding: const EdgeInsets.only(
//                     left: 45,
//                   )),
//                   InkWell(
//                     onTap: () {
//                       // Navigator.pushReplacement(
//                       //   context,
//                       //   MaterialPageRoute(
//                       //       builder: (context) => groupsdetailpage("Agriculture")),
//                       // );
//                     },
//                     child: Center(
//                       child: Container(
//                         alignment: Alignment.center,
//                         // width: 120,
//                         // height: 55,
//                         child: Text(
//                           "D",
//                           style: GoogleFonts.poppins(
//                               color: Color(0xffBDBDBD),
//                               fontSize: 24,
//                               fontWeight: FontWeight.w600),
//                         ),
//                         // decoration: BoxDecoration(
//                         //   // border: Border.all(
//                         //   //  color: Color(0xffF1F6FF),
//                         //   //   width: 5,
//                         //   // ),
//                         //   color: Color(0xffF1F6FF),
//                         // ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               padding: const EdgeInsets.only(top: 40),
//               margin: new EdgeInsets.symmetric(horizontal: 3.0, vertical: 0),
//               height: 90.0,
//               child: ListView(
//                 padding: const EdgeInsets.only(
//                   left: 0,
//                   right: 10,
//                 ),

//                 // This next line does the trick.
//                 scrollDirection: Axis.horizontal,

//                 children: <Widget>[
//                   Padding(
//                       padding: const EdgeInsets.only(
//                     left: 110,
//                   )),
//                   InkWell(
//                     onTap: () {
//                       // Navigator.pushReplacement(
//                       //   context,
//                       //   MaterialPageRoute(
//                       //       builder: (context) => groupsdetailpage("Agriculture")),
//                       // );
//                     },
//                     child: Center(
//                       child: Container(
//                         alignment: Alignment.center,
//                         width: 120,
//                         height: 55,
//                         child: Text(
//                           "Tachycardia",
//                           style: GoogleFonts.poppins(
//                               color: Color(0xff333333),
//                               fontSize: 14,
//                               fontWeight: FontWeight.w600),
//                         ),
//                         decoration: BoxDecoration(
//                           // border: Border.all(
//                           //  color: Color(0xffF1F6FF),
//                           //   width: 5,
//                           // ),
//                           color: Color(0xffF1F6FF),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                       padding: const EdgeInsets.only(
//                     left: 10,
//                   )),
//                   InkWell(
//                     onTap: () {
//                       // Navigator.pushReplacement(
//                       //   context,
//                       //   MaterialPageRoute(
//                       //       builder: (context) => groupsdetailpage("Agriculture")),
//                       // );
//                     },
//                     child: Center(
//                       child: Container(
//                         alignment: Alignment.center,
//                         width: 120,
//                         height: 55,
//                         child: Text(
//                           "Tachycardia",
//                           style: GoogleFonts.poppins(
//                               color: Color(0xff333333),
//                               fontSize: 14,
//                               fontWeight: FontWeight.w600),
//                         ),
//                         decoration: BoxDecoration(
//                           // border: Border.all(
//                           //  color: Color(0xffF1F6FF),
//                           //   width: 5,
//                           // ),
//                           color: Color(0xffF1F6FF),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                       padding: const EdgeInsets.only(
//                     left: 10,
//                   )),
//                   InkWell(
//                     onTap: () {
//                       // Navigator.pushReplacement(
//                       //   context,
//                       //   MaterialPageRoute(
//                       //       builder: (context) => groupsdetailpage("Agriculture")),
//                       // );
//                     },
//                     child: Center(
//                       child: Container(
//                         alignment: Alignment.center,
//                         width: 120,
//                         height: 55,
//                         child: Text(
//                           "Tachycardia",
//                           style: GoogleFonts.poppins(
//                               color: Color(0xff333333),
//                               fontSize: 14,
//                               fontWeight: FontWeight.w600),
//                         ),
//                         decoration: BoxDecoration(
//                           // border: Border.all(
//                           //  color: Color(0xffF1F6FF),
//                           //   width: 5,
//                           // ),
//                           color: Color(0xffF1F6FF),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                       padding: const EdgeInsets.only(
//                     left: 10,
//                   )),
//                   InkWell(
//                     onTap: () {
//                       // Navigator.pushReplacement(
//                       //   context,
//                       //   MaterialPageRoute(
//                       //       builder: (context) => groupsdetailpage("Agriculture")),
//                       // );
//                     },
//                     child: Center(
//                       child: Container(
//                         alignment: Alignment.center,
//                         width: 120,
//                         height: 55,
//                         child: Text(
//                           "Tachycardia",
//                           style: GoogleFonts.poppins(
//                               color: Color(0xff333333),
//                               fontSize: 14,
//                               fontWeight: FontWeight.w600),
//                         ),
//                         decoration: BoxDecoration(
//                           // border: Border.all(
//                           //  color: Color(0xffF1F6FF),
//                           //   width: 5,
//                           // ),
//                           color: Color(0xffF1F6FF),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//                 padding: const EdgeInsets.only(top: 60),
//                 margin: new EdgeInsets.symmetric(
//                   horizontal: 30.0,
//                 ),
//                 child: Row(
//                   //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   //mainAxisSize: MainAxisSize.max,
//                   children: <Widget>[
//                     Padding(
//                         padding: const EdgeInsets.only(
//                       left: 270,
//                     )),
//                     Row(

//                         //mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: <Widget>[
//                           Container(
//                             padding: const EdgeInsets.only(
//                               left: 20,
//                             ),
//                             child: Icon(
//                               Icons.arrow_back_ios,
//                               color: Color(0xff0093ED),
//                             ),
//                           ),
//                           Container(
//                             child: Image.asset(
//                               'assets/images/Auto Layout Vertical(4).png',
//                               height: 34,
//                               width: 75,
//                               // width: MediaQuery.of(context).size.width * 0.94,
//                               // height: MediaQuery.of(context).size.height * 0.14,
//                             ),
//                           ),
//                           InkWell(
//                             onTap: (() {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => AcronymPage2()),
//                               );
//                             }),
//                             child: Container(
//                               padding: const EdgeInsets.only(
//                                 left: 0,
//                               ),
//                               child: Icon(
//                                 Icons.arrow_forward_ios,
//                                 color: Color(0xff0093ED),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             padding: const EdgeInsets.only(
//                               left: 100,
//                             ),
//                             child: Image.asset(
//                               'assets/images/text.png',
//                               height: 51,
//                               width: 206,
//                               // width: MediaQuery.of(context).size.width * 0.94,
//                               // height: MediaQuery.of(context).size.height * 0.14,
//                             ),
//                           ),
//                         ]),
//                   ],
//                 )),
//           ]),

//           //
//         ));
//   }
// }

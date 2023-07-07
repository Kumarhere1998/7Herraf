// // ignore_for_file: prefer_const_constructors

// import 'dart:async';
// import 'dart:io';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// import 'package:google_fonts/google_fonts.dart';
// import 'package:herraf_app/acronym1.dart';
// // import 'package:herraf_app/acronym3.dart';
// import 'package:herraf_app/finishgame.dart';
// import 'package:herraf_app/finishgame2.dart';
// import 'package:toggle_switch/toggle_switch.dart';

// //import 'package:infinumgrowth/main.dart';
// //import 'package:flutter_login_facebook/flutter_login_facebook.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import 'dart:convert';

// class AcronymPage3 extends StatefulWidget {
//   // ignore: use_key_in_widget_constructors

//   var child;

//   // const leftnavigatorPage({Key? key}) : super(key: key);

//   @override
//   State<AcronymPage3> createState() => _AcronymPage3State();
// }

// class _AcronymPage3State extends State<AcronymPage3> {
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

//   showmodalAlert(BuildContext context) {
//     var foldertitleController;
//     showDialog(
//         context: context,
//         builder: (BuildContext context) => AlertDialog(
//             insetPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 45),
//             contentPadding: EdgeInsets.zero,
//             clipBehavior: Clip.antiAliasWithSaveLayer,
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(0.0))),

//             // title:
//             content: Container(
//                 child: Form(
//                     child: Container(
//                         //  https://www.youtube.com/shorts/VgmnuQNjghs

//                         // color: Colors.amber,
//                         margin: EdgeInsets.all(5),
//                         padding: EdgeInsets.all(5),
//                         child: Container(
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(0)),
//                             height: 354,
//                             width: 294,
//                             child: Column(children: <Widget>[
//                               Padding(
//                                 padding:
//                                     const EdgeInsets.only(right: 50, top: 10),
//                               ),
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Container(
//                                     padding: const EdgeInsets.only(
//                                       left: 10,
//                                     ),
//                                     // child: Text(
//                                     //   'Create new folder ',
//                                     //   style: GoogleFonts.poppins(
//                                     //       color: Color(0xff089C78),
//                                     //       fontSize: 18,
//                                     //       fontWeight: FontWeight.w600),
//                                     // ),
//                                   ),
//                                   Container(
//                                       child: Image.asset(
//                                     'assets/images/Auto Layout Horizontal(3).png',
//                                     height: 23,
//                                     width: 23,
//                                     // width: MediaQuery.of(context).size.width * 0.94,
//                                     // height: MediaQuery.of(context).size.height * 0.14,
//                                   )), // <-- SEE HERE
//                                 ],
//                               ),
//                               Container(
//                                 margin: EdgeInsets.symmetric(vertical: 0),
//                                 //   padding: EdgeInsets.all(10.0),
//                                 child: Text(
//                                   "Are you sure?",
//                                   style: GoogleFonts.poppins(
//                                       color: Color(0xff00253A),
//                                       fontSize: 26,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Container(
//                                 padding: EdgeInsets.only(
//                                   right: 0,
//                                 ),
//                                 margin: EdgeInsets.symmetric(
//                                     horizontal: 20, vertical: 10),
//                                 child: Text(
//                                   "By quiting you will automatically\n accept the penalty",
//                                   style: GoogleFonts.poppins(
//                                       color: Color(0xff969696),
//                                       fontSize: 14,
//                                       fontWeight: FontWeight.w400),
//                                 ),
//                               ),
//                               InkWell(
//                                 onTap: () {
//                                   // Navigator.of(context).push(MaterialPageRoute(
//                                   //     builder: (context) => InvitefriendPage
//                                   //         //CatalogPage
//                                   //         ()));
//                                 },
//                                 child: Container(
//                                   margin: new EdgeInsets.symmetric(
//                                       horizontal: 10.0, vertical: 20),
//                                   width: 309,
//                                   height: 53,
//                                   decoration: BoxDecoration(
//                                     color: Color(0xff0093ED),
//                                     borderRadius: BorderRadius.circular(4),
//                                   ),
//                                   child: Center(
//                                     child: Text(
//                                       'Invite to purchase',
//                                       style: GoogleFonts.poppins(
//                                         color: Color(0xffffffffff),
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.w600,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ])))))));
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
//                 'assets/images/eye.png',
//                 height: 26,
//                 width: 50,
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
//               height: 60.0,
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
//                               //decoration: TextDecoration.underline,
//                               decorationColor: Color(0xff121212),
//                               decorationThickness: 3,
//                               // decorationStyle: TextDecorationStyle.dashed,
//                               color: Color(0xff121212),
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
//                               color: Color(0xff121212),
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
//                               color: Color(0xff121212),
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
//                               decoration: TextDecoration.underline,
//                               decorationColor: Color(0xff2F80ED),
//                               decorationThickness: 2,
//                               color: Color(0xff121212),
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
//                               color: Color(0xff121212),
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
//                           "V",
//                           style: GoogleFonts.poppins(
//                               color: Color(0xff121212),
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
//                               color: Color(0xff121212),
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
//                               color: Color(0xff121212),
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
//               padding: const EdgeInsets.only(left: 230, right: 40),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: <Widget>[
//                   Container(
//                     alignment: Alignment.center,
//                     width: 120,
//                     height: 50,
//                     child: Text(
//                       "Tachycardia",
//                       style: GoogleFonts.poppins(
//                           color: Color(0xfffffffff),
//                           fontSize: 14,
//                           fontWeight: FontWeight.w600),
//                     ),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(8),
//                       // border: Border.all(
//                       //  color: Color(0xffF1F6FF),
//                       //   width: 5,
//                       // ),
//                       color: Color(0xff191919),
//                     ),
//                   ),
//                   Container(
//                     // padding: const EdgeInsets.only(left: 10),
//                     alignment: Alignment.center,
//                     width: 100,
//                     height: 50,
//                     child: Text(
//                       "Asthemie",
//                       style: GoogleFonts.poppins(
//                           color: Color(0xfffffffff),
//                           fontSize: 14,
//                           fontWeight: FontWeight.w600),
//                     ),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(8),
//                       // border: Border.all(
//                       //  color: Color(0xffF1F6FF),
//                       //   width: 5,
//                       // ),
//                       color: Color(0xff191919),
//                     ),
//                   ),
//                   Container(
//                     alignment: Alignment.center,
//                     width: 80,
//                     height: 50,
//                     child: Text(
//                       "Paleur",
//                       style: GoogleFonts.poppins(
//                           color: Color(0xfffffffff),
//                           fontSize: 14,
//                           fontWeight: FontWeight.w600),
//                     ),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(8),
//                       // border: Border.all(
//                       //  color: Color(0xffF1F6FF),
//                       //   width: 5,
//                       // ),
//                       color: Color(0xff191919),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               padding: const EdgeInsets.only(top: 30),
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
//                         width: 90,
//                         height: 50,
//                         child: Text(
//                           "ECG",
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
//                         height: 50,
//                         child: Text(
//                           "Endocardite",
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
//                         width: 150,
//                         height: 50,
//                         child: Text(
//                           "Extramites froides",
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
//                         width: 150,
//                         height: 50,
//                         child: Text(
//                           "Echocardiographie",
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
//                 padding: const EdgeInsets.only(top: 30),
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
//                           InkWell(
//                             onTap: (() {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => AcronymPage1()),
//                               );
//                             }),
//                             child: Container(
//                               padding: const EdgeInsets.only(
//                                 left: 20,
//                               ),
//                               child: Icon(
//                                 Icons.arrow_back_ios,
//                                 color: Color(0xff0093ED),
//                               ),
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
//                             onTap: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => GamePage1()),
//                               );
//                             },
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
//                           InkWell(
//                               onTap: () {
//                                 // Navigator.push(
//                                 //   context,
//                                 //   MaterialPageRoute(
//                                 //       builder: (context) => SamplePage()),
//                                 // );
//                               },
//                               child: Container(
//                                 padding: const EdgeInsets.only(
//                                   left: 100,
//                                 ),
//                                 child: Image.asset(
//                                   'assets/images/text.png',
//                                   height: 51,
//                                   width: 206,
//                                   // width: MediaQuery.of(context).size.width * 0.94,
//                                   // height: MediaQuery.of(context).size.height * 0.14,
//                                 ),
//                               )),
//                         ]),
//                   ],
//                 )),
//           ]),

//           //
//         ));
//   }
// }

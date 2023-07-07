// // ignore_for_file: prefer_const_constructors, must_be_immutable

// import 'dart:async';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:herraf_app/achievment.dart';
// import 'package:herraf_app/viewfriend.dart';
// import 'package:image_picker/image_picker.dart';

// //import 'package:infinumgrowth/main.dart';
// //import 'package:flutter_login_facebook/flutter_login_facebook.dart';


// class profilePage4 extends StatefulWidget {
//   // ignore: use_key_in_widget_constructors

//   var child;

//   // const leftnavigatorPage({Key? key}) : super(key: key);

//   @override
//   State<profilePage4> createState() => _profilePage4State();
// }

// class _profilePage4State extends State<profilePage4> {
//   final GlobalKey webViewKey = GlobalKey();
//   TextEditingController nicknamecontroller = TextEditingController();
//   TextEditingController firstnamecontroller = TextEditingController();
//   TextEditingController nicenamecontroller = TextEditingController();

//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   late File imageFile;
//   final picker = ImagePicker();
//   bool showSpinner = false;

//   //  if (_firstnameValid && _emailValid) {
//   //     var email;
//   //     var currentUserId;
//   //     usersRef.document(widget.currentUserId).updateData({
//   //       "firstame": firstname.text,
//   //       "lastame": lastname.text,
//   //       "email": email.text,
//   //       "password": Password.text,

//   //     });
//   //     SnackBar snackbar = SnackBar(content: Text("Profile updated!"));
//   //     _scaffoldKey.currentState.showSnackBar(snackbar);
//   //   }
//   // }

//   Future _getFromGallery() async {
//     final pickedFile = await ImagePicker().getImage(
//       source: ImageSource.gallery,
//       maxWidth: 1800,
//       maxHeight: 1800,
//     );
//     if (pickedFile != null) {
//       setState(() {
//         imageFile = File(pickedFile.path);
     
//       });
//     }
//   }

//   void initState() {
//     super.initState();
//     //_editprofile();
//   }

//   var profileData;
//   bool valuefirst = false;
//   bool valuesecond = false;

//   var box;

//   bool _showPassword = false;
//   void _togglevisibility() {
//     setState(() {
//       _showPassword = !_showPassword;
//     });
//   }

//   //var facebookLogin = FacebookLogin();


//   bool _obscureText = true;
//   void _toggle() {
//     setState(() {
//       _obscureText = !_obscureText;
//     });
//   }

  

//   bool isSwitched = false;
//   var textValue = 'Switch is OFF';

//   void toggleSwitch(bool value) {
//     if (isSwitched == false) {
//       setState(() {
//         isSwitched = true;
//         textValue = 'Switch Button is ON';
//       });
//     } else {
//       setState(() {
//         isSwitched = false;
//         textValue = 'Switch Button is OFF';
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xffE5E5E5),
//       appBar: AppBar(
//         backgroundColor: Color(0xffE5E5E5),
//         //  backgroundColor: Colors.transparent,
//         elevation: 0.0,
//         title: Text(
//           "Jane Cooper",
//           style: GoogleFonts.poppins(
//               color: Color(0xff0093ED),
//               fontSize: 18,
//               fontWeight: FontWeight.w600),
//         ),
//         leading: InkWell(
//           onTap: (() {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => ViewfriendPage()),
//             );
//           }),
//           child: Container(
//             padding: const EdgeInsets.only(
//               left: 20,
//             ),
//             child: Icon(
//               Icons.arrow_back_ios,
//               color: Color(0xff0093ED),
//             ),
//             // Image.asset(
//             //   'assets/images/Vector(53).png',
//             //   height: 0,
//             //   width: 0,
//             //   // width: MediaQuery.of(context).size.width * 0.94,
//             //   // height: MediaQuery.of(context).size.height * 0.14,
//             // ),
//           ),
//         ),
//         actions: <Widget>[
//           Padding(
//             padding: EdgeInsets.only(right: 20.0),
//           ),
//           Padding(
//               padding: EdgeInsets.only(right: 20.0),
//               child: GestureDetector(
//                 onTap: () {},
//                 child: Icon(
//                   Icons.more_vert,
//                   color: Color(0xff2B1B1F),
//                 ),
//               )),
//         ],
//       ),
//       // appBar: AppBar(
//       //   title: Container(
//       //     padding: const EdgeInsets.only(top: 0, left: 90),
//       //     child: Text(
//       //       "Profile",
//       //       style: TextStyle(
//       //         color: Color(0xcc343434),
//       //         fontSize: 20,
//       //       ),
//       //     ),
//       //   ),
//       //   leading: IconButton(
//       //     onPressed: () {
//       //       // Navigator.of(context).pushReplacement(
//       //       //     MaterialPageRoute(builder: (context) => Fuzzy()));
//       //     },
//       //     icon: const Icon(Icons.arrow_back),
//       //     color: Colors.grey[800],
//       //   ),
//       //   backgroundColor: Colors.transparent,
//       //   elevation: 0.0,
//       // ),
//       body: SingleChildScrollView(
//           child: Container(
//         child: Container(
//           padding: EdgeInsets.only(top: 20),
//           width: double.infinity,

//           //  height: 350.0,
//           child: Center(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 InkWell(
//                   onTap: _getFromGallery,
//                   child: Container(
//                     color: Colors.amber,
//                     child: Stack(
//                       children: [
//                         Image.asset(
//                           'assets/images/Group(8).png',
//                           height: 80.0,
//                           width: 80.0,
//                           // width: MediaQuery.of(context).size.width * 0.94,
//                           // height: MediaQuery.of(context).size.height * 0.14,
//                         ),
//                         Positioned(
//                           top: 52,
//                           left: 22,
//                           child: Container(
//                             height: 30.0,
//                             width: 30.0,
//                             decoration: const BoxDecoration(
//                                 image: DecorationImage(
//                               image: AssetImage("assets/images/Group(9).png"),
//                               fit: BoxFit.cover,
//                             )),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.only(
//                     top: 20,
//                   ),
//                   child: Text(
//                     "Jane Cooper",
//                     style: GoogleFonts.poppins(
//                         color: Color(0xff00253A),
//                         fontSize: 14,
//                         fontWeight: FontWeight.w600),
//                   ),
//                 ),
//                 Container(
//                     // padding: EdgeInsets.only(top: 7, left: 50),
//                     child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       'Online',
//                       style: GoogleFonts.poppins(
//                           color: Color(0xff27AE60),
//                           fontSize: 12,
//                           fontWeight: FontWeight.w400),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(right: 15),
//                     ),
//                     ClipOval(
//                       child: Container(
//                         height: 9,
//                         width: 9,
//                         color: Color(0xff27AE60),
//                       ),
//                     ),
//                   ],
//                 )),
//                 Container(
//                   margin:
//                       new EdgeInsets.symmetric(horizontal: 30.0, vertical: 15),
//                   padding: EdgeInsets.only(top: 10, left: 40),
//                   child: Container(
//                     width: 300,
//                     padding: const EdgeInsets.only(top: 5, right: 10),
//                     child: (Row(
//                       children: <Widget>[
//                         InkWell(
//                           onTap: () {
//                             // acceptbutton(User);
//                           },
//                           child: Container(
//                             padding: const EdgeInsets.only(bottom: 3),
//                             height: 65,
//                             width: 125,
//                             child: Card(
//                               color: const Color(0xff0093ED),
//                               child: Column(
//                                 children: <Widget>[
//                                   Container(
//                                     padding: const EdgeInsets.only(top: 15),
//                                     //height: 60,

//                                     child: Text(
//                                       "Play",
//                                       style: GoogleFonts.poppins(
//                                           color: Color(0xffFFFFFF),
//                                           fontSize: 16,
//                                           fontWeight: FontWeight.w600),
//                                       textAlign: TextAlign.center,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               //margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0),
//                             ),
//                           ),
//                         ),
//                         InkWell(
//                           onTap: () {
//                             // setState(() {
//                             //   //  ignoredelete([index]["id"]);
//                             //   ignoredelete();
//                             //   isLoadingignore
//                             //       ? Center(
//                             //           child:
//                             //               CircularProgressIndicator())
//                             //       : Navigator.push(
//                             //           this.context,
//                             //           MaterialPageRoute(
//                             //               builder:
//                             //                   (context) =>
//                             //                       MyWidget()));
//                             // });
//                           },
//                           child: Container(
//                             decoration: BoxDecoration(
//                               shape: BoxShape.rectangle,
//                               borderRadius: BorderRadius.circular(4),
//                               border: Border.all(
//                                 color: Color(0xff0093ED),
//                                 width: 1,
//                               ),
//                             ),
//                             padding: const EdgeInsets.only(top: 15),
//                             height: 55,
//                             width: 125,
//                             child: Text(
//                               "Unfriend",
//                               style: GoogleFonts.poppins(
//                                   color: Color(0xff0093ED),
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w600),
//                               textAlign: TextAlign.center,
//                             ),
//                             // child: Card(
//                             //   color: const Color(0xffffffff),
//                             //   child: Column(
//                             //     children: <Widget>[
//                             //       Container(
//                             //         padding: const EdgeInsets.only(top: 15),
//                             //         //height: 60,

//                             //         child: Text(
//                             //           "Unfriend",
//                             //           style: GoogleFonts.poppins(
//                             //               color: Color(0xff0093ED),
//                             //               fontSize: 16,
//                             //               fontWeight: FontWeight.w600),
//                             //           textAlign: TextAlign.center,
//                             //         ),
//                             //       ),
//                             //     ],
//                             //   ),
//                             //   //margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0),
//                             // ),
//                           ),
//                         ),
//                       ],
//                     )),
//                   ),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.only(top: 0, right: 290),
//                   child: Text(
//                     "Stats",
//                     style: GoogleFonts.poppins(
//                         color: Color(0xff00253A),
//                         fontSize: 15,
//                         fontWeight: FontWeight.w600),
//                   ),
//                 ),
//                 Row(
//                   children: [
//                     Container(
//                       margin: const EdgeInsets.only(left: 20, top: 12),
//                       width: 170,
//                       height: 80,
//                       child: Card(
//                         elevation: 0,
//                         color: Color(0xffF1F6FF),
//                         child: Column(
//                           children: <Widget>[
//                             Container(
//                               padding: EdgeInsets.only(left: 0, top: 23),
//                               child: Text(
//                                 "Games total",
//                                 style: GoogleFonts.poppins(
//                                   color: Color(0xff828282),
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                                 textAlign: TextAlign.center,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     Container(
//                       margin: const EdgeInsets.only(top: 12, right: 20),
//                       width: 170,
//                       height: 80,
//                       child: Card(
//                         elevation: 0,
//                         color: Color(0xffF1F6FF),
//                         child: Column(
//                           children: <Widget>[
//                             Container(
//                               padding: EdgeInsets.only(left: 0, top: 23),
//                               child: Text(
//                                 "Discussions forums",
//                                 style: GoogleFonts.poppins(
//                                   color: Color(0xff828282),
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                                 textAlign: TextAlign.center,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Container(
//                       margin: const EdgeInsets.only(left: 20, top: 0),
//                       width: 170,
//                       height: 80,
//                       child: Card(
//                         elevation: 0,
//                         color: Color(0xffF1F6FF),
//                         child: Row(
//                           children: <Widget>[
//                             Container(
//                               height: 45,
//                               padding: EdgeInsets.only(left: 30, right: 12),
//                               child: Image.asset('assets/images/Polygon.png'),
//                             ),
//                             GestureDetector(
//                               onTap: () {
//                                 // Navigator.push(
//                                 //     context,
//                                 //     MaterialPageRoute(
//                                 //         builder: (BuildContext context) =>
//                                 //             MygroupnewPage()));
//                               },
//                               child: Container(
//                                 padding: EdgeInsets.only(left: 0),
//                                 child: Text(
//                                   "Bronze",
//                                   style: GoogleFonts.poppins(
//                                     color: Color(0xff00253A),
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                   textAlign: TextAlign.left,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     Container(
//                       margin: const EdgeInsets.only(top: 0, right: 20),
//                       width: 170,
//                       height: 80,
//                       child: Card(
//                         elevation: 0,
//                         color: Color(0xffF1F6FF),
//                         child: Row(
//                           children: <Widget>[
//                             Container(
//                               height: 45,
//                               padding: EdgeInsets.only(left: 50, right: 8),
//                               child: Image.asset('assets/images/flames 1.png'),
//                             ),
//                             GestureDetector(
//                               onTap: () {
//                                 // Navigator.push(
//                                 //     context,
//                                 //     MaterialPageRoute(
//                                 //         builder: (BuildContext context) =>
//                                 //             Activityfeed()));
//                               },
//                               child: Container(
//                                 padding: EdgeInsets.only(left: 0),
//                                 child: Text(
//                                   "25",
//                                   style: GoogleFonts.poppins(
//                                     color: Color(0xff00253A),
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                   textAlign: TextAlign.left,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Container(
//                   margin:
//                       new EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
//                   padding: EdgeInsets.only(top: 10),
//                   width: 390,
//                   height: 230,
//                   child: Card(
//                       elevation: 0,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(0.0),
//                       ),
//                       color: Color(0xffF1F6FF),
//                       child: Column(children: [
//                         Container(
//                           padding: const EdgeInsets.only(
//                               top: 70, left: 30, right: 30),
//                           child: Text(
//                             "Playing statistics for the last 7 days (day/experience)",
//                             style: GoogleFonts.poppins(
//                                 color: Color(0xff000000),
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w600),
//                           ),
//                         ),
//                       ])),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(top: 10, right: 20, left: 20),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.only(top: 18),
//                   margin:
//                       new EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
//                   alignment: Alignment.centerLeft,
//                   child: Row(children: <Widget>[
//                     Text(
//                       "Friends",
//                       style: GoogleFonts.poppins(
//                           color: Color(0xff00253A),
//                           fontSize: 14,
//                           fontWeight: FontWeight.w600),
//                     ),
//                     Padding(padding: const EdgeInsets.only(right: 236)),
//                     InkWell(
//                         onTap: (() {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => ViewfriendPage()),
//                           );
//                         }),
//                         child: Text(
//                           "View all",
//                           style: GoogleFonts.poppins(
//                               color: Color(0xff0093ED),
//                               fontSize: 14,
//                               fontWeight: FontWeight.w600),
//                         ))
//                   ]),
//                 ),
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height * 0.44,
//                   child: ListView.builder(
//                     itemCount: 4,
//                     //scrollDirection: Axis.vertical,
//                     padding: const EdgeInsets.all(16),
//                     itemBuilder: (context, i) {
//                       return InkWell(
//                           onTap: () {
//                             // Navigator.of(context).push(MaterialPageRoute(
//                             //     builder: (context) => LoginDemo()));
//                           },
//                           child: Container(
//                             height: 80,
//                             child: Card(
//                               shape: RoundedRectangleBorder(
//                                 //<-- 1. SEE HERE
//                                 side: BorderSide(
//                                   color: Colors.grey.withOpacity(0.7),
//                                   width: 1,
//                                 ),
//                                 borderRadius: BorderRadius.circular(0.0),
//                               ),
//                               color: Color(0xfffffffff),
// // Colors.blue,
//                               elevation: 0,
//                               child: Row(
//                                 children: <Widget>[
//                                   Padding(
//                                     padding: EdgeInsets.all(10.0),
//                                     child: GestureDetector(
//                                       onTap: () {},
//                                       child: Text(
//                                         "1",
//                                         style: GoogleFonts.poppins(
//                                             color: Color(0xffBDBDBD),
//                                             fontSize: 18,
//                                             fontWeight: FontWeight.w600),
//                                       ),
//                                     ),
//                                   ),
//                                   Container(
//                                     width: 41.0,
//                                     height: 40.0,
//                                     decoration: BoxDecoration(
//                                       color: Color(0xffB6E1F3),
//                                       image: DecorationImage(
//                                           image: AssetImage(
//                                               'assets/images/Group 173.png'),
//                                           fit: BoxFit.cover),
//                                       borderRadius: BorderRadius.all(
//                                           Radius.circular(5.0)),
//                                       // ignore: prefer_const_literals_to_create_immutables
//                                       // boxShadow: [
//                                       //   BoxShadow(blurRadius: 7.0, color: Colors.black)
//                                       // ]
//                                     ),
//                                   ),
//                                   Container(
//                                     padding: EdgeInsets.all(10.0),
//                                     child: Text(
//                                       "Wade Warren",
//                                       style: GoogleFonts.poppins(
//                                           color: Color(0xff00253A),
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.w600),
//                                     ),
//                                   ),
//                                   Container(
//                                     padding: const EdgeInsets.only(left: 91),
//                                     child: Text(
//                                       "Exp 1400",
//                                       style: GoogleFonts.poppins(
//                                           color: Color(0xff828282),
//                                           fontSize: 12,
//                                           fontWeight: FontWeight.w500),
//                                     ),
//                                   ),
//                                   // child: Chip(
//                                   //   label: Text('France'),
//                                   //   // shadowColor: Colors.blue,
//                                   //   // backgroundColor: Colors.green,
//                                   //   // elevation: 10,
//                                   //   // autofocus: true,
//                                   // )),
//                                 ],
//                               ),
//                             ),
//                           ));
//                     },
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(top: 10, right: 20, left: 20),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.only(top: 18),
//                   margin:
//                       new EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
//                   alignment: Alignment.centerLeft,
//                   child: Row(children: <Widget>[
//                     Text(
//                       "Achivements",
//                       style: GoogleFonts.poppins(
//                           color: Color(0xff00253A),
//                           fontSize: 14,
//                           fontWeight: FontWeight.w600),
//                     ),
//                     Padding(padding: const EdgeInsets.only(right: 10)),
//                     Text(
//                       "15/45",
//                       style: GoogleFonts.poppins(
//                           color: Color(0xff0093ED),
//                           fontSize: 14,
//                           fontWeight: FontWeight.w600),
//                     ),
//                     Padding(padding: const EdgeInsets.only(right: 137)),
//                     InkWell(
//                         onTap: (() {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => AchievmentPage2()),
//                           );
//                         }),
//                         child: Text(
//                           "View all",
//                           style: GoogleFonts.poppins(
//                               color: Color(0xff0093ED),
//                               fontSize: 14,
//                               fontWeight: FontWeight.w600),
//                         ))
//                   ]),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.only(top: 7),
//                   margin:
//                       new EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
//                   height: 100.0,
//                   child: ListView(
//                     // padding: const EdgeInsets.only(
//                     //   left: 0,
//                     //   right: 10,
//                     // ),

//                     // This next line does the trick.
//                     scrollDirection: Axis.horizontal,

//                     children: <Widget>[
//                       Container(
//                         margin: new EdgeInsets.symmetric(
//                           horizontal: 8.0,
//                         ),
//                         // padding: EdgeInsets.only(top: 10),
//                         width: 114,
//                         height: 114,
//                         child: Card(
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(0.0),
//                           ),
//                           color: Color(0xffF1F6FF),
//                           // child: Column(children: [
//                           //   Container(
//                           //     padding: const EdgeInsets.only(
//                           //         top: 70, left: 30, right: 30),
//                           //     child: Text(
//                           //       "Playing statistics for the last 7 days (day/experience)",
//                           //       style: GoogleFonts.poppins(
//                           //           color: Color(0xff000000),
//                           //           fontSize: 14,
//                           //           fontWeight: FontWeight.w600),
//                           //     ),
//                         ),
//                       ),
//                       Container(
//                         margin: new EdgeInsets.symmetric(
//                           horizontal: 8.0,
//                         ),
//                         // padding: EdgeInsets.only(top: 10),
//                         width: 114,
//                         height: 114,
//                         child: Card(
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(0.0),
//                           ),
//                           color: Color(0xffF1F6FF),
//                           // child: Column(children: [
//                           //   Container(
//                           //     padding: const EdgeInsets.only(
//                           //         top: 70, left: 30, right: 30),
//                           //     child: Text(
//                           //       "Playing statistics for the last 7 days (day/experience)",
//                           //       style: GoogleFonts.poppins(
//                           //           color: Color(0xff000000),
//                           //           fontSize: 14,
//                           //           fontWeight: FontWeight.w600),
//                           //     ),
//                         ),
//                       ),
//                       Container(
//                         margin: new EdgeInsets.symmetric(
//                           horizontal: 8.0,
//                         ),
//                         // padding: EdgeInsets.only(top: 10),
//                         width: 114,
//                         height: 114,
//                         child: Card(
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(0.0),
//                           ),
//                           color: Color(0xffF1F6FF),
//                           // child: Column(children: [
//                           //   Container(
//                           //     padding: const EdgeInsets.only(
//                           //         top: 70, left: 30, right: 30),
//                           //     child: Text(
//                           //       "Playing statistics for the last 7 days (day/experience)",
//                           //       style: GoogleFonts.poppins(
//                           //           color: Color(0xff000000),
//                           //           fontSize: 14,
//                           //           fontWeight: FontWeight.w600),
//                           //     ),
//                         ),
//                       ),
//                       Container(
//                         margin: new EdgeInsets.symmetric(
//                           horizontal: 8.0,
//                         ),
//                         // padding: EdgeInsets.only(top: 10),
//                         width: 114,
//                         height: 114,
//                         child: Card(
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(0.0),
//                           ),
//                           color: Color(0xffF1F6FF),
//                           // child: Column(children: [
//                           //   Container(
//                           //     padding: const EdgeInsets.only(
//                           //         top: 70, left: 30, right: 30),
//                           //     child: Text(
//                           //       "Playing statistics for the last 7 days (day/experience)",
//                           //       style: GoogleFonts.poppins(
//                           //           color: Color(0xff000000),
//                           //           fontSize: 14,
//                           //           fontWeight: FontWeight.w600),
//                           //     ),
//                         ),
//                       ),
//                       Container(
//                         margin: new EdgeInsets.symmetric(
//                           horizontal: 8.0,
//                         ),
//                         // padding: EdgeInsets.only(top: 10),
//                         width: 114,
//                         height: 114,
//                         child: Card(
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(0.0),
//                           ),
//                           color: Color(0xffF1F6FF),
//                           // child: Column(children: [
//                           //   Container(
//                           //     padding: const EdgeInsets.only(
//                           //         top: 70, left: 30, right: 30),
//                           //     child: Text(
//                           //       "Playing statistics for the last 7 days (day/experience)",
//                           //       style: GoogleFonts.poppins(
//                           //           color: Color(0xff000000),
//                           //           fontSize: 14,
//                           //           fontWeight: FontWeight.w600),
//                           //     ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(top: 10, right: 20, left: 20),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.only(top: 18),
//                   margin:
//                       new EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
//                   alignment: Alignment.centerLeft,
//                   child: Row(children: <Widget>[
//                     Text(
//                       "Pack collection    3/4",
//                       style: GoogleFonts.poppins(
//                           color: Color(0xff00253A),
//                           fontSize: 14,
//                           fontWeight: FontWeight.w600),
//                     ),
//                     Padding(padding: const EdgeInsets.only(right: 10)),
//                     Text(
//                       "Matches",
//                       style: GoogleFonts.poppins(
//                           color: Color(0xff0093ED),
//                           fontSize: 14,
//                           fontWeight: FontWeight.w600),
//                     ),
//                     Padding(padding: const EdgeInsets.only(right: 67)),
//                     Transform.scale(
//                         scale: 1,
//                         child: Switch(
//                           onChanged: toggleSwitch,
//                           value: isSwitched,
//                           activeColor: Colors.blue,
//                           activeTrackColor: Color(0xff7DD8FF),
//                           inactiveThumbColor: Color(0xff0072B1),
//                           inactiveTrackColor: Color(0xff7DD8FF),
//                         )),
//                   ]),
//                 ),
//                 Container(
//                   height: 200,
//                   child: Row(
//                     children: [
//                       Container(
//                         height: 200,
//                         width: MediaQuery.of(context).size.width / 2 -
//                             32, // minus 32 due to the margin
//                         margin: EdgeInsets.all(16.0),
//                         padding: EdgeInsets.all(16.0),
//                         decoration: BoxDecoration(
//                           color: Color(0xffF1F6FF),
//                           // background color of the cards
//                           borderRadius: BorderRadius.all(Radius.circular(0.0)),
//                           boxShadow: [],
//                         ),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment
//                               .end, // posion the everything to the bottom
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             // place here your image
//                             Image.asset(
//                               'assets/images/Group 114(1).png',
//                               height: 65,
//                               width: 65,
//                             ),
//                             Padding(padding: const EdgeInsets.only(top: 20)),
//                             Text(
//                               "Pack 1 name",
//                               style: GoogleFonts.poppins(
//                                   color: Color(0xff2B1B1F),
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w600),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         height: 200,
//                         width: MediaQuery.of(context).size.width / 2 -
//                             32, // minus 32 due to the margin
//                         margin: EdgeInsets.all(16.0),
//                         padding: EdgeInsets.all(16.0),
//                         decoration: BoxDecoration(
//                           color: Color(0xffF1F6FF),

//                           // background color of the cards
//                           borderRadius: BorderRadius.all(Radius.circular(0.0)),
//                           boxShadow: [],
//                         ),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment
//                               .end, // posion the everything to the bottom
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             // place here your image
//                             Image.asset(
//                               'assets/images/Group 114(1).png',
//                               height: 65,
//                               width: 65,
//                             ),
//                             Padding(padding: const EdgeInsets.only(top: 20)),
//                             Text(
//                               "Pack 1 name",
//                               style: GoogleFonts.poppins(
//                                   color: Color(0xff2B1B1F),
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w600),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   height: 200,
//                   child: Row(
//                     children: [
//                       Container(
//                         height: 200,
//                         width: MediaQuery.of(context).size.width / 2 -
//                             32, // minus 32 due to the margin
//                         margin: EdgeInsets.all(16.0),
//                         padding: EdgeInsets.all(16.0),
//                         decoration: BoxDecoration(
//                           color: Color(0xffF1F6FF),
//                           // background color of the cards
//                           borderRadius: BorderRadius.all(Radius.circular(0.0)),
//                           boxShadow: [],
//                         ),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment
//                               .end, // posion the everything to the bottom
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             // place here your image
//                             Image.asset(
//                               'assets/images/Group 114(1).png',
//                               height: 65,
//                               width: 65,
//                             ),
//                             Padding(padding: const EdgeInsets.only(top: 20)),
//                             Text(
//                               "Pack 1 name",
//                               style: GoogleFonts.poppins(
//                                   color: Color(0xff2B1B1F),
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w600),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         height: 200,
//                         width: MediaQuery.of(context).size.width / 2 -
//                             32, // minus 32 due to the margin
//                         margin: EdgeInsets.all(16.0),
//                         padding: EdgeInsets.all(16.0),
//                         decoration: BoxDecoration(
//                           color: Color(0xffF1F6FF),
//                           // background color of the cards
//                           borderRadius: BorderRadius.all(Radius.circular(0.0)),
//                           boxShadow: [],
//                         ),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment
//                               .end, // posion the everything to the bottom
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             // place here your image
//                             Image.asset(
//                               'assets/images/Group 114(1).png',
//                               height: 65,
//                               width: 65,
//                             ),
//                             Padding(padding: const EdgeInsets.only(top: 20)),
//                             Text(
//                               "Pack 1 name",
//                               style: GoogleFonts.poppins(
//                                   color: Color(0xff2B1B1F),
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w600),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   height: 200,
//                   child: Row(
//                     children: [
//                       Container(
//                         height: 200,
//                         width: MediaQuery.of(context).size.width / 2 -
//                             32, // minus 32 due to the margin
//                         margin: EdgeInsets.all(16.0),
//                         padding: EdgeInsets.all(16.0),
//                         decoration: BoxDecoration(
//                           color: Color(0xffF1F6FF),
//                           // background color of the cards
//                           borderRadius: BorderRadius.all(Radius.circular(0.0)),
//                           boxShadow: [],
//                         ),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment
//                               .end, // posion the everything to the bottom
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             // place here your image
//                             Image.asset(
//                               'assets/images/Group 114(1).png',
//                               height: 65,
//                               width: 65,
//                             ),
//                             Padding(padding: const EdgeInsets.only(top: 20)),
//                             Text(
//                               "Pack 1 name",
//                               style: GoogleFonts.poppins(
//                                   color: Color(0xff2B1B1F),
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w600),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         height: 200,
//                         width: MediaQuery.of(context).size.width / 2 -
//                             32, // minus 32 due to the margin
//                         margin: EdgeInsets.all(16.0),
//                         padding: EdgeInsets.all(16.0),
//                         decoration: BoxDecoration(
//                           color: Color(0xffF1F6FF),
//                           // background color of the cards
//                           borderRadius: BorderRadius.all(Radius.circular(0.0)),
//                           boxShadow: [],
//                         ),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment
//                               .end, // posion the everything to the bottom
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             // place here your image
//                             Image.asset(
//                               'assets/images/Group 114(1).png',
//                               height: 65,
//                               width: 65,
//                             ),
//                             Padding(padding: const EdgeInsets.only(top: 20)),
//                             Text(
//                               "Pack 1 name",
//                               style: GoogleFonts.poppins(
//                                   color: Color(0xff2B1B1F),
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w600),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       )),
//     );
//   }

//   static ImagePicker() {}
// }

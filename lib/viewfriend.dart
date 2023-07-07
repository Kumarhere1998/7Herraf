// // ignore_for_file: prefer_const_constructors, must_be_immutable

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:herraf_app/newprofile.dart';
// import 'package:herraf_app/viewprofilefriend.dart';


// class ViewfriendPage extends StatefulWidget {
//   // ignore: use_key_in_widget_constructors

//   var child;

//   // const leftnavigatorPage({Key? key}) : super(key: key);

//   @override
//   State<ViewfriendPage> createState() => _ViewfriendPageState();
// }

// class _ViewfriendPageState extends State<ViewfriendPage> {
//   final GlobalKey webViewKey = GlobalKey();

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

//   void initState() {
//     super.initState();
//     //_editprofile();
//   }

//   var profileData;
//   bool valuefirst = false;
//   bool valuesecond = false;

//   var box;

//   //var facebookLogin = FacebookLogin();


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xffE5E5E5),
//       appBar: AppBar(
//         backgroundColor: Color(0xffE5E5E5),
//         elevation: 0.0,
//         title: Text(
//           "Friends",
//           style: GoogleFonts.poppins(
//               color: Color(0xff0093ED),
//               fontSize: 18,
//               fontWeight: FontWeight.w600),
//         ),
//         leading: InkWell(
//           onTap: (() {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => profilePage2()),
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
//                 child: Container(
//                   child: Image.asset(
//                     'assets/images/Frame(4).png',
//                     height: 23,
//                     width: 23,
//                     // width: MediaQuery.of(context).size.width * 0.94,
//                     // height: MediaQuery.of(context).size.height * 0.14,
//                   ), // <-- SEE HERE
//                 ),
//               )),
//         ],
//       ),
//       body: SingleChildScrollView(
//           child: Container(
//         child: Container(
//           padding: EdgeInsets.only(top: 20),
//           width: double.infinity,

//           //  height: 350.0,
//           child: SizedBox(
//             height: MediaQuery.of(context).size.height * 0.9,
//             child: DefaultTabController(
//                 length: 2, // length of tabs
//                 // initialIndex: 0,
//                 child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                     children: <Widget>[
//                       Container(
//                         padding: const EdgeInsets.only(
//                           top: 10,
//                           left: 83,
//                           //right: 75,
//                         ),
//                         child: TabBar(
//                           indicatorColor: Color(0xff0093ED),
//                           indicatorWeight: 6,
//                           isScrollable: true,
//                           labelColor: Color(0xff00253A),
//                           unselectedLabelColor: Color(0xff00253A),
//                           tabs: [
//                             Tab(
//                               child: Container(
//                                 // alignment: Alignment.center,
//                                 //  constraints: BoxConstraints.expand(),
//                                 child: Text(
//                                   "Friends list",
//                                   style: GoogleFonts.poppins(
//                                       // color: Color(0xff0093ED),
//                                       fontSize: 14,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                             ),
//                             Tab(
//                               child: Container(
//                                 // padding: const EdgeInsets.only(
//                                 //   left: 65,
//                                 //   //right: 75,
//                                 // ),
//                                 //  alignment: Alignment.center,
//                                 //  constraints: BoxConstraints.expand(),
//                                 //  color: BLUE_DEEP,
//                                 child: Text(
//                                   "Requests",
//                                   style: GoogleFonts.poppins(
//                                       // color: Color(0xff0093ED),
//                                       fontSize: 14,
//                                       fontWeight: FontWeight.w700),
//                                   //   ),
//                                 ),
//                               ),
//                             ),
//                             // Tab(
//                             //     child: Container(
//                             //   //  padding: EdgeInsets.only(left: 20, right: 0),
//                             //   child: Text(
//                             //     "All",
//                             //     style: GoogleFonts.poppins(
//                             //         // color: Color(0xff0093ED),
//                             //         fontSize: 18,
//                             //         fontWeight: FontWeight.w700),
//                             //   ),
//                             // )),
//                             // Tab(
//                             //     child: Container(
//                             //   padding: EdgeInsets.only(left: 81, right: 0),
//                             //   child: Text(
//                             //     "My flashcards",
//                             //     style: GoogleFonts.poppins(
//                             //         // color: Color(0xff0093ED),
//                             //         fontSize: 18,
//                             //         fontWeight: FontWeight.w700),
//                             //   ),
//                             // )),
//                           ],
//                         ),
//                       ),
//                       Container(
//                           padding: EdgeInsets.only(
//                             top: 10,
//                           ),
//                           width: 180,
//                           height: MediaQuery.of(context).size.height * 0.8,
//                           // width: 900, //height of TabBarView
//                           decoration: BoxDecoration(),
//                           child: TabBarView(children: <Widget>[
//                             ListView(
//                               children: [
//                                 SizedBox(
//                                   height:
//                                       MediaQuery.of(context).size.height * 0.5,
//                                   child: ListView.builder(
//                                     itemCount: 4,
//                                     scrollDirection: Axis.vertical,
//                                     padding: const EdgeInsets.all(16),
//                                     itemBuilder: (context, i) {
//                                       return InkWell(
//                                           onTap: () {
//                                             // Navigator.of(context).push(MaterialPageRoute(
//                                             //     builder: (context) => LoginDemo()));
//                                           },
//                                           child: Container(
//                                             height: 80,
//                                             child: Card(
//                                               //     decoration: BoxDecoration(
//                                               // borderRadius:
//                                               //     BorderRadius.circular(0.0),
//                                               // color: Color(0xffB6E1F3),
//                                               // border: Border.all(
//                                               //   color:
//                                               //       Colors.grey.withOpacity(0.7),
//                                               //   width: 1,
//                                               // )),
//                                               shape: RoundedRectangleBorder(
//                                                 //<-- 1. SEE HERE
//                                                 side: BorderSide(
//                                                   color: Colors.grey
//                                                       .withOpacity(0.7),
//                                                   width: 1,
//                                                 ),
//                                                 borderRadius:
//                                                     BorderRadius.circular(0.0),
//                                               ),
//                                               color: Color(0xfffffffff),
// // Colors.blue,
//                                               elevation: 0,
//                                               child: ListTile(
//                                                   title: Container(
//                                                     padding:
//                                                         const EdgeInsets.only(
//                                                       top: 10,
//                                                     ),
//                                                     //  padding: EdgeInsets.all(10.0),
//                                                     child: Text(
//                                                       "Jane Cooper",
//                                                       style:
//                                                           GoogleFonts.poppins(
//                                                               color: Color(
//                                                                   0xff00253A),
//                                                               fontSize: 14,
//                                                               fontWeight:
//                                                                   FontWeight
//                                                                       .w600),
//                                                     ),
//                                                   ),
//                                                   subtitle: Row(
//                                                     children: <Widget>[
//                                                       Container(
//                                                         //   padding: EdgeInsets.all(10.0),
//                                                         child: Text(
//                                                           "Online",
//                                                           style: GoogleFonts
//                                                               .poppins(
//                                                                   color: Color(
//                                                                       0xff27AE60),
//                                                                   fontSize: 12,
//                                                                   fontWeight:
//                                                                       FontWeight
//                                                                           .w400),
//                                                         ),
//                                                       ),
//                                                       // Container(
//                                                       //   //  padding: EdgeInsets.all(0.0),
//                                                       //   child: Text(
//                                                       //     ".",
//                                                       //     style: GoogleFonts.poppins(
//                                                       //         color: Color(0xff27AE60),
//                                                       //         fontSize: 24,
//                                                       //         fontWeight:
//                                                       //             FontWeight.w600),
//                                                       //   ),
//                                                       // ),
//                                                     ],
//                                                   ),
//                                                   leading: Container(
//                                                     width: 41.0,
//                                                     height: 40.0,
//                                                     decoration: BoxDecoration(
//                                                       color: Color(0xffB6E1F3),
//                                                       image: DecorationImage(
//                                                           image: AssetImage(
//                                                               'assets/images/Group 173.png'),
//                                                           fit: BoxFit.cover),
//                                                       borderRadius:
//                                                           BorderRadius.all(
//                                                               Radius.circular(
//                                                                   5.0)),
//                                                       // ignore: prefer_const_literals_to_create_immutables
//                                                       // boxShadow: [
//                                                       //   BoxShadow(blurRadius: 7.0, color: Colors.black)
//                                                       // ]
//                                                     ),
//                                                   ),
//                                                   trailing: InkWell(
//                                                     onTap: (() {
//                                                       Navigator.push(
//                                                         context,
//                                                         MaterialPageRoute(
//                                                             builder: (context) =>
//                                                                 profilePage4()),
//                                                       );
//                                                     }),
//                                                     child: Container(
//                                                       //   padding: EdgeInsets.all(10.0),
//                                                       child: Text(
//                                                         "View profile",
//                                                         style:
//                                                             GoogleFonts.poppins(
//                                                                 color: Color(
//                                                                     0xff0093ED),
//                                                                 fontSize: 14,
//                                                                 fontWeight:
//                                                                     FontWeight
//                                                                         .w600),
//                                                       ),
//                                                     ),
//                                                   )),
//                                             ),
//                                           ));
//                                     },
//                                   ),
//                                 ),
//                                 Container(
//                                     margin: new EdgeInsets.symmetric(
//                                       horizontal: 20.0,
//                                     ),
//                                     padding: EdgeInsets.only(top: 10),
//                                     width: 390,
//                                     height: 200,
//                                     child: Card(
//                                         elevation: 0,
//                                         shape: RoundedRectangleBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(0.0),
//                                         ),
//                                         color: Color(0xffF1F6FF),
//                                         child: Column(children: [
//                                           Container(
//                                             padding: const EdgeInsets.only(
//                                                 top: 30, left: 30, right: 70),
//                                             child: Text(
//                                               "Received a code from your friend?",
//                                               style: GoogleFonts.poppins(
//                                                   color: Color(0xff00253A),
//                                                   fontSize: 18,
//                                                   fontWeight: FontWeight.w700),
//                                             ),
//                                           ),
//                                           Container(
//                                               margin: const EdgeInsets.only(
//                                                   left: 30.0, top: 15.0),
//                                               child: Row(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment.start,
//                                                   children: <Widget>[
//                                                     // MaterialButton(
//                                                     //   shape: const RoundedRectangleBorder(
//                                                     //       borderRadius:
//                                                     //           BorderRadius.all(
//                                                     //               Radius
//                                                     //                   .circular(
//                                                     //                       2.0))),
//                                                     //   elevation: 5.0,
//                                                     //   minWidth: 130.0,
//                                                     //   height: 50,
//                                                     //   color: Color(0xff0093ED),
//                                                     //   onPressed: () {
//                                                     //     // Navigator.of(context).push(
//                                                     //     //     MaterialPageRoute(
//                                                     //     //         builder:
//                                                     //     //             (context) =>
//                                                     //     //                 OtpScreen()));
//                                                     //   },
//                                                     //   child: Text(
//                                                     //     "Enter",
//                                                     //     style:
//                                                     //         GoogleFonts.poppins(
//                                                     //             color: Color(
//                                                     //                 0xffffffff),
//                                                     //             fontSize: 16,
//                                                     //             fontWeight:
//                                                     //                 FontWeight
//                                                     //                     .w600),
//                                                     //     textAlign:
//                                                     //         TextAlign.center,
//                                                     //   ),
//                                                     // ),

//                                                     // use the email provided here
//                                                   ])),
//                                         ]))),
//                               ],
//                             ),
//                             Container(
//                               margin: new EdgeInsets.symmetric(
//                                 horizontal: 10.0,
//                               ),
//                               // child: Padding(
//                               //  padding: const EdgeInsets.all(8.0),
//                               child: ListView.builder(
//                                 itemCount: 1,
//                                 scrollDirection: Axis.vertical,
//                                 padding: const EdgeInsets.all(16),
//                                 itemBuilder: (context, i) {
//                                   return InkWell(
//                                       onTap: () {
//                                         // Navigator.of(context).push(MaterialPageRoute(
//                                         //     builder: (context) => LoginDemo()));
//                                       },
//                                       child: Container(
//                                         decoration: BoxDecoration(
//                                             borderRadius:
//                                                 BorderRadius.circular(0.0),
//                                             color: Color(0xffB6E1F3),
//                                             border: Border.all(
//                                               color:
//                                                   Colors.grey.withOpacity(0.7),
//                                               width: 1,
//                                             )),
//                                         height: 170,
//                                         child: Container(
//                                           color: Color(0xfffffffff),
//                                           child: Column(
//                                             children: [
//                                               ListTile(
//                                                 leading: Container(
//                                                   width: 41.0,
//                                                   height: 40.0,
//                                                   decoration: BoxDecoration(
//                                                     color: Color(0xffB6E1F3),

//                                                     image: DecorationImage(
//                                                         image: AssetImage(
//                                                             'assets/images/Group 173.png'),
//                                                         fit: BoxFit.cover),
//                                                     borderRadius:
//                                                         BorderRadius.all(
//                                                             Radius.circular(
//                                                                 5.0)),
//                                                     // ignore: prefer_const_literals_to_create_immutables
//                                                     // boxShadow: [
//                                                     //   BoxShadow(blurRadius: 7.0, color: Colors.black)
//                                                     // ]
//                                                   ),
//                                                 ),
//                                                 title: Container(
//                                                   padding:
//                                                       const EdgeInsets.only(
//                                                     top: 10,
//                                                   ),
//                                                   //  padding: EdgeInsets.all(10.0),
//                                                   child: Text(
//                                                     "Jane Cooper",
//                                                     style: GoogleFonts.poppins(
//                                                         color:
//                                                             Color(0xff00253A),
//                                                         fontSize: 14,
//                                                         fontWeight:
//                                                             FontWeight.w600),
//                                                   ),
//                                                 ),
//                                                 trailing: Container(
//                                                   padding: EdgeInsets.all(10.0),
//                                                   child: Text(
//                                                     "View profile",
//                                                     style: GoogleFonts.poppins(
//                                                         color:
//                                                             Color(0xff0093ED),
//                                                         fontSize: 14,
//                                                         fontWeight:
//                                                             FontWeight.w600),
//                                                   ),
//                                                 ),
//                                                 subtitle: Wrap(
//                                                     spacing:
//                                                         13, // space between two icons
//                                                     children: <Widget>[
//                                                       Row(
//                                                         children: <Widget>[
//                                                           Container(
//                                                             //   padding: EdgeInsets.all(10.0),
//                                                             child: Text(
//                                                               "Online",
//                                                               style: GoogleFonts.poppins(
//                                                                   color: Color(
//                                                                       0xff27AE60),
//                                                                   fontSize: 12,
//                                                                   fontWeight:
//                                                                       FontWeight
//                                                                           .w400),
//                                                             ),
//                                                           ),
//                                                           // Container(
//                                                           //   //  padding: EdgeInsets.all(0.0),
//                                                           //   child: Text(
//                                                           //     ".",
//                                                           //     style: GoogleFonts.poppins(
//                                                           //         color: Color(0xff27AE60),
//                                                           //         fontSize: 24,
//                                                           //         fontWeight:
//                                                           //             FontWeight.w600),
//                                                           //   ),
//                                                           // ),
//                                                         ],
//                                                       ),
//                                                     ]),
//                                               ),
//                                               Container(
//                                                 width: 300,
//                                                 padding: const EdgeInsets.only(
//                                                     top: 5, right: 10),
//                                                 child: (Row(
//                                                   children: <Widget>[
//                                                     InkWell(
//                                                       onTap: () {
//                                                         // acceptbutton(User);
//                                                       },
//                                                       child: Container(
//                                                         padding:
//                                                             const EdgeInsets
//                                                                     .only(
//                                                                 bottom: 3),
//                                                         height: 67,
//                                                         width: 145,
//                                                         child: Card(
//                                                           color: const Color(
//                                                               0xffE5E5E5),
//                                                           child: Column(
//                                                             children: <Widget>[
//                                                               Container(
//                                                                 padding:
//                                                                     const EdgeInsets
//                                                                             .only(
//                                                                         top:
//                                                                             15),
//                                                                 //height: 60,

//                                                                 child: Text(
//                                                                   "Reject",
//                                                                   style: GoogleFonts.poppins(
//                                                                       color: Color(
//                                                                           0xff0093ED),
//                                                                       fontSize:
//                                                                           14,
//                                                                       fontWeight:
//                                                                           FontWeight
//                                                                               .w600),
//                                                                   textAlign:
//                                                                       TextAlign
//                                                                           .center,
//                                                                 ),
//                                                               ),
//                                                             ],
//                                                           ),
//                                                           //margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0),
//                                                         ),
//                                                       ),
//                                                     ),
//                                                     InkWell(
//                                                       onTap: () {
//                                                         // setState(() {
//                                                         //   //  ignoredelete([index]["id"]);
//                                                         //   ignoredelete();
//                                                         //   isLoadingignore
//                                                         //       ? Center(
//                                                         //           child:
//                                                         //               CircularProgressIndicator())
//                                                         //       : Navigator.push(
//                                                         //           this.context,
//                                                         //           MaterialPageRoute(
//                                                         //               builder:
//                                                         //                   (context) =>
//                                                         //                       MyWidget()));
//                                                         // });
//                                                       },
//                                                       child: Container(
//                                                         padding:
//                                                             const EdgeInsets
//                                                                     .only(
//                                                                 bottom: 3),
//                                                         height: 67,
//                                                         width: 145,
//                                                         child: Card(
//                                                           color: const Color(
//                                                               0xff0093ED),
//                                                           child: Column(
//                                                             children: <Widget>[
//                                                               Container(
//                                                                 padding:
//                                                                     const EdgeInsets
//                                                                             .only(
//                                                                         top:
//                                                                             15),
//                                                                 //height: 60,

//                                                                 child: Text(
//                                                                   "Accept",
//                                                                   style: GoogleFonts.poppins(
//                                                                       color: Color(
//                                                                           0xffF1F6FF),
//                                                                       fontSize:
//                                                                           14,
//                                                                       fontWeight:
//                                                                           FontWeight
//                                                                               .w600),
//                                                                   textAlign:
//                                                                       TextAlign
//                                                                           .center,
//                                                                 ),
//                                                               ),
//                                                             ],
//                                                           ),
//                                                           //margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0),
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 )),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ));
//                                 },
//                               ),
//                             ),
//                           ]))
//                     ])),
//           ),
//         ),
//       )),
//     );
//   }
// }

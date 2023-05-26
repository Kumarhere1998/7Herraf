// import 'package:flutter/material.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:herraf_app/allowscreen.dart';
// import 'package:herraf_app/api_servivce.dart';
// import 'package:herraf_app/qrscan1.dart';

// import 'package:shared_preferences/shared_preferences.dart';

// class GoogleloginPageNew extends StatefulWidget {
//   //const MyHomePage3({Key? key}) : super(key: key);

//   @override
//   State<GoogleloginPageNew> createState() => _GoogleloginPageNewState();
// }

// class _LoginData {
//   String id = "0";
//   String first_name = '';
//   String user_email = '';
//   String photo = '';
//   String type = '';
//   String user_password = '';
// }

// class _GoogleloginPageNewState extends State<GoogleloginPageNew> {
//   @override
//   final Color primaryColor = const Color(0xff18203d);
//   final Color secondaryColor = const Color(0xff232c51);

//   final Color logoGreen = const Color(0xff25bcbb);
//   GoogleSignIn _googleSignIn = GoogleSignIn(
//       // Optional clientId
//       // clientId: '479882132969-9i9aqik3jfjd7qhci1nqf0bm2g71rm1u.apps.googleusercontent.com',
//       scopes: <String>['email']);
//   _LoginData _loginData = new _LoginData();

//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   // _googleLogin() async {
//   //   print("calling me");
//   //   try {
//   //     GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
//   //     print(googleSignInAccount);
//   //   } catch (error) {
//   //     print(error);
//   //   }
//   // }

//   facebookLogin() async {
//     print("FaceBook");
//     try {
//       final result =
//           await FacebookAuth.i.login(permissions: ['public_profile', 'email']);
//       if (result.status == LoginStatus.success) {
//         final userData = await FacebookAuth.i.getUserData();
//         print(userData);
//       }
//     } catch (error) {
//       print(error);
//     }
//   }

//   _saveUserInfo(id, first_name, email, photo, type) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     print(first_name);
//     setState(() {
//       //    _loginData.id = id;
//       // _loginData.displayName = name;
//       // _loginData.email = email;
//       // _loginData.photoUrl = photo;
//       // _loginData.type = type;
//       // prefs.setString('id', id);
//       // prefs.setString('first_name', first_name);
//       // prefs.setString('user_email', email);
//       // prefs.setString('photo', photo);
//       // prefs.setString('login_type', type);

//       _loginData.id = id;
//       _loginData.first_name = first_name;
//       _loginData.user_email = email;
//       _loginData.photo = photo;
//       _loginData.type = type;

//       print(_loginData.first_name);
//       print(_loginData.photo);
//       print("hyy");
//       print("hyy");

//       print(_loginData);
//       ApiService.postLogin(_loginData).then((value) {
//         var res = value;
//         print(res["user_id"]);
//         print(res["photo"]);

//         prefs.setString("user_id", res["id"].toString());
//         prefs.setString("first_name", res["first_name"].toString());
//         prefs.setString("last_name", res["last_name"].toString());
//         prefs.setString("user_email", res["user_email"].toString());
//         prefs.setString("user_email", res["user_email"].toString());
//         prefs.setString("photo", res["photo"].toString());

//         // Navigator.push(
//         //     context,
//         //     MaterialPageRoute(
//         //       builder: (BuildContext context) => HomePage1(),
//         //     ));
//         ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text("𝓁ℴℊ𝒾𝓃 𝓈𝓊𝒸𝒸ℯ𝓈𝓈𝒻𝓊𝓁𝓁𝓎")));
//       });
//     });
//   }

//   var name;

//   _googleLogin() async {
//     print('_googleSignIn sdfsdf');
//     try {
//       await _googleSignIn.signIn();
//       setState(() {
//         print(
//           _googleSignIn.currentUser?.displayName,
//         );
//         _saveUserInfo(
//           _googleSignIn.currentUser?.id,
//           _googleSignIn.currentUser?.displayName,
//           _googleSignIn.currentUser?.email,
//           _googleSignIn.currentUser?.photoUrl,
//           "12345678",
//         );
//       });
//     } catch (err) {
//       print("this error$err");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xffDADADA),
//       body:
//           // margin: EdgeInsets.symmetric(horizontal: 30),
//           SingleChildScrollView(
//               child: Column(children: <Widget>[
//         Container(
//           // padding: const EdgeInsets.only(
//           //   top: 38,
//           // ),
//           child: Image.asset(
//             'assets/images/background-top(2).png',
//             height: 260,
//             width: MediaQuery.of(context).size.width,
//             // width: MediaQuery.of(context).size.width * 0.94,
//             // height: MediaQuery.of(context).size.height * 0.14,
//           ), // <-- SEE HERE
//         ),
//         // Padding(
//         //   padding: const EdgeInsets.symmetric(
//         //     horizontal: 20.0,
//         //   ),
//         // ),
//         Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               Container(
//                 // margin: new EdgeInsets.symmetric(
//                 //   horizontal: 0.0,
//                 // ),
//                 // padding: const EdgeInsets.only(
//                 //   top: 38,
//                 // ),
//                 child: Text(
//                   "Sign up",
//                   style: GoogleFonts.poppins(
//                       color: const Color(0xff212121),
//                       fontSize: 32,
//                       fontWeight: FontWeight.w500),
//                 ),
//               ),
//               Container(
//                 // margin: new EdgeInsets.symmetric(
//                 //   horizontal: 0.0,
//                 // ),
//                 // padding: const EdgeInsets.only(
//                 //   top: 38,
//                 // ),
//                 child: Text(
//                   "Login",
//                   style: GoogleFonts.poppins(
//                       color: const Color(0xffB0A9A9),
//                       fontSize: 32,
//                       fontWeight: FontWeight.w500),
//                 ),
//               ),
//             ]),

//         Container(
//           alignment: Alignment.center,
//           child: Padding(
//             padding: const EdgeInsets.only(top: 40),
//             child: Text("Authorization required",
//                 style: GoogleFonts.poppins(
//                     fontWeight: FontWeight.w400,
//                     fontSize: 16,
//                     color: (const Color(0xff212121)))),
//           ),
//         ),
//         InkWell(
//           child: Container(
//             padding: const EdgeInsets.only(
//               top: 40,
//             ),
//             width: 320,
//             child: Image.asset(
//               'assets/images/facebook.png',
//               //height: 250,
//               width: MediaQuery.of(context).size.width,
//               // width: MediaQuery.of(context).size.width * 0.94,
//               // height: MediaQuery.of(context).size.height * 0.14,
//             ), // <-- SEE HERE,
//             // child: MaterialButton(
//             //   shape: RoundedRectangleBorder(
//             //       borderRadius: BorderRadius.all(Radius.circular(40.0))),

//             //   //   minWidth: 100,
//             //   height: 62,
//             //   onPressed: () {
//             //     facebookLogin();
//             //   },
//             //   color: Color(0xff0B6FAC),
//             //   child: Row(
//             //     mainAxisAlignment: MainAxisAlignment.center,
//             //     children: <Widget>[
//             //       Icon(
//             //         FontAwesomeIcons.facebook,
//             //         size: 25,
//             //       ),
//             //       SizedBox(width: 70),
//             //       Text(
//             //         'Sign up with facebook',
//             //         style: GoogleFonts.poppins(
//             //             color: Color(0xffFFFFFF),
//             //             fontSize: 14,
//             //             fontWeight: FontWeight.w500),
//             //       ),
//             //     ],
//             //   ),
//             //   textColor: Colors.white,
//             // ),
//           ),
//           onTap: () {
//             Navigator.push(context,
//                 MaterialPageRoute(builder: (context) => const Onboarding()));
//             setState(() {
//               showDialog(
//                   context: context,
//                   builder: (context) {
//                     return AlertDialog(
//                       title: Text('Camera access',
//                           style: GoogleFonts.poppins(
//                               color: const Color(0xff212121),
//                               fontWeight: FontWeight.w500,
//                               fontSize: 20)),
//                       content: Text(
//                           'Do you allow this app to have an access to your camera?',
//                           style: GoogleFonts.poppins(
//                               color: const Color(0xff786E6E),
//                               fontWeight: FontWeight.w400,
//                               fontSize: 14)),
//                       actions: <Widget>[
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             Container(
//                               decoration: BoxDecoration(
//                                   border: Border.all(
//                                       color: const Color(0xffB0A9A9), width: 1),
//                                   borderRadius: const BorderRadius.all(
//                                       Radius.circular(8))),
//                               height:
//                                   MediaQuery.of(context).size.height * 0.082,
//                               width: MediaQuery.of(context).size.width * 0.350,
//                               child: TextButton(
//                                   onPressed: () {
//                                     Navigator.pop(context);
//                                   },
//                                   child: Text("Deny",
//                                       style: GoogleFonts.poppins(
//                                           color: const Color(0xffB0A9A9),
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.w500))),
//                             ),
//                             InkWell(
//                               child: Container(
//                                 alignment: Alignment.center,
//                                 height:
//                                     MediaQuery.of(context).size.height * 0.082,
//                                 width:
//                                     MediaQuery.of(context).size.width * 0.350,
//                                 decoration: const BoxDecoration(
//                                     color: Color(0xffCE8C8C),
//                                     borderRadius: BorderRadius.all(
//                                         (Radius.circular(10)))),
//                                 child: InkWell(
//                                   child: Text("Allow",
//                                       style: GoogleFonts.poppins(
//                                           color: const Color(0xffFFFFFF),
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.w600)),
//                                   onTap: () {
//                                     showDialog(
//                                         context: context,
//                                         builder: (context) {
//                                           return AlertDialog(
//                                             title: Text('Taking pictures',
//                                                 style: GoogleFonts.poppins(
//                                                     color:
//                                                         const Color(0xff212121),
//                                                     fontWeight: FontWeight.w500,
//                                                     fontSize: 20)),
//                                             content: Text(
//                                                 'Do you allow this app to take pictures\non your device?',
//                                                 style: GoogleFonts.poppins(
//                                                     color:
//                                                         const Color(0xff786E6E),
//                                                     fontWeight: FontWeight.w400,
//                                                     fontSize: 14)),
//                                             actions: <Widget>[
//                                               Row(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment
//                                                         .spaceAround,
//                                                 children: [
//                                                   Container(
//                                                     decoration: BoxDecoration(
//                                                         border: Border.all(
//                                                             color: const Color(
//                                                                 0xffB0A9A9),
//                                                             width: 1),
//                                                         borderRadius:
//                                                             const BorderRadius
//                                                                     .all(
//                                                                 Radius.circular(
//                                                                     8))),
//                                                     height:
//                                                         MediaQuery.of(context)
//                                                                 .size
//                                                                 .height *
//                                                             0.082,
//                                                     width:
//                                                         MediaQuery.of(context)
//                                                                 .size
//                                                                 .width *
//                                                             0.350,
//                                                     child: TextButton(
//                                                         onPressed: () {
//                                                           Navigator.pop(
//                                                               context);
//                                                         },
//                                                         child: Text("Deny",
//                                                             style: GoogleFonts.poppins(
//                                                                 color: const Color(
//                                                                     0xffB0A9A9),
//                                                                 fontSize: 14,
//                                                                 fontWeight:
//                                                                     FontWeight
//                                                                         .w500))),
//                                                   ),
//                                                   InkWell(
//                                                     child: Container(
//                                                       alignment:
//                                                           Alignment.center,
//                                                       height:
//                                                           MediaQuery.of(context)
//                                                                   .size
//                                                                   .height *
//                                                               0.082,
//                                                       width:
//                                                           MediaQuery.of(context)
//                                                                   .size
//                                                                   .width *
//                                                               0.350,
//                                                       decoration: const BoxDecoration(
//                                                           color:
//                                                               Color(0xffCE8C8C),
//                                                           borderRadius:
//                                                               BorderRadius.all(
//                                                                   (Radius
//                                                                       .circular(
//                                                                           10)))),
//                                                       child: InkWell(
//                                                         child: Text("Allow",
//                                                             style: GoogleFonts.poppins(
//                                                                 color: const Color(
//                                                                     0xffFFFFFF),
//                                                                 fontSize: 14,
//                                                                 fontWeight:
//                                                                     FontWeight
//                                                                         .w600)),
//                                                         onTap: () {
//                                                           Navigator.push(
//                                                               context,
//                                                               MaterialPageRoute(
//                                                                   builder:
//                                                                       (context) =>
//                                                                           const QrCodeScannerOne()));
//                                                         },
//                                                       ),
//                                                     ),
//                                                     onTap: () async {
//                                                       // if (await Permission.location.request().isGranted) {
//                                                       //   // Either the permission was already granted before or the user just granted it.
//                                                       //   print("Location Permission is granted");
//                                                       // }else{
//                                                       //   print("Location Permission is denied.");
//                                                       // }
//                                                       // Navigator.push(
//                                                       //     context,
//                                                       //     MaterialPageRoute(
//                                                       //         builder:
//                                                       //             (context) =>
//                                                       //         const QrCodeScannerOne()));
//                                                     },
//                                                   ),
//                                                 ],
//                                               )
//                                             ],
//                                           );
//                                         });
//                                   },
//                                 ),
//                               ),
//                               onTap: () {},
//                             ),
//                           ],
//                         )
//                       ],
//                     );
//                   });
//             });
//           },
//         ),
//         // Container(
//         //     child: TextButton(
//         //   child: Row(children: [Image.asset(""), Text("Sign up with Google")]),
//         //   onPressed: () {},
//         // )),
//         const SizedBox(height: 20),
//         Container(
//             width: 320,
//             height: 62,
//             child: Container(
//               decoration: BoxDecoration(
//                   color: Color(0xffFFFFFF),
//                   borderRadius: BorderRadius.all(Radius.circular(30))),
//               child: TextButton(
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 10),
//                     child: Row(children: [
//                       IconButton(
//                         padding: const EdgeInsets.only(right: 20),
//                         icon: Image.asset('assets/images/Group 356.png'),
//                         iconSize: 30,
//                         onPressed: () => {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => const Onboarding())),
//                         },
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 50),
//                         child: Text(
//                           'Sign up with Google',
//                           style: GoogleFonts.poppins(
//                               color: const Color(0xff212121),
//                               fontSize: 14,
//                               fontWeight: FontWeight.w500),
//                         ),
//                       ),
//                     ]),
//                   ),
//                   onPressed: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => const Onboarding()));
//                     setState(() {
//                       showDialog(
//                           context: context,
//                           builder: (context) {
//                             return AlertDialog(
//                               title: Text('Camera access',
//                                   style: GoogleFonts.poppins(
//                                       color: const Color(0xff212121),
//                                       fontWeight: FontWeight.w500,
//                                       fontSize: 20)),
//                               content: Text(
//                                   'Do you allow this app to have an access to your camera?',
//                                   style: GoogleFonts.poppins(
//                                       color: const Color(0xff786E6E),
//                                       fontWeight: FontWeight.w400,
//                                       fontSize: 14)),
//                               actions: <Widget>[
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceAround,
//                                   children: [
//                                     Container(
//                                       decoration: BoxDecoration(
//                                           border: Border.all(
//                                               color: const Color(0xffB0A9A9),
//                                               width: 1),
//                                           borderRadius: const BorderRadius.all(
//                                               Radius.circular(8))),
//                                       height:
//                                           MediaQuery.of(context).size.height *
//                                               0.082,
//                                       width: MediaQuery.of(context).size.width *
//                                           0.350,
//                                       child: TextButton(
//                                           onPressed: () {
//                                             Navigator.pop(context);
//                                           },
//                                           child: Text("Deny",
//                                               style: GoogleFonts.poppins(
//                                                   color:
//                                                       const Color(0xffB0A9A9),
//                                                   fontSize: 14,
//                                                   fontWeight:
//                                                       FontWeight.w500))),
//                                     ),
//                                     InkWell(
//                                       child: Container(
//                                         alignment: Alignment.center,
//                                         height:
//                                             MediaQuery.of(context).size.height *
//                                                 0.082,
//                                         width:
//                                             MediaQuery.of(context).size.width *
//                                                 0.350,
//                                         decoration: const BoxDecoration(
//                                             color: Color(0xffCE8C8C),
//                                             borderRadius: BorderRadius.all(
//                                                 (Radius.circular(10)))),
//                                         child: InkWell(
//                                           child: Text("Allow",
//                                               style: GoogleFonts.poppins(
//                                                   color:
//                                                       const Color(0xffFFFFFF),
//                                                   fontSize: 14,
//                                                   fontWeight: FontWeight.w600)),
//                                           onTap: () {
//                                             showDialog(
//                                                 context: context,
//                                                 builder: (context) {
//                                                   return AlertDialog(
//                                                     title: Text(
//                                                         'Taking pictures',
//                                                         style: GoogleFonts.poppins(
//                                                             color: const Color(
//                                                                 0xff212121),
//                                                             fontWeight:
//                                                                 FontWeight.w500,
//                                                             fontSize: 20)),
//                                                     content: Text(
//                                                         'Do you allow this app to take pictures\non your device?',
//                                                         style: GoogleFonts.poppins(
//                                                             color: const Color(
//                                                                 0xff786E6E),
//                                                             fontWeight:
//                                                                 FontWeight.w400,
//                                                             fontSize: 14)),
//                                                     actions: <Widget>[
//                                                       Row(
//                                                         mainAxisAlignment:
//                                                             MainAxisAlignment
//                                                                 .spaceAround,
//                                                         children: [
//                                                           Container(
//                                                             decoration: BoxDecoration(
//                                                                 border: Border.all(
//                                                                     color: const Color(
//                                                                         0xffB0A9A9),
//                                                                     width: 1),
//                                                                 borderRadius:
//                                                                     const BorderRadius
//                                                                             .all(
//                                                                         Radius.circular(
//                                                                             8))),
//                                                             height: MediaQuery.of(
//                                                                         context)
//                                                                     .size
//                                                                     .height *
//                                                                 0.082,
//                                                             width: MediaQuery.of(
//                                                                         context)
//                                                                     .size
//                                                                     .width *
//                                                                 0.350,
//                                                             child: TextButton(
//                                                                 onPressed: () {
//                                                                   Navigator.pop(
//                                                                       context);
//                                                                 },
//                                                                 child: Text(
//                                                                     "Deny",
//                                                                     style: GoogleFonts.poppins(
//                                                                         color: const Color(
//                                                                             0xffB0A9A9),
//                                                                         fontSize:
//                                                                             14,
//                                                                         fontWeight:
//                                                                             FontWeight.w500))),
//                                                           ),
//                                                           InkWell(
//                                                             child: Container(
//                                                               alignment:
//                                                                   Alignment
//                                                                       .center,
//                                                               height: MediaQuery.of(
//                                                                           context)
//                                                                       .size
//                                                                       .height *
//                                                                   0.082,
//                                                               width: MediaQuery.of(
//                                                                           context)
//                                                                       .size
//                                                                       .width *
//                                                                   0.350,
//                                                               decoration: const BoxDecoration(
//                                                                   color: Color(
//                                                                       0xffCE8C8C),
//                                                                   borderRadius:
//                                                                       BorderRadius.all(
//                                                                           (Radius.circular(
//                                                                               10)))),
//                                                               child: InkWell(
//                                                                 child: Text(
//                                                                     "Allow",
//                                                                     style: GoogleFonts.poppins(
//                                                                         color: const Color(
//                                                                             0xffFFFFFF),
//                                                                         fontSize:
//                                                                             14,
//                                                                         fontWeight:
//                                                                             FontWeight.w600)),
//                                                                 onTap: () {
//                                                                   Navigator.push(
//                                                                       context,
//                                                                       MaterialPageRoute(
//                                                                           builder: (context) =>
//                                                                               const QrCodeScannerOne()));
//                                                                 },
//                                                               ),
//                                                             ),
//                                                             onTap: () async {
//                                                               // if (await Permission.location.request().isGranted) {
//                                                               //   // Either the permission was already granted before or the user just granted it.
//                                                               //   print("Location Permission is granted");
//                                                               // }else{
//                                                               //   print("Location Permission is denied.");
//                                                               // }
//                                                               // Navigator.push(
//                                                               //     context,
//                                                               //     MaterialPageRoute(
//                                                               //         builder:
//                                                               //             (context) =>
//                                                               //         const QrCodeScannerOne()));
//                                                             },
//                                                           ),
//                                                         ],
//                                                       )
//                                                     ],
//                                                   );
//                                                 });
//                                           },
//                                         ),
//                                       ),
//                                       onTap: () {},
//                                     ),
//                                   ],
//                                 )
//                               ],
//                             );
//                           });
//                     });
//                   }),
//             )
//             //  RaisedButton.icon(
//             //   onPressed: () => {
//             // Navigator.push(context,
//             //     MaterialPageRoute(builder: (context) => const Onboarding())),
//             //     setState(() {
//             //       showDialog(
//             //           context: context,
//             //           builder: (context) {
//             //             return AlertDialog(
//             //               title: Text('Camera access',
//             //                   style: GoogleFonts.poppins(
//             //                       color: const Color(0xff212121),
//             //                       fontWeight: FontWeight.w500,
//             //                       fontSize: 20)),
//             //               content: Text(
//             //                   'Do you allow this app to have an access to your camera?',
//             //                   style: GoogleFonts.poppins(
//             //                       color: const Color(0xff786E6E),
//             //                       fontWeight: FontWeight.w400,
//             //                       fontSize: 14)),
//             //               actions: <Widget>[
//             //                 Row(
//             //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//             //                   children: [
//             //                     Container(
//             //                       decoration: BoxDecoration(
//             //                           border: Border.all(
//             //                               color: const Color(0xffB0A9A9),
//             //                               width: 1),
//             //                           borderRadius: const BorderRadius.all(
//             //                               Radius.circular(8))),
//             //                       height:
//             //                           MediaQuery.of(context).size.height * 0.082,
//             //                       width:
//             //                           MediaQuery.of(context).size.width * 0.350,
//             //                       child: TextButton(
//             //                           onPressed: () {
//             //                             Navigator.pop(context);
//             //                           },
//             //                           child: Text("Deny",
//             //                               style: GoogleFonts.poppins(
//             //                                   color: const Color(0xffB0A9A9),
//             //                                   fontSize: 14,
//             //                                   fontWeight: FontWeight.w500))),
//             //                     ),
//             //                     InkWell(
//             //                       child: Container(
//             //                         alignment: Alignment.center,
//             //                         height: MediaQuery.of(context).size.height *
//             //                             0.082,
//             //                         width:
//             //                             MediaQuery.of(context).size.width * 0.350,
//             //                         decoration: const BoxDecoration(
//             //                             color: Color(0xffCE8C8C),
//             //                             borderRadius: BorderRadius.all(
//             //                                 (Radius.circular(10)))),
//             //                         child: InkWell(
//             //                           child: Text("Allow",
//             //                               style: GoogleFonts.poppins(
//             //                                   color: const Color(0xffFFFFFF),
//             //                                   fontSize: 14,
//             //                                   fontWeight: FontWeight.w600)),
//             //                           onTap: () {
//             //                             showDialog(
//             //                                 context: context,
//             //                                 builder: (context) {
//             //                                   return AlertDialog(
//             //                                     title: Text('Taking pictures',
//             //                                         style: GoogleFonts.poppins(
//             //                                             color: const Color(
//             //                                                 0xff212121),
//             //                                             fontWeight:
//             //                                                 FontWeight.w500,
//             //                                             fontSize: 20)),
//             //                                     content: Text(
//             //                                         'Do you allow this app to take pictures\non your device?',
//             //                                         style: GoogleFonts.poppins(
//             //                                             color: const Color(
//             //                                                 0xff786E6E),
//             //                                             fontWeight:
//             //                                                 FontWeight.w400,
//             //                                             fontSize: 14)),
//             //                                     actions: <Widget>[
//             //                                       Row(
//             //                                         mainAxisAlignment:
//             //                                             MainAxisAlignment
//             //                                                 .spaceAround,
//             //                                         children: [
//             //                                           Container(
//             //                                             decoration: BoxDecoration(
//             //                                                 border: Border.all(
//             //                                                     color: const Color(
//             //                                                         0xffB0A9A9),
//             //                                                     width: 1),
//             //                                                 borderRadius:
//             //                                                     const BorderRadius
//             //                                                             .all(
//             //                                                         Radius
//             //                                                             .circular(
//             //                                                                 8))),
//             //                                             height:
//             //                                                 MediaQuery.of(context)
//             //                                                         .size
//             //                                                         .height *
//             //                                                     0.082,
//             //                                             width:
//             //                                                 MediaQuery.of(context)
//             //                                                         .size
//             //                                                         .width *
//             //                                                     0.350,
//             //                                             child: TextButton(
//             //                                                 onPressed: () {
//             //                                                   Navigator.pop(
//             //                                                       context);
//             //                                                 },
//             //                                                 child: Text("Deny",
//             //                                                     style: GoogleFonts.poppins(
//             //                                                         color: const Color(
//             //                                                             0xffB0A9A9),
//             //                                                         fontSize: 14,
//             //                                                         fontWeight:
//             //                                                             FontWeight
//             //                                                                 .w500))),
//             //                                           ),
//             //                                           InkWell(
//             //                                             child: Container(
//             //                                               alignment:
//             //                                                   Alignment.center,
//             //                                               height: MediaQuery.of(
//             //                                                           context)
//             //                                                       .size
//             //                                                       .height *
//             //                                                   0.082,
//             //                                               width: MediaQuery.of(
//             //                                                           context)
//             //                                                       .size
//             //                                                       .width *
//             //                                                   0.350,
//             //                                               decoration: const BoxDecoration(
//             //                                                   color: Color(
//             //                                                       0xffCE8C8C),
//             //                                                   borderRadius:
//             //                                                       BorderRadius
//             //                                                           .all((Radius
//             //                                                               .circular(
//             //                                                                   10)))),
//             //                                               child: InkWell(
//             //                                                 child: Text("Allow",
//             //                                                     style: GoogleFonts.poppins(
//             //                                                         color: const Color(
//             //                                                             0xffFFFFFF),
//             //                                                         fontSize: 14,
//             //                                                         fontWeight:
//             //                                                             FontWeight
//             //                                                                 .w600)),
//             //                                                 onTap: () {
//             //                                                   Navigator.push(
//             //                                                       context,
//             //                                                       MaterialPageRoute(
//             //                                                           builder:
//             //                                                               (context) =>
//             //                                                                   QrCodeScannerOne()));

//             //                                                   // Navigator.push(
//             //                                                   //     context,
//             //                                                   //     MaterialPageRoute(
//             //                                                   //         builder: (context) =>
//             //                                                   //         const QrCodeScannerOne()));
//             //                                                 },
//             //                                               ),
//             //                                             ),
//             //                                             onTap: () async {
//             //                                               // if (await Permission.location.request().isGranted) {
//             //                                               //   // Either the permission was already granted before or the user just granted it.
//             //                                               //   print("Location Permission is granted");
//             //                                               // }else{
//             //                                               //   print("Location Permission is denied.");
//             //                                               // }
//             //                                               // Navigator.push(
//             //                                               //     context,
//             //                                               //     MaterialPageRoute(
//             //                                               //         builder:
//             //                                               //             (context) =>
//             //                                               //         const QrCodeScannerOne()));
//             //                                             },
//             //                                           ),
//             //                                         ],
//             //                                       )
//             //                                     ],
//             //                                   );
//             //                                 });
//             //                           },
//             //                         ),
//             //                       ),
//             //                       onTap: () {},
//             //                     ),
//             //                   ],
//             //                 )
//             //               ],
//             //             );
//             //           });
//             //     })
//             //   },
//             //   shape: const RoundedRectangleBorder(
//             //       side: BorderSide(
//             //         width: 1,
//             //         color: Color(0xffB0A9A9),
//             //       ),
//             //       borderRadius: BorderRadius.all(Radius.circular(40.0))),
//             //   label: Text(
//             //     'Sign up with Google',
//             //     style: GoogleFonts.poppins(
//             //         color: const Color(0xff212121),
//             //         fontSize: 14,
//             //         fontWeight: FontWeight.w500),
//             //   ),
//             //   padding: const EdgeInsets.only(right: 0),
//             //   icon: IconButton(
//             //     padding: const EdgeInsets.only(right: 20),
//             //     icon: Image.asset('assets/images/Group 356.png'),
//             //     iconSize: 30,
//             //     onPressed: () => {_googleLogin()},
//             //   ),
//             //   color: const Color(0xfffffffff),
//             // ),
//             // child: MaterialButton(
//             //   shape: RoundedRectangleBorder(
//             //       borderRadius: BorderRadius.all(Radius.circular(40.0))),
//             //   elevation: 0,
//             //   minWidth: double.maxFinite,
//             //   height: 62,
//             //   onPressed: () => {_googleLogin()},
//             //   color: Color(0xffffffff),
//             //   child: Row(
//             //     mainAxisAlignment: MainAxisAlignment.center,
//             //     children: <Widget>[
//             //       Icon(
//             //         FontAwesomeIcons.googlePay,
//             //         size: 30,
//             ),
//         // Container(
//         //   // margin: new EdgeInsets.symmetric(
//         //   //   horizontal: 0.0,
//         //   // ),
//         //   padding: const EdgeInsets.only(
//         //     top: 20,
//         //   ),
//         //   child: Text(
//         //     "or",
//         //     style: GoogleFonts.poppins(
//         //         color: Color(0xff212121),
//         //         fontSize: 14,
//         //         fontWeight: FontWeight.w500),
//         //   ),
//         // ),

//         const SizedBox(height: 43),
//         // Container(
//         //     height: 62,
//         //     width: 300,
//         //     decoration: BoxDecoration(
//         //         border: Border.all(
//         //           width: 1,
//         //           color: const Color(0xffB0A9A9),
//         //         ),
//         //         borderRadius: const BorderRadius.all(
//         //           Radius.circular(32),
//         //         )),
//         //     child: TextButton(
//         //         onPressed: () {
//         //           Navigator.push(
//         //               context,
//         //               PageTransition(
//         //                   type: PageTransitionType.topToBottom,
//         //                   child: HomePage1()));
//         //         },
//         //         child: Text(
//         //           "Continue as a guest",
//         //           style: GoogleFonts.poppins(
//         //               color: const Color(0xffB0A9A9),
//         //               fontSize: 16,
//         //               fontWeight: FontWeight.w600),
//         //         ))),
//         Container(
//             padding: const EdgeInsets.only(
//               top: 50,
//             ),
//             margin: new EdgeInsets.symmetric(horizontal: 20.0),
//             // width: 150,
//             height: 170,
//             child: Stack(fit: StackFit.expand, children: <Widget>[
//               const Image(
//                 image: AssetImage('assets/images/pattern(1).png'),
//               ),
//               // Positioned(
//               //   bottom: 15,
//               //   left: 80,
//               //   child: Column(
//               //     children: <Widget>[
//               //       Text(
//               //         "Have a code from a friend?",
//               //         style: GoogleFonts.poppins(
//               //             color: const Color(0xffCE8C8C),
//               //             fontSize: 14,
//               //             fontWeight: FontWeight.w500),
//               //       ),
//               //     ],
//               //   ),
//               // )
//             ]))
//       ])),
//     );
//   }
// }

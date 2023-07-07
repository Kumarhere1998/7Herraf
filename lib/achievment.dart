// // ignore_for_file: prefer_const_constructors

// import 'dart:async';
// import 'dart:io';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// import 'package:google_fonts/google_fonts.dart';
// import 'package:herraf_app/newprofile.dart';

// //import 'package:infinumgrowth/main.dart';
// //import 'package:flutter_login_facebook/flutter_login_facebook.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import 'dart:convert';

// class AchievmentPage2 extends StatefulWidget {
//   // ignore: use_key_in_widget_constructors

//   var child;

//   // const leftnavigatorPage({Key? key}) : super(key: key);

//   @override
//   State<AchievmentPage2> createState() => _AchievmentPage2State();
// }

// class _AchievmentPage2State extends State<AchievmentPage2> {
//   final GlobalKey webViewKey = GlobalKey();
//   final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
//   TextEditingController nicknamecontroller = TextEditingController();
//   TextEditingController firstnamecontroller = TextEditingController();
//   TextEditingController nicenamecontroller = TextEditingController();

//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();

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

//   bool _showPassword = false;
//   void _togglevisibility() {
//     setState(() {
//       _showPassword = !_showPassword;
//     });
//   }

//   //var facebookLogin = FacebookLogin();

//   var _isLoading = false;

//   bool _obscureText = true;
//   void _toggle() {
//     setState(() {
//       _obscureText = !_obscureText;
//     });
//   }

//   // void _editlogin() async {

//   //   setState(() {
//   //     _isLoading = true;
//   //   });
//   //   ApiService.EditProfilePost(profilePage).then((value) async {
//   //     SharedPreferences prefs = await SharedPreferences.getInstance();
//   //     setState(() {
//   //       _isLoading = false;
//   //       if (value["status"] == 1) {

//   //         setState(() {
//   //           _isLoading = false;
//   //         });
//   //       }

//   //     });
//   //   });
//   // }

//   // File? image;

//   // Future _getFromCamera() async {
//   //   SharedPreferences pref = await SharedPreferences.getInstance();
//   //   try {
//   //     final image = await ImagePicker().getImage(
//   //       source: ImageSource.camera,
//   //       maxWidth: 1800,
//   //       maxHeight: 1800,
//   //     );
//   //     if (image != null) {
//   //       setState(() {
//   //         imageFile = File(image.path);
//   //       });
//   //     } else {
//   //       imageFile;
//   //     }
//   //   } on PlatformException catch (e) {
//   //   }
//   // }

//   bool _switchValue = true;
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
//     var imageFile;
//     return Scaffold(
//       backgroundColor: Color(0xffE5E5E5),
//       appBar: AppBar(
//         backgroundColor: Color(0xffE5E5E5),
//         elevation: 0.0,
//         title: Text(
//           "Achivements",
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
//             // Navigator.of(context).pushReplacement(
//             //     MaterialPageRoute(builder: (context) => Fuzzy()));
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
//                   onTap: () {
//                     // Navigator.of(context).pushReplacement(MaterialPageRoute(
//                     //     builder: (context) => Playingcreen()));
//                   },
//                   child: Container(
//                     height: 200,
//                     child: Row(
//                       children: [
//                         Container(
//                           height: 200,
//                           width: MediaQuery.of(context).size.width / 2 -
//                               32, // minus 32 due to the margin
//                           margin: EdgeInsets.all(16.0),
//                           padding: EdgeInsets.all(16.0),
//                           decoration: BoxDecoration(
//                             color: Color(0xffF1F6FF),
//                             // background color of the cards
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(0.0)),
//                             boxShadow: [],
//                           ),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment
//                                 .end, // posion the everything to the bottom
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               // place here your image
//                               Image.asset(
//                                 'assets/images/Rectangle 28.png',
//                                 height: 65,
//                                 width: 65,
//                               ),
//                               Padding(padding: const EdgeInsets.only(top: 20)),
//                               Text(
//                                 "Friendship",
//                                 style: GoogleFonts.poppins(
//                                     color: Color(0xff2B1B1F),
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w600),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Container(
//                           height: 200,
//                           width: MediaQuery.of(context).size.width / 2 -
//                               32, // minus 32 due to the margin
//                           margin: EdgeInsets.all(16.0),
//                           padding: EdgeInsets.all(16.0),
//                           decoration: BoxDecoration(
//                             color: Color(0xffF1F6FF),

//                             // background color of the cards
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(0.0)),
//                             boxShadow: [],
//                           ),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment
//                                 .end, // posion the everything to the bottom
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               // place here your image
//                               Image.asset(
//                                 'assets/images/Rectangle 28.png',
//                                 height: 65,
//                                 width: 65,
//                               ),
//                               Padding(padding: const EdgeInsets.only(top: 20)),
//                               Text(
//                                 "Winner",
//                                 style: GoogleFonts.poppins(
//                                     color: Color(0xff2B1B1F),
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w600),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
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
//                               'assets/images/Rectangle 28.png',
//                               height: 65,
//                               width: 65,
//                             ),
//                             Padding(padding: const EdgeInsets.only(top: 20)),
//                             Text(
//                               "Dedication",
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
//                               'assets/images/Rectangle 28.png',
//                               height: 65,
//                               width: 65,
//                             ),
//                             Padding(padding: const EdgeInsets.only(top: 20)),
//                             Text(
//                               "Wisdom",
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
//                               'assets/images/Rectangle 28.png',
//                               height: 65,
//                               width: 65,
//                             ),
//                             Padding(padding: const EdgeInsets.only(top: 20)),
//                             Text(
//                               "Challenger",
//                               style: GoogleFonts.poppins(
//                                   color: Color(0xffF1F6FF),
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
//                               'assets/images/Rectangle 28.png',
//                               height: 65,
//                               width: 65,
//                             ),
//                             Padding(padding: const EdgeInsets.only(top: 20)),
//                             Text(
//                               "Social",
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
// }

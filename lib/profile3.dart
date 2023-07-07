import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:herraf_app/achievement.dart';
import 'package:herraf_app/api_servivce.dart';
import 'package:herraf_app/invitetoggle.dart';
import 'package:herraf_app/newlogin.dart';
import 'package:herraf_app/pack.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final nameController = TextEditingController();

  List<dynamic> friendlist = [];
  List<dynamic> userData = [];
  List<dynamic> mypack = [];
  List<dynamic> userTotalExp = [];
  String user_id = '';
  String friend_photo = '';
  bool autoFocus = false;
  bool enabled = false;
  bool nameUploaded = true;
  bool urlImage = false;
  bool imageLoader = true;

  // String name = '';
  List<dynamic> userProfile = [];

  FocusNode inputNode = FocusNode();
// to open keyboard call this function;
  void openKeyboard() {
    FocusScope.of(context).requestFocus(inputNode);
  }

  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      await googleSignIn.signOut();
      await auth.signOut();
      prefs.remove(('user_id'));
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => GoogleloginPage1()),
          (Route route) => false);
    } catch (e) {
      print("Error during logout: $e");
    }
  }

  String user_photo = "";
  String full_name = '';
  File? imageFile;

  // ignore: must_call_super
  void initState() {
    _getUserInfo();
    _myFriends();
    _mypacks();
    _userTotalExp();
  }

  _getUserInfo() {
    ApiService.userDetails().then((value) {
      userData = value['data'];
      user_photo = userData[0]['user_image'];
      if (user_photo.contains("http") || value.toString().contains("https")) {
        setState(() {
          // print("I'm here in IF condition");
          user_photo = userData[0]['user_image'];
          full_name = userData[0]['first_name'];
          imageLoader = false;
          urlImage = true;
        });
      } else {
        setState(() {
          // print("I'm here in ELSE condition");
          user_photo = userData[0]['user_image'];
          full_name = userData[0]['first_name'];
          imageLoader = false;
        });
      }
    });
  }

  bool loading = true;
  bool isLoading = true;

  _myFriends() async {
    ApiService.friendlist().then((value) {
      friendlist = value["data"];
      setState(() {
        loading = false;
      });
    });
  }

  _mypacks() async {
    ApiService.selectpack().then((value) {
      setState(() {
        isLoading = false;
        if (value['data'].length > 0) {
          mypack = value['data'];
        }
      });
    });
  }

  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 2800,
      maxHeight: 2800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
        _uploadProfileImage(pickedFile.path);
      });
    }
  }

  _uploadProfileImage(image) async {
    setState(() {
      imageLoader = true;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    user_id = prefs.getString('user_id')!;
    FormData formdata = FormData.fromMap({
      "id": user_id,
      "first_name": full_name,
      "user_image": await MultipartFile.fromFile("${image}",
          filename: "$image".split('/').last),
    });
    var dio = new Dio();
    Response response = await dio.post(
      "http://165.22.215.103:4000/api/users-update",
      data: formdata,
    );
    if (response.statusCode == 200) {
      _getUserInfo();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Profle image uploaded successfully'),
      ));
    }
  }

  _saveProfileName() async {
    ApiService.updateName(nameController.text).then((value) async {
      if (value['status']) {
        _getUserInfo();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(value['message']),
        ));
      }
    });
  }

  _userTotalExp() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    ApiService.userTotalExp(pref.get('user_id')).then((value) {
      setState(() {
        userTotalExp = value['data'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var friend = friendlist.length;
    var packs = mypack.length;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 250, 248, 248),
      body: SafeArea(
          child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Image.asset("assets/images/background-top(1).png"),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, left: 25, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Profile',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff212121),
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.more_vert_rounded,
                            size: 26,
                            color: Color(0xff212121),
                          ),
                          onPressed: () {
                            showDialog(
                                barrierColor: Colors.transparent,
                                context: context,
                                builder: (ctx) => SimpleDialog(
                                      insetPadding: EdgeInsets.only(
                                          left: 160, right: 35, bottom: 450),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                      children: [
                                        Container(
                                          // color: Colors.amber,
                                          margin: EdgeInsets.only(
                                            left: 25,
                                          ),
                                          height: 200,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  Navigator.pop(context);

                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (_) =>
                                                              InvitetoggleApp(
                                                                  GameMode: '',
                                                                  packname: '',
                                                                  packId: 0,
                                                                  inviteFriend:
                                                                      false)));
                                                },
                                                child: Container(
                                                  child: Row(
                                                    children: [
                                                      Image.asset(
                                                          'assets/images/friendM.png'),
                                                      SizedBox(
                                                        width: 20,
                                                      ),
                                                      Text(
                                                        'Friends',
                                                        style: GoogleFonts.poppins(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 18,
                                                            color: const Color(
                                                                (0xff212121))),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  Navigator.pop(context);

                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (_) =>
                                                              AchievementScreen()));
                                                },
                                                child: Row(
                                                  children: [
                                                    Image.asset(
                                                        'assets/images/achi.png'),
                                                    SizedBox(
                                                      width: 20,
                                                    ),
                                                    Text(
                                                      'Achivements',
                                                      style: GoogleFonts.poppins(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 18,
                                                          color: const Color(
                                                              (0xff212121))),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (_) =>
                                                              MyPack()));
                                                },
                                                child: Row(
                                                  children: [
                                                    Image.asset(
                                                        'assets/images/packs.png'),
                                                    SizedBox(
                                                      width: 20,
                                                    ),
                                                    Text(
                                                      'Packs',
                                                      style: GoogleFonts.poppins(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 18,
                                                          color: const Color(
                                                              (0xff212121))),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                  showDialog(
                                                      context: context,
                                                      builder:
                                                          (ctx) => AlertDialog(
                                                                content: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      'Sure you want to \nlog out?',
                                                                      style: GoogleFonts.poppins(
                                                                          fontWeight: FontWeight
                                                                              .w500,
                                                                          fontSize:
                                                                              20,
                                                                          color:
                                                                              const Color((0xff212121))),
                                                                    ),
                                                                    Container(
                                                                      height:
                                                                          90,
                                                                      child:
                                                                          Align(
                                                                        alignment:
                                                                            Alignment.topRight,
                                                                        child:
                                                                            IconButton(
                                                                          icon:
                                                                              Icon(
                                                                            Icons.close,
                                                                            size:
                                                                                25,
                                                                            color:
                                                                                Color(0xff212121),
                                                                          ),
                                                                          onPressed:
                                                                              () {
                                                                            Navigator.pop(context);
                                                                          },
                                                                        ),
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                                actions: [
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceAround,
                                                                    children: [
                                                                      InkWell(
                                                                        onTap:
                                                                            () {
                                                                          Navigator.pop(
                                                                              context);
                                                                          Navigator.pop(
                                                                              context);
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          alignment:
                                                                              Alignment.center,
                                                                          height:
                                                                              MediaQuery.of(context).size.height * 0.065,
                                                                          width:
                                                                              MediaQuery.of(context).size.width * 0.300,
                                                                          decoration: BoxDecoration(
                                                                              border: Border.all(
                                                                                color: Colors.grey,
                                                                                width: 1,
                                                                              ),
                                                                              // color: Colors.amber,
                                                                              borderRadius: BorderRadius.all((Radius.circular(10)))),
                                                                          child: Text(
                                                                              "Cancel",
                                                                              style: GoogleFonts.poppins(color: Color.fromARGB(255, 132, 131, 131), fontSize: 14, fontWeight: FontWeight.w500)),
                                                                        ),
                                                                      ),
                                                                      InkWell(
                                                                        onTap:
                                                                            () {
                                                                          logout();
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          alignment:
                                                                              Alignment.center,
                                                                          height:
                                                                              MediaQuery.of(context).size.height * 0.065,
                                                                          width:
                                                                              MediaQuery.of(context).size.width * 0.300,
                                                                          decoration: const BoxDecoration(
                                                                              color: Color(0xffCE8C8C),
                                                                              borderRadius: BorderRadius.all((Radius.circular(10)))),
                                                                          child: Text(
                                                                              "Log out",
                                                                              style: GoogleFonts.poppins(color: const Color(0xffFFFFFF), fontSize: 14, fontWeight: FontWeight.w500)),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  )
                                                                ],
                                                              ));
                                                },
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.065,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.390,
                                                  decoration:
                                                      const BoxDecoration(
                                                          color:
                                                              Color(0xffCE8C8C),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  (Radius
                                                                      .circular(
                                                                          10)))),
                                                  child: Text("Log out",
                                                      style: GoogleFonts.poppins(
                                                          color: const Color(
                                                              0xffFFFFFF),
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w500)),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ));
                          },
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 38,
                    child: CircleAvatar(
                      radius: 45,
                      child: imageLoader
                          ? CircularProgressIndicator()
                          : ClipOval(
                              child: urlImage
                                  ? CircleAvatar(
                                      radius: 45,
                                      backgroundImage:
                                          NetworkImage("$user_photo"),
                                    )
                                  : CircleAvatar(
                                      radius: 45,
                                      backgroundImage: NetworkImage(
                                          "${URLS.IMAGE_URL}/${user_photo}"),
                                    ),
                            ),
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      child: TextButton(
                        onPressed: () {
                          _getFromGallery();
                        },
                        child: Text(
                          'Change Photo',
                          style: GoogleFonts.poppins(
                            color: Color(0xffCE8C8C),
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ))
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              margin: EdgeInsets.only(top: 15, left: 60),
              height: 40,
              width: 250,
              decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: const Color(0xffB0A9A9),
                  ),
                  borderRadius: BorderRadius.circular(40.0),
                  color: Colors.white),
              child: Row(
                children: [
                  Flexible(
                    child: TextField(
                      controller: nameController,
                      focusNode: inputNode,
                      autofocus: autoFocus,
                      enabled: enabled,
                      decoration: InputDecoration(
                        hintText: full_name,
                        border: InputBorder.none,
                      ),
                      onSubmitted: (value) {
                        _saveProfileName();
                      },
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          enabled = true;
                          openKeyboard();
                        });
                      },
                      icon: Icon(
                        Icons.edit,
                        color: Colors.grey,
                      ))
                ],
              ),
              // child: Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Text(
              //       full_name,
              //       style: GoogleFonts.poppins(
              //         color: Colors.black,
              //         fontSize: 15,
              //         fontWeight: FontWeight.w500,
              //       ),
              //     ),
              //     IconButton(
              //         icon: Icon(
              //           Icons.edit_outlined,
              //           size: 25,
              //           color: Colors.grey,
              //         ),
              //         onPressed: () {
              //           _upadteName() {}
              //         }),
              //   ],
              // ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 40,
                    width: 160,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5.0,
                            // spreadRadius: 1,
                            offset: Offset(
                              1,
                              5,
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white),
                    child: loading
                        ? Center(
                            child: CircularProgressIndicator(
                            strokeWidth: 3,
                            color: Color(0xffCE8C8C),
                          ))
                        : userTotalExp.length > 0
                            ? Center(
                                child: RichText(
                                  text: TextSpan(
                                    text: '${userTotalExp[0]['user_exp']} ',
                                    style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: 'exp ',
                                        style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'total',
                                        style: GoogleFonts.poppins(
                                          color: Colors.grey,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : Container(
                                // color: Colors.amber,
                                ),
                  ),
                  Container(
                      height: 40,
                      width: 160,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 5.0,
                              // spreadRadius: 1,
                              offset: Offset(
                                1,
                                5,
                              ),
                            )
                          ],
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white),
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                            text: '1340 ',
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'exp ',
                                style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(
                                text: 'this week',
                                style: GoogleFonts.poppins(
                                  color: Colors.grey,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 15, right: 15, top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 160,
                        height: 90,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: const Color(0xffB0A9A9),
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                                height: 60,
                                child: Image.asset("assets/images/silver.png")),
                            Text(
                              "Silver league",
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xff212121)),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 160,
                        height: 90,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: const Color(0xffB0A9A9),
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                                height: 60,
                                child: Image.asset(
                                    "assets/images/daily_streak.png")),
                            Text(
                              "25 day streak",
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xff212121)),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 15, right: 15, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 160,
                        height: 90,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: const Color(0xffB0A9A9),
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                                height: 60,
                                child:
                                    Image.asset("assets/images/game wins.png")),
                            Text(
                              "56 game wins",
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xff212121)),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 160,
                        height: 90,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: const Color(0xffB0A9A9),
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                                height: 60,
                                child: Image.asset(
                                    "assets/images/achivements.png")),
                            Text(
                              "10 Achivements",
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xff212121)),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 15, right: 15, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 160,
                        height: 90,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: const Color(0xffB0A9A9),
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                                height: 60,
                                child:
                                    Image.asset("assets/images/spelled.png")),
                            Text(
                              "Acronyms spelled",
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xff212121)),
                            )
                          ],
                        ),
                      ),
                      mypack.length > 0
                          ? Container(
                              width: 160,
                              height: 90,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: const Color(0xffB0A9A9),
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      height: 60,
                                      child: Image.asset(
                                          "assets/images/pack-change.png")),
                                  Text(
                                    '$packs packs',
                                    style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xff212121)),
                                  )
                                ],
                              ),
                            )
                          : Container(
                              width: 160,
                              height: 90,
                            )
                    ],
                  ),
                ),
              ],
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text('My Friends',
                                style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500)),
                            SizedBox(
                              width: 7,
                            ),
                            Text('($friend)',
                                style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400)),
                          ],
                        ),
                        friendlist.length > 0
                            ? TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => InvitetoggleApp(
                                              GameMode: '',
                                              packname: '',
                                              packId: 0,
                                              inviteFriend: false)));
                                },
                                child: Text(
                                  'View all',
                                  style: GoogleFonts.poppins(
                                    color: Color(0xffCE8C8C),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ))
                            : TextButton(
                                onPressed: () {},
                                child: Text(''),
                              ),
                      ],
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),
                      child: SizedBox(
                          child: loading
                              ? Center(
                                  child: CircularProgressIndicator(
                                  color: Color(0xffCE8C8C),
                                ))
                              : friendlist.length == 0
                                  ? Center(
                                      child: Container(
                                          child: Column(
                                      children: [
                                        Text(
                                            'You have to be authorized in order to view or add your friends.',
                                            style: GoogleFonts.poppins(
                                                color: Color(0xff3D4F5E),
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14)),
                                        InkWell(
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                top: 10, bottom: 10),
                                            alignment: Alignment.center,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.055,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.9,
                                            decoration: const BoxDecoration(
                                                color: Color(0xffCE8C8C),
                                                borderRadius: BorderRadius.all(
                                                    (Radius.circular(10)))),
                                            child: Text("Authorize",
                                                style: GoogleFonts.poppins(
                                                    color:
                                                        const Color(0xffFFFFFF),
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ),
                                          onTap: () {
                                            // Navigator.pop(context);
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (_) =>
                                                        InvitetoggleApp(
                                                            GameMode: '',
                                                            packname: '',
                                                            packId: 0,
                                                            inviteFriend:
                                                                false)));
                                          },
                                        ),
                                      ],
                                    )))
                                  : ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: friendlist.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        if (friendlist[index]["user_image"]
                                                .contains("http") ||
                                            friendlist[index]["user_image"]
                                                .toString()
                                                .contains("https")) {
                                          urlImage = true;
                                        } else {}
                                        return Container(
                                            margin: EdgeInsets.only(top: 5),
                                            color: Colors.white,
                                            child: ListTile(
                                              leading: urlImage
                                                  ? CircleAvatar(
                                                      backgroundColor:
                                                          Color(0xFFD1CFCF),
                                                      radius: 20,
                                                      backgroundImage:
                                                          NetworkImage(
                                                              friendlist[index][
                                                                  "user_image"]))
                                                  : CircleAvatar(
                                                      radius: 20,
                                                      backgroundImage: NetworkImage(
                                                          '${URLS.IMAGE_URL}/${friendlist[index]['user_image']}'),
                                                    ),
                                              title: Text(
                                                '${friendlist[index]["first_name"]}',
                                                style: GoogleFonts.poppins(
                                                    color: Color(0xff000000),
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              subtitle: Text(
                                                'Exp ${friendlist[index]["user_exp"]}',
                                                style: GoogleFonts.poppins(
                                                    color: Colors.grey,
                                                    fontSize: 10,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ));
                                      }))),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text('Achievements',
                                      style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500)),
                                  SizedBox(
                                    width: 7,
                                  ),
                                  Text('(10)',
                                      style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400)),
                                ],
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                AchievementScreen()));
                                  },
                                  child: Text(
                                    'View all',
                                    style: GoogleFonts.poppins(
                                      color: Color(0xffCE8C8C),
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ))
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          height: 120,
                          width: MediaQuery.of(context).size.width,
                          // color: Colors.amber,
                          child: GridView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithMaxCrossAxisExtent(
                                      mainAxisSpacing: 5,
                                      maxCrossAxisExtent: 180,
                                      mainAxisExtent: 110),
                              itemCount: 10,
                              itemBuilder: (BuildContext context, index) {
                                return Card();
                              }),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 10, bottom: 10),
                    child: Row(
                      children: [
                        Text('Pack collections',
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w500)),
                        SizedBox(
                          width: 7,
                        ),
                        Text('($packs)',
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ),
                  loading
                      ? Center(
                          child: CircularProgressIndicator(
                          color: Color(0xffCE8C8C),
                        ))
                      : mypack.length > 0
                          ? Container(
                              padding: EdgeInsets.only(left: 20, right: 20),
                              height: 120,
                              width: MediaQuery.of(context).size.width,
                              // color: Colors.amber,
                              child: GridView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  gridDelegate:
                                      const SliverGridDelegateWithMaxCrossAxisExtent(
                                          mainAxisSpacing: 10,
                                          maxCrossAxisExtent: 180,
                                          mainAxisExtent: 110),
                                  itemCount: mypack.length,
                                  itemBuilder: (BuildContext context, index) {
                                    return Container(
                                      child: Column(
                                        children: [
                                          Container(
                                            width: 175,
                                            height: 90,
                                            decoration: BoxDecoration(
                                              color: Colors.grey,
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                    '${URLS.IMAGE_URL}/${mypack[index]["image1"]}',
                                                  ),
                                                  fit: BoxFit.fitWidth),
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(5),
                                                  topRight: Radius.circular(5)),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(3),
                                            height: 30,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(5),
                                                    bottomRight:
                                                        Radius.circular(5))),
                                            child: FittedBox(
                                              child: Text(
                                                textAlign: TextAlign.center,
                                                '${mypack[index]["pack_name"]}',
                                                style: GoogleFonts.poppins(
                                                  color:
                                                      const Color((0xff544D4D)),
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  }),
                            )
                          : Container(),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}

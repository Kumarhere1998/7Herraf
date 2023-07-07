// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:herraf_app/api_servivce.dart';
import 'package:herraf_app/bottomNavBar.dart';
import 'package:herraf_app/practiceGameScreen.dart';
import 'package:herraf_app/practiceGameStart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PracticeGamePlay extends StatefulWidget {
  Map? gameFriend;
  final String packname;
  final int packid;
  final int Id;

  PracticeGamePlay({
    this.gameFriend,
    super.key,
    this.packname = '',
    this.packid = 1,
    this.Id = 0,
  });

  @override
  State<PracticeGamePlay> createState() => _PracticeGamePlayState();
}

class _PracticeGamePlayState extends State<PracticeGamePlay> {
  List<dynamic> groupUsers = [];
  List<dynamic> mycard = [];
  late int practiceInfo;

  bool showSpinner = false;
  int currentPage = 0;

  var profileData;
  bool valuefirst = false;
  bool valuesecond = false;
  bool isLoading = false;

  String user_photo = '';

  var box;

  @override
  void initState() {
    _getUserInfo();
    // if (widget.gameFriend != null) {
    //   groupUsers.add(widget.gameFriend);
    // } else {}
    print(user_photo);

    super.initState();
  }

  _getUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      user_photo = prefs.getString("photo")!;
    });
  }

  bool isSwitched = false;
  var textValue = 'Switch is OFF';

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        textValue = 'Switch Button is ON';
      });
    } else {
      setState(() {
        isSwitched = false;

        textValue = 'Switch Button is OFF';
      });
    }
  }

  _playPracticeGame() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    ApiService.practicegame(pref.getString('user_id')).then((value) {
      setState(() {
        practiceInfo = value['game_group_id'];
        if (value['status']) {
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => PracticeGame(groupId: practiceInfo)));
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      PracticeGameScreen(groupId: practiceInfo)));
          Future.delayed(const Duration(seconds: 1), () {
            setState(() {
              isLoading = false;
            });
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffE5E5E5),
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Stack(alignment: Alignment.topCenter,
                      //clipBehavior: Clip.none,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.25,
                          width: double.infinity,
                          child: Image.asset(
                              "assets/images/background-top(2).png"),
                        ),
                        Positioned(
                            top: MediaQuery.of(context).size.height * 0.05,
                            child: Column(
                              children: <Widget>[
                                InkWell(
                                  onTap: () {
                                    //Navigator.of(context).pop();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                BottomNav(2)));
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        top: 0, right: 200),
                                    alignment: Alignment.centerLeft,
                                    child: Row(children: <Widget>[
                                      Icon(
                                        Icons.arrow_back,
                                        size: 24,
                                        color: Color(0xff212121),
                                      ),
                                      Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8)),
                                      Text(
                                        "Practice game",
                                        style: GoogleFonts.poppins(
                                            color: Color(0xff212121),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ]),
                                  ),
                                ),
                                Container(
                                    // margin: EdgeInsets.only(
                                    //   top: 20,
                                    // ),
                                    alignment: Alignment.center,
                                    height: 80,
                                    width: 90,
                                    child: Image.asset(
                                        "assets/images/pack-change.png")),
                              ],
                            )),
                      ]),
                  Container(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      user_photo == null
                          ? Container(
                              width: MediaQuery.of(context).size.width * 0.30,
                              height: MediaQuery.of(context).size.height * 0.14,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: AssetImage(
                                      'assets/images/user1.png',
                                    ),
                                    fit: BoxFit.cover),
                              ),
                            )
                          : Container(
                              width: MediaQuery.of(context).size.width * 0.30,
                              height: MediaQuery.of(context).size.height * 0.14,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        // '${URLS.IMAGE_URL}/$user_photo'
                                        '$user_photo'
                                        ),
                                    fit: BoxFit.cover),
                              ),
                            ),
                      Text(
                        'v/s',
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.30,
                        height: MediaQuery.of(context).size.height * 0.14,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage(
                                'assets/images/CPU player.png',
                              ),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ],
                  )),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            isLoading = true;
                            _playPracticeGame();
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 15),
                          width: 309,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(0xffCE8C8C),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Center(
                            child: isLoading == false
                                ? Text(
                                    'Start Game ',
                                    style: GoogleFonts.poppins(
                                      color: Color(0xffffffffff),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                : CircularProgressIndicator(
                                    color: Color(0xffffffffff),
                                  ),
                          ),
                        ),
                      ),
                    ),
                  )
                ])));
  }
}

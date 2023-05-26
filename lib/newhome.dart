// import 'package:carousel_slider/carousel_slider.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:herraf_app/api_servivce.dart';
import 'package:herraf_app/dailyStreak.dart';
import 'package:herraf_app/dailystreak2.dart';
import 'package:herraf_app/dailystreak3.dart';
import 'package:herraf_app/dailystreakone.dart';
import 'package:herraf_app/mylegague.dart';
import 'package:herraf_app/newhelp1.dart';
import 'package:herraf_app/pack.dart';
import 'package:herraf_app/practiceGamePlay.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:audioplayers/audioplayers.dart';

class HomepageOne extends StatefulWidget {
  const HomepageOne({Key? key}) : super(key: key);

  @override
  State<HomepageOne> createState() => _HomepageOneState();
}

class Soundupdate {
  String user_id = '';
  String sound_effects = '';
  String music = '';
  String notification_sound = '';
}

class _HomepageOneState extends State<HomepageOne> {
  bool? state;
  List<Widget> items = [
    const SliderWidget(),
    const SliderTwo(),
    const SlideThree(),
  ];
  bool isclassicSelected = false;
  bool ispracticeSelected = false;
  bool isSound = false;
  bool isMusic = false;
  bool isNotification = false;
  int _selectedIndex = 0;

  final player = AudioCache();

  @override
  void initState() {
    sounddata();
    membership();
    _selectedIndex = data.length;
    _notification();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  int _index = 0;
  int index = 0;
  Map sound = {};
  List data = [];
  List<dynamic> notification = [];
  bool isLoading = true;

  Map soundupdate = {};

  membership() {
    ApiService.membership().then((value) {
      setState(() {
        data = value["data"];
        isLoading = false;
      });
    });
  }

  // var userName;
  _notification() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    ApiService.notification(
      prefs.getString('user_id'),
    ).then((value) {
      setState(() {
        notification = [];
        notification = value["data"];
        // print(notification);
      });
    });
  }

  Future<void> soundupdatehdata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    ApiService.soundupdatehdata(
            prefs.getString('user_id'), isSound, isMusic, isNotification)
        .then((value) {
      sounddata();
    });
  }

  sounddata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    ApiService.sounddata(prefs.getString('user_id')).then((value) {
      // setState(() {
      var result = value["data"];

      isSound = result["sound_effects"] == 1 ? true : false;
      isMusic = result["music"] == 1 ? true : false;
      isNotification = result["notification_sound"] == 1 ? true : false;

      prefs.setBool("sound_effect", isSound);
      prefs.setBool("music", isMusic);
      prefs.setBool("notification_effect", isNotification);

      print(
          "${prefs.getBool('notification_effect')}_notification_effect_${isNotification}");
    });
    // });
  }

  _selectedMember(i) {
    _selectedIndex = i;

    switch (_selectedIndex) {
      case 0:
        return showDialog(
            context: context,
            builder: (ctx) => Container(
                  height: MediaQuery.of(context).size.height * 0.209,
                  width: MediaQuery.of(context).size.width * 0.893,
                  child: Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      AlertDialog(
                          backgroundColor: const Color(0xffFAFAFA),
                          content: SizedBox(
                            height: 250,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Classic",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                      color: const Color((0xff212121))),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  color: const Color(0xffFFFFFF),
                                  height: 48,
                                  width: 256,
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text("Play randomly or with friends",
                                            style: GoogleFonts.poppins(
                                                color: const Color(0xff786E6E),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400)),
                                      ]),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  color: const Color(0xffFFFFFF),
                                  height: 48,
                                  width: 256,
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text("3 minutes limit",
                                            style: GoogleFonts.poppins(
                                                color: const Color(0xff786E6E),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400)),
                                      ]),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  color: const Color(0xffFFFFFF),
                                  height: 72,
                                  width: 256,
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                            "Receive game experience and\nincrease your league",
                                            style: GoogleFonts.poppins(
                                                color: const Color(0xff786E6E),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400)),
                                      ]),
                                ),
                              ],
                            ),
                          )),
                      Positioned(
                        top: 280,
                        right: 50,
                        child: GestureDetector(
                          child: const Icon(
                            Icons.cancel,
                            color: Color(0xffCE8C8C),
                            size: 40,
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      )
                    ],
                  ),
                ));

      case 1:
        return showDialog(
            context: context,
            builder: (ctx) => Container(
                  height: MediaQuery.of(context).size.height * 0.209,
                  width: MediaQuery.of(context).size.width * 0.893,
                  child: Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      AlertDialog(
                          backgroundColor: const Color(0xffFAFAFA),
                          content: SizedBox(
                            height: 250,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Pratics",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                      color: const Color((0xff212121))),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  color: const Color(0xffFFFFFF),
                                  height: 48,
                                  width: 256,
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text("Computer based game",
                                            style: GoogleFonts.poppins(
                                                color: const Color(0xff786E6E),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400)),
                                      ]),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  color: const Color(0xffFFFFFF),
                                  height: 48,
                                  width: 256,
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text("Unlimited time",
                                            style: GoogleFonts.poppins(
                                                color: const Color(0xff786E6E),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400)),
                                      ]),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  color: const Color(0xffFFFFFF),
                                  height: 72,
                                  width: 256,
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                            "Doesn't affect your daily lives \nwhen losing",
                                            style: GoogleFonts.poppins(
                                                color: const Color(0xff786E6E),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400)),
                                      ]),
                                ),
                              ],
                            ),
                          )),
                      Positioned(
                        top: 280,
                        right: 50,
                        child: GestureDetector(
                          child: const Icon(
                            Icons.cancel,
                            color: Color(0xffCE8C8C),
                            size: 40,
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      )
                    ],
                  ),
                ));
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Image.asset("assets/images/background-top(1).png"),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40, left: 25, right: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: (() {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => League()));
                        }),
                        child: Container(
                          child: Column(
                            children: [
                              SizedBox(
                                  height: 70,
                                  child:
                                      Image.asset("assets/images/silver.png")),
                              Text(
                                "Silver",
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xff212121)),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                          child: Column(
                            children: [
                              SizedBox(
                                  height: 70,
                                  child: Image.asset(
                                      "assets/images/daily_streak.png")),
                              Text(
                                "25",
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xff212121)),
                              )
                            ],
                          ),
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (ctx) => Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              (Radius.circular(10)))),
                                      child: AlertDialog(
                                        title: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Set up your daily goal!',
                                              style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 18,
                                                  color: const Color(
                                                      (0xff212121))),
                                            ),
                                            IconButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                icon: Icon(Icons.close))
                                          ],
                                        ),
                                        content: Text(
                                          'Choose a combination of objectives you want to meet by the end of the day.',
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              color: Colors.grey),
                                        ),
                                        actions: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  Navigator.pop(context);
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
                                                      0.300,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                        color: Colors.grey,
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              (Radius.circular(
                                                                  10)))),
                                                  child: Text("Skip",
                                                      style:
                                                          GoogleFonts.poppins(
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      132,
                                                                      131,
                                                                      131),
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500)),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              DailyStreak()));
                                                  // Navigator.of(context).push(
                                                  //     MaterialPageRoute(
                                                  //         builder: (context) =>
                                                  //             DailyStreakTwo()));
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
                                                      0.300,
                                                  decoration:
                                                      const BoxDecoration(
                                                          color:
                                                              Color(0xffCE8C8C),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  (Radius
                                                                      .circular(
                                                                          10)))),
                                                  child: Text("Explore",
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
                                          SizedBox(
                                            height: 10,
                                          )
                                        ],
                                      ),
                                    ));
                          }),
                      Column(
                        children: [
                          SizedBox(
                              height: 70,
                              child: Image.asset("assets/images/help.png")),
                          Text(
                            "Pneumo",
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff212121)),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 165,
                  right: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.060,
                        width: MediaQuery.of(context).size.width * 0.397,
                        child: InkWell(
                          onTap: (() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HelpPage()));
                          }),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset("assets/images/help.png"),
                                Text("Help",
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                        color: const Color(0xff212121))),
                              ]),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.060,
                        width: MediaQuery.of(context).size.width * 0.408,
                        child: InkWell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset("assets/images/music__3_.png"),
                                Text("Sounds",
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                        color: const Color(0xff212121))),
                              ],
                            ),
                            onTap: () {
                              setState(() {
                                showDialog(
                                    context: context,
                                    builder: (ctx) {
                                      return AlertDialog(content:
                                          StatefulBuilder(builder:
                                              (BuildContext context,
                                                  StateSetter setState) {
                                        return Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                          height: 200,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              9,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Container(
                                                margin:
                                                    EdgeInsets.only(left: 70),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Sounds",
                                                      style: GoogleFonts.poppins(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 20,
                                                          color: const Color(
                                                              (0xff212121))),
                                                    ),
                                                    GestureDetector(
                                                      child: const Icon(
                                                        Icons.cancel,
                                                        color:
                                                            Color(0xffCE8C8C),
                                                        size: 30,
                                                      ),
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text("Sound effects",
                                                        style: GoogleFonts.poppins(
                                                            color: const Color(
                                                                0xff544D4D),
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500)),
                                                    Switch(
                                                      value: isSound,
                                                      onChanged: (value) {
                                                        state = value;
                                                        setState(
                                                          () {
                                                            isSound = value;
                                                            soundupdatehdata();
                                                          },
                                                        );
                                                      },
                                                      activeColor:
                                                          Color(0xffCE8C8C),
                                                      activeTrackColor:
                                                          Color(0xffCE8C8C),
                                                      inactiveThumbColor:
                                                          Color.fromARGB(255,
                                                              181, 177, 177),
                                                      inactiveTrackColor:
                                                          Color.fromARGB(245,
                                                              191, 189, 189),
                                                    )
                                                  ]),
                                              Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text("Music",
                                                        style: GoogleFonts.poppins(
                                                            color: const Color(
                                                                0xff544D4D),
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500)),
                                                    Switch(
                                                      value: isMusic,
                                                      onChanged: (value) {
                                                        state = value;
                                                        setState(
                                                          () {
                                                            isMusic = value;
                                                            soundupdatehdata();
                                                          },
                                                        );
                                                      },
                                                      activeColor:
                                                          Color(0xffCE8C8C),
                                                      activeTrackColor:
                                                          Color(0xffCE8C8C),
                                                      inactiveThumbColor:
                                                          Color.fromARGB(255,
                                                              181, 177, 177),
                                                      inactiveTrackColor:
                                                          Color.fromARGB(245,
                                                              191, 189, 189),
                                                    ),
                                                  ]),
                                              Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text("Notification sound",
                                                        style: GoogleFonts.poppins(
                                                            color: const Color(
                                                                0xff544D4D),
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500)),
                                                    Switch(
                                                      value: isNotification,
                                                      onChanged: (value) {
                                                        //state = value;

                                                        setState(
                                                          () {
                                                            if (isNotification) {
                                                              isNotification =
                                                                  false;
                                                            } else {
                                                              isNotification =
                                                                  true;
                                                            }

                                                            //isNotification =
                                                            //  value;
                                                            soundupdatehdata();
                                                          },
                                                        );
                                                      },
                                                      activeColor:
                                                          Color(0xffCE8C8C),
                                                      activeTrackColor:
                                                          Color(0xffCE8C8C),
                                                      inactiveThumbColor:
                                                          Color.fromARGB(255,
                                                              181, 177, 177),
                                                      inactiveTrackColor:
                                                          Color.fromARGB(245,
                                                              191, 189, 189),
                                                    ),
                                                  ]),
                                            ],
                                          ),
                                        );
                                      }));
                                    });
                              });

                              // Create button
                            }),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 380,
            child: isLoading == true
                ? Center(
                    child: CircularProgressIndicator(color: Color(0xffCE8C8C)),
                  )
                : PageView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: data.length,
                    controller: PageController(viewportFraction: 0.7),
                    // onPageChanged: (int index) => setState(() => _index = index),
                    onPageChanged: (int index) => setState(() {
                      print(index);
                      _index = index;
                    }),
                    itemBuilder: (_, i) {
                      return Transform.scale(
                        scale: i == _index ? 1 : 0.9,
                        child: Card(
                          color: Colors.white,
                          elevation: 8.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    padding: const EdgeInsets.only(
                                      top: 30,
                                    ),
                                    child: Text(
                                      '${data[i]["game_mode_name"]}',
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        color: Color(0xFF212121),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      _selectedMember(i);
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                          top: 30, left: 20),
                                      child: Image.asset(
                                        'assets/images/homeicon.png',
                                        height: 25,
                                        width: 25,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              InkWell(
                                onTap: () {
                                  print('${data[i]["game_mode_name"]}');
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 32.0,
                                  ),
                                  child: Stack(
                                      alignment: Alignment.topCenter,
                                      clipBehavior: Clip.none,
                                      children: [
                                        Container(
                                          width: 260,
                                          height: 275,
                                          decoration: BoxDecoration(
                                            // color: Colors.white,
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    '${URLS.IMAGE_URL}/${data[i]["game_mode_image"]}'),
                                                fit: BoxFit.cover),

                                            borderRadius: BorderRadius.all(
                                                Radius.circular(0.0)),
                                          ),

                                          // color: Colors.orang
                                        ),
                                      ]),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
          Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(32)),
                color: Color(0xffCE8C8C)),
            height: MediaQuery.of(context).size.height * 0.071,
            width: MediaQuery.of(context).size.width * 0.38,
            child: TextButton(
                onPressed: () async {
                  if (_index == 0) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyPack()));
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PracticeGamePlay()));
                  }
                },
                child: Text(
                  "Play",
                  style: GoogleFonts.poppins(
                      color: const Color((0xffFFFFFF)),
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                )),
          ),
          notification.length > 0
              ? Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    margin: EdgeInsets.only(
                      right: 20,
                    ),
                    padding: EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: Color.fromARGB(255, 227, 223, 223)),
                    height: MediaQuery.of(context).size.height * 0.051,
                    width: MediaQuery.of(context).size.width * 0.58,
                    child: Center(
                      child: Text(
                        '${notification[index]["description"].split(",")[0]} has invited you to play',
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                            color: const Color((0xffFFFFFF)),
                            fontWeight: FontWeight.w600,
                            fontSize: 12),
                      ),
                    ),
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}

class SliderWidget extends StatelessWidget {
  const SliderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: SizedBox(
        // height: MediaQuery.of(context).size.height * 0.250,
        width: MediaQuery.of(context).size.width * 0.68,
        // decoration: BoxDecoration(
        //     // color: const Color(0xffF1F6FF),
        //     // border: Border.all(width: 2.68, color: const Color(0xffB6E1F4)),
        //     borderRadius: const BorderRadius.all(Radius.circular(21.46))),
        child: Image.asset("assets/images/classic.png"),
      ),
      onTap: () {},
    );
  }
}

class SliderTwo extends StatelessWidget {
  const SliderTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height * 0.396,
      // width: MediaQuery.of(context).size.width * 0.65,
      width: MediaQuery.of(context).size.width * 0.68,
      decoration: const BoxDecoration(
          // color: const Color(0xffF1F6FF),
          // border: Border.all(width: 2.68, color: const Color(0xffB6E1F4)),
          borderRadius: BorderRadius.all(Radius.circular(21.46))),
      child: Image.asset("assets/images/classic.png"),
    );
  }
}

class SlideThree extends StatelessWidget {
  const SlideThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        // height: MediaQuery.of(context).size.height * 0.396,
        width: MediaQuery.of(context).size.width * 0.68,
        // decoration: BoxDecoration(
        //     color: const Color(0xffF1F6FF),
        //     border: Border.all(width: 2.68, color: const Color(0xffB6E1F4)),
        //     borderRadius: const BorderRadius.all(Radius.circular(21.46))),
        child: Image.asset("assets/images/classic.png"));
  }
}

class CarouselSliderExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        CarouselSlider(
          items: [
            Container(
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: const DecorationImage(
                  image: NetworkImage("url"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: const DecorationImage(
                  image: NetworkImage("url"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: const DecorationImage(
                  image: NetworkImage("url"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
          options: CarouselOptions(
            height: 380.0,
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            viewportFraction: 0.8,
          ),
        ),
      ]),
    );
  }
}

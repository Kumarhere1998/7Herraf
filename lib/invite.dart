// ignore_for_file: prefer_const_constructors, unnecessary_null_comparison

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:herraf_app/api_servivce.dart';
import 'package:herraf_app/game.dart';
import 'package:herraf_app/invitetoggle.dart';
import 'package:page_transition/page_transition.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:toggle_switch/toggle_switch.dart';

class InvitefriendPage extends StatefulWidget {
  Map? gameFriend;
  final String packname;
  final int packid;
  final int Id;
  final int packID;

  InvitefriendPage({
    this.gameFriend,
    super.key,
    this.packname = '',
    this.packid = 0,
    this.Id = 0,
    this.packID = 0,
  });

  @override
  State<InvitefriendPage> createState() => _InvitefriendPageState();
}

class _InvitefriendPageState extends State<InvitefriendPage> {
  List<dynamic> groupUsers = [];
  List<String> GameMode = ['Single', '2X2'];

  int a = 2;
  int a2 = 2;
  int a2Length = 0;
  int player = 0;

  void _incrementCounter() {
    setState(() {
      a++;
    });
  }

  void _incrementCounter2() {
    if (a2 < 6)
      setState(() {
        a2 = a2 + 2;
        a2Length++;
      });
  }

  void _decrementCounter() {
    if (a > 2)
      setState(() {
        a--;
      });
  }

  void _decrementCounter2() {
    if (a2 > 3)
      setState(() {
        a2 = a2 - 2;
        a2Length--;
      });
  }

  void _playerCount() {
    setState(() {
      player++;
    });
  }

  bool showSpinner = false;
  int currentPage = 0;

  var profileData;
  bool valuefirst = false;
  bool valuesecond = false;

  String user_photo = "";

  var box;

  @override
  void initState() {
    _getUserInfo();
    print(widget.gameFriend);
    if (widget.gameFriend != null) {
      setState(() {
        groupUsers.add(widget.gameFriend);
      });
    }

    if (widget.Id > 10) {
      _findingFriend();
    }
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
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitched = false;

        textValue = 'Switch Button is OFF';
      });
      print('Switch Button is OFF');
    }
  }

  late Timer mytimer;
  _startPartnerFindingTimer() {
    mytimer = Timer.periodic(const Duration(seconds: 10), (timer) {
      print("CALLING ME EVERY 10 SECONDS");
      _findYourPartner();
      //code to run on every 5 seconds
    });
  }

  _findingFriend() {
    mytimer = Timer.periodic(const Duration(seconds: 10), (timer) async {
      print("CALLING ME EVERY 10 SECONDS");
      // print('Which ID==>${id}');

      await ApiService.findingFriend(widget.Id).then((value) {
        print('ACCEPTEDFRIEND ==>$value');
        // print(value);
        if (value["status"] == true) {
          for (var i = 0; i < value["data"].length; i++) {
            if (mounted) {
              setState(() {
                groupUsers.add({
                  "id": value["data"][i]["id"],
                  "image": value["data"][i]["user_image"],
                  "group_id": value["game_group_id"],
                });
              });

              if (groupUsers.length > 0) {
                print(groupUsers);
                print("CALLEXIT");
                mytimer.cancel();
                Navigator.pop(context);
              }
            }
          }
          print("COMING HERE");
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // print('FRIEND IMAGE==>${widget.gameFriend!['image']}');
    // print('Which ID ==>${widget.packID}');
    return Scaffold(
        backgroundColor: Color(0xffE5E5E5),
        body: SafeArea(
          child: Container(
              width: double.infinity,
              child: Center(
                  child: Column(children: <Widget>[
                Stack(alignment: Alignment.topCenter, children: [
                  Image.asset("assets/images/background-top(2).png"),
                  Positioned(
                      // top: MediaQuery.of(context).size.height * 0.05,
                      child: Column(
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          padding: const EdgeInsets.only(top: 0, right: 200),
                          alignment: Alignment.centerLeft,
                          child: Row(children: <Widget>[
                            Icon(
                              Icons.arrow_back,
                              size: 24,
                              color: Color(0xff212121),
                            ),
                            Padding(padding: const EdgeInsets.only(left: 8)),
                            Text(
                              "Classic game",
                              style: GoogleFonts.poppins(
                                  color: Color(0xff212121),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ]),
                        ),
                      ),
                      Container(
                          alignment: Alignment.center,
                          height: 80,
                          width: 90,
                          child: Image.asset("assets/images/pack-change.png")),
                      Container(
                        margin: EdgeInsets.only(
                          top: 10,
                        ),
                        child: Text(
                          widget.packname,
                          style: GoogleFonts.poppins(
                            color: Color(0xff212121),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  )),
                ]),
                Container(
                    child: ToggleSwitch(
                  minWidth: 110.0,
                  minHeight: 50,
                  cornerRadius: 36.0,
                  activeBgColors: [
                    [
                      Color(0xffCE8C8C),
                    ],
                    [
                      Color(0xffCE8C8C),
                    ]
                  ],
                  activeFgColor: Color(0xffffffff),
                  inactiveBgColor: Colors.white,
                  inactiveFgColor: Color(0xffCE8C8C),
                  initialLabelIndex: currentPage,
                  totalSwitches: 2,
                  // labels: ['Single', '2x2'],
                  labels: GameMode,
                  radiusStyle: true,
                  onToggle: (index) {
                    setState(() {
                      currentPage = index!;
                    });
                    print("Switch to: ${GameMode[index!]}");
                  },
                )),
                Container(
                  child: currentPage == 0 ? FirstPageWidget() : SecondWidget(),
                ),
                Spacer(),
                groupUsers.length == 0
                    ? Container(
                        child: InkWell(
                          onTap: () {
                            _startPartnerFindingTimer();

                            setState(() {
                              showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (context) {
                                    Future.delayed(Duration(minutes: 5), () {
                                      mytimer.cancel();
                                      print("EXITNGME");
                                      Navigator.of(context).pop(true);
                                    });
                                    return AlertDialog(
                                      backgroundColor: const Color(0xffFAFAFA),
                                      content: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.23,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.50,
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 10),
                                                    child: Row(
                                                      children: [
                                                        const Icon(
                                                          Icons
                                                              .watch_later_outlined,
                                                          size: 25,
                                                          color:
                                                              Color(0xffCE8C8C),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        TweenAnimationBuilder<
                                                                Duration>(
                                                            duration:
                                                                const Duration(
                                                                    minutes: 5),
                                                            tween: Tween(
                                                                begin:
                                                                    const Duration(
                                                                        minutes:
                                                                            5),
                                                                end: Duration
                                                                    .zero),
                                                            onEnd: () {
                                                              mytimer.cancel();
                                                              print(
                                                                  'Timer ended');
                                                            },
                                                            builder:
                                                                (BuildContext
                                                                        context,
                                                                    Duration
                                                                        value,
                                                                    Widget?
                                                                        child) {
                                                              final minutes =
                                                                  value
                                                                      .inMinutes;
                                                              final seconds =
                                                                  value.inSeconds %
                                                                      60;

                                                              return Padding(
                                                                  padding: const EdgeInsets
                                                                          .symmetric(
                                                                      vertical:
                                                                          5),
                                                                  child: Text(
                                                                      '$minutes : $seconds',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: const TextStyle(
                                                                          color: Color(
                                                                              0xff00253A),
                                                                          fontWeight: FontWeight
                                                                              .w600,
                                                                          fontSize:
                                                                              18)));
                                                            }),
                                                      ],
                                                    ),
                                                  ),
                                                  IconButton(
                                                    icon: Icon(
                                                      Icons.close,
                                                      size: 25,
                                                      color: Color(0xffCE8C8C),
                                                    ),
                                                    onPressed: () {
                                                      mytimer.cancel();
                                                      Navigator.pop(context);
                                                    },
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                margin:
                                                    EdgeInsets.only(top: 40),
                                                child:
                                                    CircularProgressIndicator(
                                                  color: Color(0xffCE8C8C),
                                                  value: null,
                                                ),
                                              ),
                                              Container(
                                                margin:
                                                    EdgeInsets.only(top: 25),
                                                child: Text(
                                                  "Finding for an opponents. ...",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                            ],
                                          )),
                                    );
                                  });
                            });
                          },
                          child: Container(
                            margin: new EdgeInsets.symmetric(
                                horizontal: 30.0, vertical: 0),
                            width: 309,
                            height: 53,
                            decoration: BoxDecoration(
                              color: Color(0xffCE8C8C),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Center(
                              child: Text(
                                'Start random game ',
                                style: GoogleFonts.poppins(
                                  color: Color(0xffffffffff),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    : Container(
                        child: InkWell(
                          onTap: () {
                            _playerCount();
                            // print('PlayerCount==>$player');
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.topToBottom,
                                    child: Game(
                                        groupUsers[0], widget.packid, player)));
                          },
                          child: Container(
                            margin: new EdgeInsets.symmetric(
                                horizontal: 30.0, vertical: 0),
                            width: 309,
                            height: 53,
                            decoration: BoxDecoration(
                              color: Color(0xffCE8C8C),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Center(
                              child: Text(
                                'Start Game ',
                                style: GoogleFonts.poppins(
                                  color: Color(0xffffffffff),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                // ],
                SizedBox(
                  height: 10,
                )
              ]))),
        ));
  }

  Widget FirstPageWidget() {
    // print(GameMode[0]);
    return Container(
        child: Column(
      children: <Widget>[
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
              onTap: _decrementCounter,
              child: Container(
                child: Image.asset(
                  'assets/images/negative.png',
                  width: MediaQuery.of(context).size.width * 0.10,
                  height: MediaQuery.of(context).size.height * 0.10,
                ), // <-- SEE
              ),
            ),
            Container(
              //margin: new EdgeInsets.symmetric(horizontal: 19),
              padding: const EdgeInsets.only(top: 5, left: 15, right: 10),
              child: Text(
                '$a',
                style: GoogleFonts.poppins(
                  color: Color(0xff000000),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            InkWell(
              onTap: _incrementCounter,
              child: Container(
                //margin: new EdgeInsets.symmetric(horizontal: 19),
                padding: const EdgeInsets.only(top: 5, left: 10, right: 20),
                child: Image.asset(
                  'assets/images/plus.png',
                  width: MediaQuery.of(context).size.width * 0.10,
                  height: MediaQuery.of(context).size.height * 0.10,
                ), // <-- SEE
              ),
            ),
          ],
        )),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.28,
              height: MediaQuery.of(context).size.height * 0.12,
              child: user_photo == null
                  ? Image(image: AssetImage('assets/images/user1.png'))
                  : Image(
                      image: NetworkImage(user_photo),
                      fit: BoxFit.cover,
                    ),
            ),
            if (groupUsers.length == 0) ...[
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => InvitetoggleApp(
                            GameMode: GameMode[0],
                            packname: widget.packname,
                            packId: widget.packid,
                            // packId: widget.packid,
                          )));
                },
                child: Container(
                  child: Image.asset(
                    'assets/images/user1.png',
                    width: MediaQuery.of(context).size.width * 0.30,
                    height: MediaQuery.of(context).size.height * 0.14,
                  ),
                  // <-- SEE
                ),
              )
            ],
            for (var i = 0; i < groupUsers.length; i++) ...[
              Container(
                child: groupUsers[i]["image"] == ''
                    ? Container(
                        width: MediaQuery.of(context).size.width * 0.28,
                        height: MediaQuery.of(context).size.height * 0.12,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/user1.png'),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        // child: Image.network(groupUsers[i]["image"]),
                      )
                    : Container(
                        width: MediaQuery.of(context).size.width * 0.28,
                        height: MediaQuery.of(context).size.height * 0.12,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(groupUsers[i]["image"]),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        // child: Image.network(widget.gameFriend!['image']),
                      ),
                // <-- SEE
              )
            ]
          ],
        )),
      ],
    ));
  }

  Widget SecondWidget() {
    // print(GameMode[1]);

    return Column(
      children: <Widget>[
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
              onTap: _decrementCounter2,
              child: Container(
                child: Image.asset(
                  'assets/images/negative.png',
                  width: MediaQuery.of(context).size.width * 0.10,
                  height: MediaQuery.of(context).size.height * 0.10,
                ), // <-- SEE
              ),
            ),
            Container(
              //margin: new EdgeInsets.symmetric(horizontal: 19),
              padding: const EdgeInsets.only(left: 15, top: 5, right: 10),
              child: Text(
                '$a2',
                style: GoogleFonts.poppins(
                  color: Color(0xff000000),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            InkWell(
              onTap: _incrementCounter2,
              child: Container(
                //margin: new EdgeInsets.symmetric(horizontal: 19),
                padding: const EdgeInsets.only(top: 5, left: 10, right: 20),
                child: Image.asset(
                  'assets/images/plus.png',
                  width: MediaQuery.of(context).size.width * 0.10,
                  height: MediaQuery.of(context).size.height * 0.10,
                ), // <-- SEE
              ),
            ),
          ],
        )),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Image.network(user_photo),
              width: MediaQuery.of(context).size.width * 0.30,
              height: MediaQuery.of(context).size.height * 0.14,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => InvitetoggleApp(
                          GameMode: GameMode[1],
                          packname: widget.packname,
                          packId: widget.packid,

                          // packId: widget.packid,
                        )));
              },
              child: Container(
                child: Image.asset(
                  'assets/images/user1.png',
                  width: MediaQuery.of(context).size.width * 0.30,
                  height: MediaQuery.of(context).size.height * 0.14,
                ), // <-- SEE
              ),
            )
          ],
        )),
        Container(
          height: 300,
          child: ListView.builder(
              itemCount: a2Length,
              shrinkWrap: true,
              itemBuilder: (context, index) => Container(
                    child: Column(
                      children: [
                        Text(
                          'VS',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => InvitetoggleApp(
                                          GameMode: GameMode[1],
                                          packname: widget.packname,
                                          packId: widget.packid,

                                          // packId: widget.packid,
                                        )));
                              },
                              child: Container(
                                child: Image.asset(
                                  'assets/images/user1.png',
                                  width:
                                      MediaQuery.of(context).size.width * 0.30,
                                  height:
                                      MediaQuery.of(context).size.height * 0.14,
                                ), // <-- SEE
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                print('PackIdOn${widget.packid}');
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => InvitetoggleApp(
                                          packname: widget.packname,
                                          packId: widget.packid,

                                          // packId: widget.packid,
                                          GameMode: GameMode[1],
                                        )));
                              },
                              child: Container(
                                child: Image.asset(
                                  'assets/images/user1.png',
                                  width:
                                      MediaQuery.of(context).size.width * 0.30,
                                  height:
                                      MediaQuery.of(context).size.height * 0.14,
                                ), // <-- SEE
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
        ),
      ],
    );
  }

  _findYourPartner() async {
    print(widget.packid);
    SharedPreferences pref = await SharedPreferences.getInstance();
    ApiService.randomgame(pref.getString('user_id'), widget.packid)
        .then((value) {
      print('Here==>$value');
      if (value["status"]) {
        //partner_image = value["user_image"];
        //  for (var i = 0; i < value["data"].length; i++) {
        if (mounted) {
          setState(() {
            groupUsers.add({
              "id": value["data"]["id"],
              "image": value["data"]["user_image"],
              "group_id": value["group_id"],
            });
          });

          if (groupUsers.length > 0) {
            print(groupUsers);
            print("CALLEXIT");
            mytimer.cancel();
            Navigator.pop(context);
          }
          //  }
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("${value['Player Vishesh']}")));
      }
    });
  }
}

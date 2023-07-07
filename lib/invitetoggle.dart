// ignore_for_file: unused_local_variable

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:herraf_app/addfriends.dart';
import 'package:herraf_app/api_servivce.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toggle_switch/toggle_switch.dart';

class InvitetoggleApp extends StatefulWidget {
  final String packname;
  final int packId;
  final String GameMode;
  bool inviteFriend;

  InvitetoggleApp({
    required this.packname,
    required this.packId,
    required this.GameMode,
    required this.inviteFriend,
  });
  Map? startGame = {};
  @override
  State<InvitetoggleApp> createState() => _InvitetoggleAppState();
}

class _InvitetoggleAppState extends State<InvitetoggleApp> {
  List<dynamic> groupUsers = [];
  int currentPage = 0;
  bool isSwitched = false;
  bool urlImage = false;
  String user_photo = '';
  String user_id = '';
  String full_name = '';
  String profileImage = '';

  List<dynamic> friendlist = [];
  List<dynamic> requestList = [];
  List<dynamic> gameFriend = [];
  Map? gameFreind = {};
  // List<dynamic> profileImage = [];

  List<String> pagelist = ['My friends', 'Request', 'Invite'];

  late Timer mytimer;

  @override
  void initState() {
    _friendlist();
    super.initState();
  }

  String search_name = '';
  bool _isSwitched = false;
  bool friendlistLoding = true;
  bool requestlistLoding = true;

  _friendlist() async {
    ApiService.friendlist().then((value) {
      friendlist = value["data"];
      setState(() {
        friendlistLoding = false;
      });
    });
  }

  getrequest() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    user_id = prefs.getString('user_id')!;
    ApiService.friend_request(prefs.getString(user_id)).then((value) {
      requestList = value["data"];
      setState(() {
        requestlistLoding = false;
      });
    });
  }

  _requestAccept(index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      user_id = prefs.getString('user_id')!;
    });
    ApiService.accept_request(
            prefs.getString('user_id'), requestList[index]['id'])
        .then((value) {});
  }

  _requestReject(index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      user_id = prefs.getString('user_id')!;
    });
    ApiService.reject_request(
            prefs.getString('user_id'), requestList[index]['id'])
        .then((value) {});
  }

  _searchFriend() {
    ApiService.searchFriend(search_name).then((value) {
      friendlist = value["data"];
      friendlistLoding = false;
    });
  }

  _inviteFriend4Game(index) async {
    ApiService.invite4Game(widget.GameMode, friendlist[index]['id'],
            widget.packname, widget.packId)
        .then((value) {
      print('VALUEHere==>$value');
      if (value['status']) {
        gameFreind = value;
        Navigator.pop(context, gameFreind);
      }
    });
  }

  @override
  void dispose() {
    mytimer;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: currentPage == 0
          ? InkWell(
              onTap: (() {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddFriendsPage()),
                );
              }),
              child: SizedBox(
                  height: 80,
                  width: 80,
                  child: Image.asset("assets/images/FAB.png")))
          : Container(),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              // color: Colors.amber,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  SizedBox(
                    // height: MediaQuery.of(context).size.height * 0.30,
                    width: double.infinity,
                    child: Image.asset("assets/images/background-top(1).png"),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            size: 24,
                            color: Color(0xff212121),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Friends',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff212121),
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: 70,
                    child: ToggleSwitch(
                      minWidth: MediaQuery.of(context).size.width * .7,
                      minHeight: 49,
                      activeBgColors: [
                        [
                          Color(0xffCE8C8C),
                        ],
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
                      totalSwitches: 3,
                      labels: pagelist,
                      onToggle: (index) {
                        setState(() {
                          currentPage = index!;
                          if (currentPage == 0) {
                            requestlistLoding = true;
                            _friendlist();
                          } else {
                            friendlistLoding = true;
                            getrequest();
                          }
                        });
                      },
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 170),
                      child: currentPage == 0
                          ? MyFriend()
                          : currentPage == 1
                              ? Requests()
                              : currentPage == 2
                                  ? Invite()
                                  : Container()),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }

  Widget MyFriend() {
    var friend = friendlist.length;
    // _friendlist();
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          left: 25,
          right: 25,
        ),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Container(
                child: Row(
                  children: [
                    Text('My Friends',
                        style: GoogleFonts.poppins(
                            color: Color(0xff544D4D),
                            fontSize: 18,
                            fontWeight: FontWeight.w500)),
                    SizedBox(
                      width: 7,
                    ),
                    Text('($friend)',
                        style: GoogleFonts.poppins(
                            color: Color(0xff544D4D),
                            fontSize: 15,
                            fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Text(
                      "Pack match",
                      style: GoogleFonts.poppins(
                          color: Color(0xff544D4D),
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                    Switch(
                      value: _isSwitched,
                      onChanged: (value) {
                        setState(() {
                          _isSwitched = value;
                          if (_isSwitched == true) {
                          } else {}
                        });
                      },
                      activeColor: Color(0xffCE8C8C),
                      activeTrackColor: Color(0xffCE8C8C),
                      inactiveThumbColor: Color.fromARGB(255, 181, 177, 177),
                      inactiveTrackColor: Color.fromARGB(245, 191, 189, 189),
                    )
                  ],
                ),
              )
            ]),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(33)),
              height: 50,
              child: TextFormField(
                onFieldSubmitted: _searchFriend(),
                onChanged: (value) {
                  setState(() {
                    search_name = value;
                  });
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(43.0),
                    ),
                    labelText: '',
                    suffixIcon: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        _searchFriend();
                      },
                    )),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 5),
                child: friendlistLoding
                    ? Center(child: CircularProgressIndicator())
                    : friendlist.isEmpty
                        ? Padding(
                            padding: const EdgeInsets.only(top: 250),
                            child: Center(
                                child: Text('No friends',
                                    style: GoogleFonts.poppins(
                                        color: Color(0xff3D4F5E),
                                        fontSize: 20))),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: friendlist.length,
                            itemBuilder: (BuildContext context, index) {
                              if (friendlist[index]["user_image"]
                                      .contains("http") ||
                                  friendlist[index]["user_image"]
                                      .toString()
                                      .contains("https")) {
                                urlImage = true;
                              } else {}
                              return Card(
                                  child: ListTile(
                                leading: urlImage
                                    ? CircleAvatar(
                                        backgroundColor:
                                            const Color(0xffffffff),
                                        radius: 30,
                                        backgroundImage: NetworkImage(
                                            friendlist[index]["user_image"]))
                                    : CircleAvatar(
                                        radius: 30,
                                        backgroundImage: NetworkImage(
                                            '${URLS.IMAGE_URL}/${friendlist[index]['user_image']}'),
                                      ),
                                title: Text(
                                  '${friendlist[index]["first_name"]}',
                                  style: GoogleFonts.poppins(
                                      color: Color(0xff000000),
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                                subtitle: Row(
                                  children: [
                                    widget.inviteFriend
                                        ? InkWell(
                                            onTap: () {
                                              print(friendlist[index]["id"]);
                                              _inviteFriend4Game(index);
                                            },
                                            child: Container(
                                              height: 20,
                                              child: Text(
                                                'Invite',
                                                style: GoogleFonts.poppins(
                                                    color: Color(0xffCE8C8C),
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                          )
                                        : Container(),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                        'Exp ${friendlist[index]["user_exp"]}'),
                                  ],
                                ),
                              ));
                            })),
          ],
        ),
      ),
    );
  }

  Widget Requests() {
    var request = requestList.length;
    // getrequest();
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: 25, right: 25),
        child: Column(children: [
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Text('Requests',
                  style: GoogleFonts.poppins(
                      color: Color(0xff544D4D),
                      fontSize: 18,
                      fontWeight: FontWeight.w500)),
              SizedBox(
                width: 7,
              ),
              Text('($request)',
                  style: GoogleFonts.poppins(
                      color: Color(0xff544D4D),
                      fontSize: 15,
                      fontWeight: FontWeight.w500)),
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width * .9,
            child: SizedBox(
                child: requestlistLoding
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : requestList.length == 0
                        ? Padding(
                            padding: const EdgeInsets.only(top: 250),
                            child: Center(
                              child: Text('No request found'),
                            ),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: requestList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Card(
                                  child: ListTile(
                                leading: requestList[index]["user_image"] ==
                                        null
                                    ? CircleAvatar(
                                        backgroundColor:
                                            const Color(0xffffffff),
                                        radius: 25,
                                        backgroundImage: const AssetImage(
                                            'assets/images/ronald.png'))
                                    : CircleAvatar(
                                        radius: 30,
                                        child: ClipOval(
                                          child: Image.network(
                                              requestList[index]["user_image"]
                                                  .toString()),
                                        )),
                                title: Row(
                                  children: <Widget>[
                                    Text(
                                      '${requestList[index]["first_name"]}',
                                      style: GoogleFonts.poppins(
                                          color: Color(0xff000000),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Exp 300",
                                        style: GoogleFonts.poppins(
                                            color: Color(0xff544D4D),
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Container(
                                        height: 30,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                // ('Reject');
                                                _requestReject(index);
                                              },
                                              child: Text('Reject',
                                                  style: GoogleFonts.poppins(
                                                      color: Color(0xff544D4D),
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                            ),
                                            SizedBox(
                                              width: 40,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                _requestAccept(index);
                                              },
                                              child: Text('Accept',
                                                  style: GoogleFonts.poppins(
                                                      color: Color(0xffCE8C8C),
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                            ),
                                          ],
                                        ),
                                      )
                                    ]),
                              ));
                            })),
          )
        ]),
      ),
    );
  }

  Widget Invite() {
    return ScrollConfiguration(
      behavior: ScrollBehavior(),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Share your invite code',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff212121),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Receive a discount on your pack of choice when referred successfully',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff786E6E),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                margin: const EdgeInsets.only(top: 25),
                height: 90,
                width: MediaQuery.of(context).size.width * .9,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xffD7D4D4),
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      '5   8   C   E   2',
                      style: TextStyle(
                          fontSize: 32,
                          color: Color(0xff212121),
                          fontWeight: FontWeight.w400),
                    ),
                    Container(
                      height: 30,
                      width: 30,
                      alignment: Alignment.center,
                      child: Image.asset("assets/images/Shape.png"),
                    ),
                  ],
                )),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30),
                height: 60,
                width: MediaQuery.of(context).size.width * .9,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xffCE8C8C),
                  ),
                  color: Color(0xffCE8C8C),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Center(
                    child: Text(
                  'share',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                )),
              ),
              SizedBox(
                height: 25,
              ),
              Center(child: Text('or')),
              SizedBox(
                height: 25,
              ),
              Text('Email address'),
              SizedBox(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(
                  // border: Border.all(
                  //   color: Color(0xffD7D4D4),
                  // ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(33),
                ),
                height: 50,
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextFormField(
                  // onFieldSubmitted: _searchlist(),
                  onChanged: (value) {
                    setState(() {
                      // search_string = value;
                    });
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(33.0),
                      ),
                      labelText: '',
                      suffixIcon: IconButton(
                        icon: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset('assets/images/ARROW.png')),
                        onPressed: () {
                          // _searchlist();
                        },
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

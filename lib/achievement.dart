import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:herraf_app/api_servivce.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toggle_switch/toggle_switch.dart';

class AchievementScreen extends StatefulWidget {
  const AchievementScreen({Key? key}) : super(key: key);

  @override
  State<AchievementScreen> createState() => _AchievementScreenState();
}

class _AchievementScreenState extends State<AchievementScreen> {
  List<String> pagelist = ['All', 'Unlocked'];
  bool isLoading = true;

  List<dynamic> dailLoginStreaks = [];
  List<dynamic> addFriendAchivement = [];
  Map packsAchivement = {};
  int? lostCount;
  int? totallostCount;

  Map won = {};
  Map lost = {};

  List<dynamic> facebook = [
    {'name': 'Facebook page subscription', 'exp': '100'},
  ];

  List<dynamic> spellAcronym = [
    {
      'name': 'Spell out acronym 50 times',
      'totalAcronym': '15',
      'needAcronym': '50',
      'exp': '250'
    },
  ];
  List<dynamic> cardDraw = [
    {
      'name': 'Successfully challenge  4 cards draw 20 times',
      'totalcardDraw': '13',
      'needcardDraw': '20',
      'exp': '400'
    },
  ];

  int currentPage = 0;

  @override
  void initState() {
    _dailyLoginStreaks();
    // _addFriendAchivement();
    // _buyPacksAchivement();
    // _gameWonAchivement();
    // _gameLostAchivement();
    super.initState();
  }

  _dailyLoginStreaks() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    ApiService.dailyLoginStreaks(pref.get('user_id')).then((value) {
      print(value);
      setState(() {
        dailLoginStreaks = value['data'];
        if (value['status']) {
          setState(() {
            isLoading = false;
          });
        }
      });
      // setState(() {
      // for (var i = 0; i < value["data"].length; i++) {
      //   print(i);
      //   print(value["data"][i]['user_id']);
      // }
      // });
    });
  }

  _addFriendAchivement() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    ApiService.addFriendAchivement(pref.get('user_id')).then((value) {
      print(value);
      setState(() {
        addFriendAchivement = value['data'];
        isLoading == false;
      });
    });
  }

  _buyPacksAchivement() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    ApiService.buyPacksAchivement(pref.get('user_id')).then((value) {
      packsAchivement = value;
      isLoading == false;
    });
  }

  _gameWonAchivement() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    ApiService.gameWonAchivement(pref.get('user_id')).then((value) {
      setState(() {
        won = value;
        isLoading == false;
      });
    });
  }

  _gameLostAchivement() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    ApiService.gameLostAchivement(pref.get('user_id')).then((value) {
      setState(() {
        lost = value;
        lostCount = value['matchLose'];
        totallostCount = value['loseGoal'];
        isLoading == false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 250, 248, 248),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .3,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset('assets/images/background-top(1).png'),
                Container(
                  margin: EdgeInsets.only(bottom: 150),
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
                        'My Achievements',
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
                  top: 100,
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
                    ],
                    activeFgColor: Color(0xffffffff),
                    inactiveBgColor: Colors.white,
                    inactiveFgColor: Color(0xffCE8C8C),
                    initialLabelIndex: currentPage,
                    totalSwitches: 2,
                    labels: pagelist,
                    onToggle: (index) {
                      setState(() {
                        currentPage = index!;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * .7,
            child: currentPage == 0 ? AllPage() : Unlocked(),
          )
        ],
      ),
    );
  }

  Widget AllPage() {
    return SingleChildScrollView(
      child: isLoading
          ? Center(
              child: CircularProgressIndicator(color: Color(0xffCE8C8C)),
            )
          : Column(
              children: [
                // Container(
                //   margin: EdgeInsets.only(left: 15, right: 15),
                //   height: 90,
                //   child: Card(
                //     child: Padding(
                //       padding: const EdgeInsets.all(12),
                //       child: Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           Text(
                //             '${facebook[0]['name']}',
                //             style: GoogleFonts.poppins(
                //                 fontWeight: FontWeight.w500,
                //                 fontSize: 14,
                //                 color: const Color((0xff212121))),
                //           ),
                //           Row(
                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             children: [
                //               Text('Subscribe',
                //                   style: GoogleFonts.poppins(
                //                       fontWeight: FontWeight.w500,
                //                       fontSize: 14,
                //                       color: const Color((0xffCE8C8C)))),
                //               Text('Exp ${facebook[0]['exp']}',
                //                   style: GoogleFonts.poppins(
                //                       fontWeight: FontWeight.w400,
                //                       fontSize: 12,
                //                       color: const Color((0xff7E7E7E))))
                //             ],
                //           )
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                // Container(
                //   margin: EdgeInsets.only(left: 15, right: 15),
                //   height: 90,
                //   child: Card(
                //     child: Padding(
                //       padding: const EdgeInsets.all(12),
                //       child: Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           Text(
                //             '   ${spellAcronym[0]['name']}',
                //             style: GoogleFonts.poppins(
                //                 fontWeight: FontWeight.w500,
                //                 fontSize: 14,
                //                 color: const Color((0xff212121))),
                //           ),
                //           Row(
                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             children: [
                //               Container(
                //                 child: Column(
                //                   crossAxisAlignment: CrossAxisAlignment.start,
                //                   children: [
                //                     Container(
                //                         margin: EdgeInsets.only(left: 10),
                //                         child: Row(
                //                           children: [
                //                             Text(
                //                                 '${spellAcronym[0]['totalAcronym']}',
                //                                 style: TextStyle(
                //                                     fontWeight: FontWeight.bold,
                //                                     color: Color(0xffCE8C8C))),
                //                             Text(
                //                               "/${spellAcronym[0]['needAcronym']}",
                //                               style: TextStyle(
                //                                   fontWeight: FontWeight.bold),
                //                             )
                //                           ],
                //                         )),
                //                     LinearPercentIndicator(
                //                       width: 270,
                //                       animation: true,
                //                       lineHeight: 6.0,
                //                       // animationDuration: 2500,
                //                       percent: (int.parse(
                //                               spellAcronym[0]['totalAcronym']) /
                //                           int.parse(
                //                               spellAcronym[0]['needAcronym'])),
                //                       barRadius: const Radius.circular(20),
                //                       progressColor: Color(0xffCE8C8C),
                //                     ),
                //                   ],
                //                 ),
                //               ),
                //               Text('Exp ${spellAcronym[0]['exp']}',
                //                   style: GoogleFonts.poppins(
                //                       fontWeight: FontWeight.w400,
                //                       fontSize: 12,
                //                       color: const Color((0xff7E7E7E))))
                //             ],
                //           )
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                // Container(
                //   margin: EdgeInsets.only(left: 15, right: 15),
                //   height: 90,
                //   child: Card(
                //     child: Padding(
                //       padding: const EdgeInsets.all(12),
                //       child: Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           Text(
                //             '${cardDraw[0]['name']}',
                //             style: GoogleFonts.poppins(
                //                 fontWeight: FontWeight.w500,
                //                 fontSize: 14,
                //                 color: const Color((0xff212121))),
                //           ),
                //           Row(
                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             children: [
                //               Container(
                //                 child: Column(
                //                   crossAxisAlignment: CrossAxisAlignment.start,
                //                   children: [
                //                     Container(
                //                         margin: EdgeInsets.only(left: 10),
                //                         child: Row(
                //                           children: [
                //                             Text(
                //                                 '${cardDraw[0]['totalcardDraw']}',
                //                                 style: TextStyle(
                //                                     fontWeight: FontWeight.bold,
                //                                     color: Color(0xffCE8C8C))),
                //                             Text(
                //                               "/${cardDraw[0]['needcardDraw']}",
                //                               style: TextStyle(
                //                                   fontWeight: FontWeight.bold),
                //                             )
                //                           ],
                //                         )),
                //                     LinearPercentIndicator(
                //                       width: 270,
                //                       animation: true,
                //                       lineHeight: 6.0,
                //                       // animationDuration: 2500,
                //                       percent: (int.parse(
                //                               cardDraw[0]['totalcardDraw']) /
                //                           int.parse(
                //                               cardDraw[0]['needcardDraw'])),
                //                       barRadius: const Radius.circular(20),
                //                       progressColor: Color(0xffCE8C8C),
                //                     ),
                //                   ],
                //                 ),
                //               ),
                //               Text('Exp ${cardDraw[0]['exp']}',
                //                   style: GoogleFonts.poppins(
                //                       fontWeight: FontWeight.w400,
                //                       fontSize: 12,
                //                       color: const Color((0xff7E7E7E))))
                //             ],
                //           )
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                for (var i = 0; i < dailLoginStreaks.length; i++) ...[
                  Container(
                    margin: EdgeInsets.only(left: 15, right: 15),
                    height: 90,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '  Your Daily Login Streaks',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: const Color((0xff212121))),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          margin: EdgeInsets.only(left: 10),
                                          child: Row(
                                            children: [
                                              Text(
                                                  '${dailLoginStreaks[i]['current_streak']}',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                          Color(0xffCE8C8C))),
                                              Text(
                                                "/${dailLoginStreaks[i]['streak_goal']}",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          )),
                                      LinearPercentIndicator(
                                        width: 270,
                                        animation: true,
                                        lineHeight: 6.0,
                                        // animationDuration: 2500,
                                        percent: dailLoginStreaks[i]
                                                ['current_streak'] /
                                            dailLoginStreaks[i]['streak_goal'],
                                        barRadius: const Radius.circular(20),
                                        progressColor: Color(0xffCE8C8C),
                                      ),
                                    ],
                                  ),
                                ),
                                Text('Exp ${cardDraw[i]['exp']}',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        color: const Color((0xff7E7E7E))))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
                // Container(
                //   margin: EdgeInsets.only(left: 15, right: 15),
                //   height: 90,
                //   child: Card(
                //     child: Padding(
                //       padding: const EdgeInsets.all(12),
                //       child: Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           Text(
                //             // '${AddfriendList[index]['name']}',
                //             '  Add 10 friends',
                //             style: GoogleFonts.poppins(
                //                 fontWeight: FontWeight.w500,
                //                 fontSize: 14,
                //                 color: const Color((0xff212121))),
                //           ),
                //           Row(
                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             children: [
                //               Container(
                //                 child: Column(
                //                   crossAxisAlignment: CrossAxisAlignment.start,
                //                   children: [
                //                     Container(
                //                         margin: EdgeInsets.only(left: 10),
                //                         child: Row(
                //                           children: [
                //                             Text(
                //                                 '${addFriendAchivement[0]['current_no_of_friends']}',
                //                                 style: TextStyle(
                //                                     fontWeight: FontWeight.bold,
                //                                     color: Color(0xffCE8C8C))),
                //                             Text(
                //                               "/${addFriendAchivement[0]['goal_no_of_friends']}",
                //                               style: TextStyle(
                //                                   fontWeight: FontWeight.bold),
                //                             )
                //                           ],
                //                         )),
                //                     LinearPercentIndicator(
                //                       width: 270,
                //                       animation: true,
                //                       lineHeight: 6.0,
                //                       // animationDuration: 2000,
                //                       //percent: (0.4),

                //                       percent: addFriendAchivement[0]
                //                               ['current_no_of_friends'] /
                //                           addFriendAchivement[0]
                //                               ['goal_no_of_friends'],

                //                       barRadius: const Radius.circular(20),
                //                       progressColor: Color(0xffCE8C8C),
                //                     ),
                //                   ],
                //                 ),
                //               ),
                //               Text('Exp 300',
                //                   style: GoogleFonts.poppins(
                //                       fontWeight: FontWeight.w400,
                //                       fontSize: 12,
                //                       color: const Color((0xff7E7E7E))))
                //             ],
                //           )
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                // Container(
                //   margin: EdgeInsets.only(left: 15, right: 15),
                //   height: 90,
                //   child: Card(
                //     child: Padding(
                //         padding: const EdgeInsets.all(12),
                //         child: Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //           children: [
                //             Text(
                //               '  100 games win',
                //               style: GoogleFonts.poppins(
                //                   fontWeight: FontWeight.w500,
                //                   fontSize: 14,
                //                   color: const Color((0xff212121))),
                //             ),
                //             Row(
                //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //               children: [
                //                 Container(
                //                   child: Column(
                //                     crossAxisAlignment:
                //                         CrossAxisAlignment.start,
                //                     children: [
                //                       Container(
                //                           margin: EdgeInsets.only(left: 10),
                //                           child: Row(
                //                             children: [
                //                               Text('${won['gamesWon']}',
                //                                   style: TextStyle(
                //                                       fontWeight:
                //                                           FontWeight.bold,
                //                                       color:
                //                                           Color(0xffCE8C8C))),
                //                               Text(
                //                                 "/${won['gameWinGoal']}",
                //                                 style: TextStyle(
                //                                     fontWeight:
                //                                         FontWeight.bold),
                //                               )
                //                             ],
                //                           )),
                //                       LinearPercentIndicator(
                //                         width: 270,
                //                         animation: true,
                //                         lineHeight: 6.0,
                //                         percent: won['gamesWon'] /
                //                             won['gameWinGoal'],
                //                         barRadius: const Radius.circular(20),
                //                         progressColor: Color(0xffCE8C8C),
                //                       ),
                //                     ],
                //                   ),
                //                 ),
                //                 Text('Exp 300',
                //                     style: GoogleFonts.poppins(
                //                         fontWeight: FontWeight.w400,
                //                         fontSize: 12,
                //                         color: const Color((0xff7E7E7E))))
                //               ],
                //             )
                //           ],
                //         )),
                //   ),
                // ),
                // Container(
                //   margin: EdgeInsets.only(left: 15, right: 15),
                //   height: 90,
                //   child: Card(
                //     child: Padding(
                //       padding: const EdgeInsets.all(12),
                //       child: Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           Text(
                //             '  5 packs achivement',
                //             style: GoogleFonts.poppins(
                //                 fontWeight: FontWeight.w500,
                //                 fontSize: 14,
                //                 color: const Color((0xff212121))),
                //           ),
                //           Row(
                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             children: [
                //               Container(
                //                 child: Column(
                //                   crossAxisAlignment: CrossAxisAlignment.start,
                //                   children: [
                //                     Container(
                //                         margin: EdgeInsets.only(left: 10),
                //                         child: Row(
                //                           children: [
                //                             Text(
                //                                 '${packsAchivement['packsBought']}',
                //                                 style: TextStyle(
                //                                     fontWeight: FontWeight.bold,
                //                                     color: Color(0xffCE8C8C))),
                //                             Text(
                //                               "/${packsAchivement['totalPacks']}",
                //                               style: TextStyle(
                //                                   fontWeight: FontWeight.bold),
                //                             )
                //                           ],
                //                         )),
                //                     LinearPercentIndicator(
                //                       width: 270,
                //                       animation: true,
                //                       lineHeight: 6.0,
                //                       percent: 2 / 5,
                //                       barRadius: const Radius.circular(20),
                //                       progressColor: Color(0xffCE8C8C),
                //                     ),
                //                   ],
                //                 ),
                //               ),
                //               Text('Exp 300',
                //                   style: GoogleFonts.poppins(
                //                       fontWeight: FontWeight.w400,
                //                       fontSize: 12,
                //                       color: const Color((0xff7E7E7E))))
                //             ],
                //           )
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                // Container(
                //   margin: EdgeInsets.only(left: 15, right: 15),
                //   height: 90,
                //   child: Card(
                //     child: Padding(
                //         padding: const EdgeInsets.all(12),
                //         child: Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //           children: [
                //             Text(
                //               '  50 games loose',
                //               style: GoogleFonts.poppins(
                //                   fontWeight: FontWeight.w500,
                //                   fontSize: 14,
                //                   color: const Color((0xff212121))),
                //             ),
                //             Row(
                //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //               children: [
                //                 Container(
                //                   child: Column(
                //                     crossAxisAlignment:
                //                         CrossAxisAlignment.start,
                //                     children: [
                //                       Container(
                //                           margin: EdgeInsets.only(left: 10),
                //                           child: Row(
                //                             children: [
                //                               Text('$lostCount',
                //                                   style: TextStyle(
                //                                       fontWeight:
                //                                           FontWeight.bold,
                //                                       color:
                //                                           Color(0xffCE8C8C))),
                //                               Text(
                //                                 "/$totallostCount",
                //                                 style: TextStyle(
                //                                     fontWeight:
                //                                         FontWeight.bold),
                //                               )
                //                             ],
                //                           )),
                //                       LinearPercentIndicator(
                //                         width: 270,
                //                         animation: true,
                //                         lineHeight: 6.0,
                //                         percent: lostCount! / totallostCount!,
                //                         barRadius: const Radius.circular(20),
                //                         progressColor: Color(0xffCE8C8C),
                //                       ),
                //                     ],
                //                   ),
                //                 ),
                //                 Text('Exp 300',
                //                     style: GoogleFonts.poppins(
                //                         fontWeight: FontWeight.w400,
                //                         fontSize: 12,
                //                         color: const Color((0xff7E7E7E))))
                //               ],
                //             )
                //           ],
                //         )),
                //   ),
                // ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
    );
  }

  Widget Unlocked() {
    return SingleChildScrollView(
        child: Column(
      children: [
        SizedBox(height: 200),
        Center(
          child: Text(
            'Unlocked Achivements',
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: const Color((0xff212121))),
          ),
        ),
      ],
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:herraf_app/dailystreak3.dart';

class DailyStreakTwo extends StatefulWidget {
  const DailyStreakTwo({Key? key}) : super(key: key);

  @override
  State<DailyStreakTwo> createState() => _DailyStreakTwoState();
}

class _DailyStreakTwoState extends State<DailyStreakTwo> {
  int age = 5;
  int score = 10;
  double ratio = 1 / 8;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
              child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Color(0xff0093ED),
                          size: 18,
                        )),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Daily streak",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: const Color(0xff0093ED)),
                        )),
                  ],
                ),
                TextButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (ctx) => SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.238,
                                width:
                                    MediaQuery.of(context).size.width * 0.893,
                                child: AlertDialog(
                                    content: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.893,
                                  height: MediaQuery.of(context).size.height *
                                      0.238,
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            InkWell(
                                                child: Container(
                                                    decoration: const BoxDecoration(
                                                        color:
                                                            Color(0xff000000),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    30))),
                                                    child: SizedBox(
                                                        height: 24,
                                                        child: Image.asset(
                                                            "assets/images/flames 1.png"))),
                                                onTap: () {
                                                  Navigator.pop(context);
                                                }),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text("Save changes?",
                                                style: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w600,
                                                    color:
                                                        const Color(0xff000000),
                                                    fontSize: 24))
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "One or more of your daily goal\nparameters were updated",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 14,
                                                  color:
                                                      const Color(0xff4F4F4F),
                                                  fontWeight: FontWeight.w400),
                                              textAlign: TextAlign.center,
                                            )
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text(
                                                  "Cancel",
                                                  style: GoogleFonts.poppins(
                                                      color: const Color(
                                                          0xff0093ED),
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 16),
                                                )),
                                            SizedBox(
                                              height: 48,
                                              width: 120,
                                              child: ElevatedButton(
                                                  onPressed: () {},
                                                  child: Text(
                                                    "Save",
                                                    style: GoogleFonts.poppins(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: const Color(
                                                            0xffFFFFFF),
                                                        fontSize: 16),
                                                  )),
                                            )
                                          ],
                                        ),
                                      ]),
                                )),
                              ));
                    },
                    child: Text(
                      "Save",
                      style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff0093ED)),
                    )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: SizedBox(
                height: 96,
                child: Text(
                  "Current daily\nstreak",
                  style: GoogleFonts.poppins(
                      color: const Color(0xff00253A),
                      fontSize: 32,
                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: 70,
                      height: 70,
                      child: Image.asset("assets/images/flames 1.png")),
                  Text(
                    "25",
                    style: GoogleFonts.poppins(
                        fontSize: 24,
                        color: const Color(0xff00253A),
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.453,
                    height: MediaQuery.of(context).size.height * 0.078,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: Color(0xffF1F6FF),
                    ),
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Calendar()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                                height: 25,
                                child:
                                    Image.asset("assets/images/calendar.png")),
                            Text(
                              "Calender",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xff0F0F0F),
                                  fontSize: 14),
                            )
                          ],
                        )),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.402,
                    height: MediaQuery.of(context).size.height * 0.078,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: Color(0xffF1F6FF),
                    ),
                    child: TextButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (ctx) => SizedBox(
                                  height: 315,
                                  width: 315,
                                  child: AlertDialog(
                                      content: SizedBox(
                                          width: 380,
                                          height: 315,
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    InkWell(
                                                        child: Container(
                                                            decoration: const BoxDecoration(
                                                                color: Color(
                                                                    0xff000000),
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            30))),
                                                            child: SizedBox(
                                                                height: 24,
                                                                child: Image.asset(
                                                                    "assets/images/Auto Layout Horizontal(7).png"))),
                                                        onTap: () {
                                                          Navigator.pop(
                                                              context);
                                                        }),
                                                  ],
                                                ),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 0,
                                                          left: 30,
                                                          right: 30),
                                                  child: Image.asset(
                                                    'assets/images/Rectangle(3).png',
                                                    height: 85,
                                                    width: 85,
                                                    // width: MediaQuery.of(context).size.width * 0.94,
                                                    // height: MediaQuery.of(context).size.height * 0.14,
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text("7 day streak",
                                                        style: GoogleFonts.poppins(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: const Color(
                                                                0xff000000),
                                                            fontSize: 24))
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "Congrats on achiving this milestone.\n Keep it up!",
                                                      style: GoogleFonts.poppins(
                                                          fontSize: 14,
                                                          color: const Color(
                                                              0xff4F4F4F),
                                                          fontWeight:
                                                              FontWeight.w400),
                                                      textAlign:
                                                          TextAlign.center,
                                                    )
                                                  ],
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    left: 50,
                                                  ),
                                                ),
                                                Row(
                                                  // mainAxisAlignment:
                                                  //     MainAxisAlignment
                                                  //         .spaceBetween,
                                                  children: [
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                        left: 20,
                                                      ),
                                                      child: TextButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Text(
                                                            "Close",
                                                            style: GoogleFonts.poppins(
                                                                color: const Color(
                                                                    0xff0093ED),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 16),
                                                            textAlign: TextAlign
                                                                .center,
                                                          )),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 30, right: 20),
                                                    ),
                                                    Container(
                                                      height: 50,
                                                      width: 120,
                                                      color: const Color(
                                                          0xff0093ED),
                                                      padding: EdgeInsets.only(
                                                        left: 20,
                                                      ),
                                                      child: Row(
                                                        // mainAxisAlignment:
                                                        //     MainAxisAlignment
                                                        //         .spaceEvenly,
                                                        children: [
                                                          SizedBox(
                                                              height: 20,
                                                              child: Image.asset(
                                                                  "assets/images/share-2(1).png")),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                              left: 10,
                                                            ),
                                                          ),
                                                          Text(
                                                            "Share",
                                                            style: GoogleFonts.poppins(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: const Color(
                                                                    0xfffffffff),
                                                                fontSize: 16),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ])))));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                                height: 60,
                                child:
                                    Image.asset("assets/images/share-2.png")),
                            Text(
                              "Share",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xff0F0F0F),
                                  fontSize: 14),
                            )
                          ],
                        )),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.885,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Daily challenge",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w700,
                          color: const Color(0xff0F0F0F),
                          fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.885,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Games to play",
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: const Color(0xff000000),
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Slider(
                      activeColor: const Color(0xffF1F6FF),
                      inactiveColor: const Color(0xffF1F6FF),
                      thumbColor: const Color(0xff0093ED),
                      autofocus: true,
                      value: score.toDouble(),
                      onChanged: (value) {
                        setState(() {
                          score = value.toInt();
                        });
                      },
                      divisions: 2,
                      min: 10,
                      max: 20,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.885,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("5"),
                          Text("10"),
                          Text("20"),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.885,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Average spelling acuracy\nfor an acronym",
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: const Color(0xff000000),
                            fontWeight: FontWeight.w600),
                      ),
                      const FaIcon(FontAwesomeIcons.circleQuestion)
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Slider(
                  activeColor: const Color(0xffF1F6FF),
                  inactiveColor: const Color(0xffF1F6FF),
                  thumbColor: const Color(0xff0093ED),
                  value: age.toDouble(),
                  onChanged: (value) {
                    setState(() {
                      age = value.toInt();
                    });
                  },
                  divisions: 2,
                  min: 5,
                  max: 20,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.885,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("50%"),
                      Text("75%"),
                      Text("90%"),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.885,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Spell acronym/accept penalty ratio",
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: const Color(0xff000000),
                        fontWeight: FontWeight.w600),
                  ),
                  const FaIcon(FontAwesomeIcons.circleQuestion)
                ],
              ),
            ),
            Column(
              children: [
                Slider(
                  activeColor: const Color(0xffF1F6FF),
                  inactiveColor: const Color(0xffF1F6FF),
                  thumbColor: const Color(0xff0093ED),
                  autofocus: true,
                  value: ratio.toDouble(),
                  onChanged: (value) {
                    setState(() {
                      ratio = value.toDouble();
                    });
                  },
                  divisions: 2,
                  min: 1 / 8,
                  max: 1 / 2,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.885,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("1:8"),
                      Text("1:4"),
                      Text("1:2"),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            )
          ],
        ),
      ))),
    );
  }
}

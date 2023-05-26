import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:polygon_clipper/polygon_clipper.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAFAFA),
      body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  TextButton(
                      onPressed: () {
                        // showDialog(
                        //     context: context,
                        //     builder: (ctx) => AlertDialog(
                        //             content: Container(
                        //           height: 200,
                        //           width: 314,
                        //           child: Column(
                        //               mainAxisAlignment:
                        //                   MainAxisAlignment.spaceBetween,
                        //               children: [
                        //                 Row(
                        //                   mainAxisAlignment:
                        //                       MainAxisAlignment.end,
                        //                   children: [
                        //                     InkWell(
                        //                       child: SizedBox(
                        //                           height: 24,
                        //                           child: Image.asset(
                        //                             "assets/images/Auto Layout Horizontal(3).png",
                        //                           )),
                        //                       onTap: () {
                        //                         Navigator.pop(context);
                        //                       },
                        //                     ),
                        //                   ],
                        //                 ),
                        //                 Row(
                        //                   mainAxisAlignment:
                        //                       MainAxisAlignment.center,
                        //                   children: [
                        //                     SizedBox(
                        //                         child: Text(
                        //                       "Are you sure?",
                        //                       style: GoogleFonts.poppins(
                        //                           color: const Color(
                        //                               0xff00253A),
                        //                           fontWeight:
                        //                               FontWeight.w700,
                        //                           fontSize: 28),
                        //                       textAlign: TextAlign.center,
                        //                     ))
                        //                   ],
                        //                 ),
                        //                 Text(
                        //                     "This will count as a loss and\nyou will lose your entry.",
                        //                     style: GoogleFonts.poppins(
                        //                         fontWeight:
                        //                             FontWeight.w500,
                        //                         color: const Color(
                        //                             0xff686565),
                        //                         fontSize: 14)),
                        //                 SizedBox(height: 20),
                        //                 Padding(
                        //                   padding:
                        //                       const EdgeInsets.symmetric(
                        //                           horizontal: 15),
                        //                   child: Row(
                        //                     mainAxisAlignment:
                        //                         MainAxisAlignment
                        //                             .spaceBetween,
                        //                     children: [
                        //                       Container(
                        //                         width: 124,
                        //                         height: 48,
                        //                         decoration: BoxDecoration(
                        //                             border: Border.all(
                        //                                 color: const Color(
                        //                                     0xff0093ED),
                        //                                 width: 3),
                        //                             borderRadius:
                        //                                 const BorderRadius
                        //                                         .all(
                        //                                     Radius
                        //                                         .circular(
                        //                                             8))),
                        //                         child: TextButton(
                        //                             onPressed: () {
                        //                               Navigator.pop(
                        //                                   context);
                        //                             },
                        //                             child: Text(
                        //                               "Cancel",
                        //                               style: GoogleFonts.poppins(
                        //                                   fontWeight:
                        //                                       FontWeight
                        //                                           .w600,
                        //                                   fontSize: 16,
                        //                                   color: const Color(
                        //                                       0xff0093ED)),
                        //                             )),
                        //                       ),
                        //                       SizedBox(
                        //                         width: 125,
                        //                         height: 48,
                        //                         child: ElevatedButton(
                        //                             onPressed: () {},
                        //                             child: Text(
                        //                               "Exit game",
                        //                               style: GoogleFonts.poppins(
                        //                                   fontWeight:
                        //                                       FontWeight
                        //                                           .w600,
                        //                                   fontSize: 16,
                        //                                   color: const Color(
                        //                                       0xffFFFFFF)),
                        //                             )),
                        //                       ),
                        //                     ],
                        //                   ),
                        //                 )
                        //               ]),
                        //         )));
                      },
                      child: Row(
                        children: [
                          const Icon(Icons.arrow_back_ios),
                          Text(
                            "Leave Game",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: const Color(0xff0093ED)),
                          )
                        ],
                      )),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.12,
                    width: MediaQuery.of(context).size.width * 0.103,
                    color: const Color(0xff333333),
                    alignment: Alignment.center,
                    child: TextButton(
                      child: Text(
                        "Deck",
                        style: GoogleFonts.poppins(
                            color: const Color(0xffFFFFFF),
                            fontSize: MediaQuery.of(context).size.width * 0.022,
                            fontWeight: FontWeight.w700),
                      ),
                      onPressed: () {
                        // Navigator.push(
                        //     context,
                        //     PageTransition(
                        //         type: PageTransitionType.rightToLeft,
                        //         child: Gamescreentwo()));
                        // Gamescreentwo
                      },
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 100),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: Stack(
                            alignment: Alignment.topRight,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 10, bottom: 15),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.21,
                                      width: 80,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: const Color(0xff0093ED),
                                              width: 3),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(8)),
                                          color: const Color(0xffB6E1F4),
                                        ),
                                        child: Icon(
                                          Icons.account_circle_rounded,
                                          color: const Color(0xff0093ED),
                                          size: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.14,
                                        ),
                                      )),
                                ),
                              ),
                              Container(
                                  height:
                                      MediaQuery.of(context).size.width * 0.027,
                                  width: MediaQuery.of(context).size.height *
                                      0.082,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 3,
                                          color: const Color(0xff0093ED)),
                                      color: const Color(0xffB6E1F3))),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20, bottom: 7),
                          child: Transform.rotate(
                            angle: (-12.8),
                            child: Container(
                              height: 30,
                              width: 19,
                              decoration: BoxDecoration(
                                  color: const Color(0xffB6E1F3),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(4)),
                                  border: Border.all(
                                      width: 1,
                                      color: const Color(0xff0093ED))),
                              alignment: Alignment.center,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 16, bottom: 7),
                          child: Transform.rotate(
                            angle: (-12.7),
                            child: Container(
                              height: 30,
                              width: 19,
                              decoration: BoxDecoration(
                                  color: const Color(0xffB6E1F3),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(4)),
                                  border: Border.all(
                                      width: 1,
                                      color: const Color(0xff0093ED))),
                              alignment: Alignment.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: SizedBox(
                        height: 35,
                        width: 35,
                        child: ClipPolygon(
                          sides: 6,
                          borderRadius: 5.0,
                          // Defaults to 0.0 degrees
                          rotate: 60.0,
                          // Defaults to 0.0 degrees
                          boxShadows: [
                            PolygonBoxShadow(
                                color: Colors.black, elevation: 1.0),
                            PolygonBoxShadow(
                              color: Colors.black,
                              elevation: 1,
                            )
                          ],
                          child: Container(
                              color: const Color(0xff1F1C1C),
                              alignment: Alignment.center,
                              child: Text("12",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xffFFFFFF),
                                      fontSize: 12),
                                  textAlign: TextAlign.center)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.watch_later_outlined,
                          size: 25,
                        ),
                        TweenAnimationBuilder<Duration>(
                            duration: const Duration(minutes: 3),
                            tween: Tween(
                                begin: const Duration(minutes: 3),
                                end: Duration.zero),
                            onEnd: () {
                              print('Timer ended');
                            },
                            builder: (BuildContext context, Duration value,
                                Widget? child) {
                              final minutes = value.inMinutes;
                              final seconds = value.inSeconds % 60;
                              return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: Text('$minutes:$seconds',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          color: Color(0xff00253A),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18)));
                            }),
                      ],
                    ),
                  ),
                  Container(
                      height: 53,
                      width: 53,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          color: Color(0xffF1F6FF),
                          borderRadius: BorderRadius.all(Radius.circular(16))),
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.040,
                          // height:
                          //     MediaQuery.of(context).size.height * 0.029,
                          child: Image.asset(
                              "assets/images/Auto Layout Horizontal(8).png")))
                ],
              )
            ],
          ),
        ],
      ))),
    );
  }
}

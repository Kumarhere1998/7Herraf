import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:herraf_app/hom6.dart';
import 'package:herraf_app/invite.dart';
import 'package:page_transition/page_transition.dart';

class HomepageOne extends StatefulWidget {
  const HomepageOne({Key? key}) : super(key: key);

  @override
  State<HomepageOne> createState() => _HomepageOneState();
}

class _HomepageOneState extends State<HomepageOne> {
  late bool state;
  List<Widget> items = [
    SliderWidget(),
    SliderTwo(),
    SlideThree(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.060,
              width: MediaQuery.of(context).size.width * 0.65,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Image(
                      image: AssetImage(
                        "assets/images/Polygon.png",
                      ),
                      height: 32),
                  Text("Bronze",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 20.72,
                          color: const Color(0xff00253A))),
                  InkWell(
                    child: Row(
                      children: [
                        const Image(
                            image: AssetImage(
                              "assets/images/flames 1.png",
                            ),
                            height: 48),
                        Text("25",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: const Color(0xff00253A)))
                      ],
                    ),
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 20),
                              child: SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.334,
                                child: SizedBox(
                                  height:
                                      MediaQuery.of(context).size.width * 0.837,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    // mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          InkWell(
                                            child: Container(
                                              height: 20,
                                              width: 20,
                                              alignment: Alignment.center,
                                              decoration: const BoxDecoration(
                                                color: Color(0xff7DD8F7),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20)),
                                              ),
                                              child: const Center(
                                                  child: Icon(
                                                Icons.cancel_outlined,
                                                color: Color(0xff0093ED),
                                              )),
                                            ),
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ],
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.224,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.103,
                                        color: const Color(0xff7DD8FF),
                                        alignment: Alignment.topCenter,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, bottom: 10),
                                        child: Text("Set your daily goal!",
                                            style: GoogleFonts.poppins(
                                                color: const Color(0xff000000),
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16)),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: Text(
                                            "Track your progress and make sure your\nlearing is consostent",
                                            style: GoogleFonts.poppins(
                                                color: const Color(0xff828282),
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14),
                                            textAlign: TextAlign.center),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            TextButton(
                                                onPressed: () {},
                                                child: Text(
                                                  "Close",
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: const Color(
                                                          0xff0093ED)),
                                                )),
                                            SizedBox(
                                              height: 48,
                                              width: 141,
                                              child: ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text(
                                                    "Set up",
                                                    style: GoogleFonts.poppins(
                                                        color: const Color(
                                                            0xffFFFFFF),
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 16),
                                                  )),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    },
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.060,
                  width: MediaQuery.of(context).size.width * 0.397,
                  decoration: const BoxDecoration(
                      color: Color(0xffF1F6FF),
                      borderRadius: BorderRadius.all(Radius.circular(16))),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const FaIcon(FontAwesomeIcons.circleQuestion,
                            color: Color(0xff0093ED)),
                        InkWell(
                          onTap: () {},
                          child: Text("Help",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: const Color(0xff0093ED))),
                        ),
                      ]),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.060,
                  width: MediaQuery.of(context).size.width * 0.408,
                  decoration: const BoxDecoration(
                      color: Color(0xffF1F6FF),
                      borderRadius: BorderRadius.all(Radius.circular(16))),
                  child: InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const FaIcon(FontAwesomeIcons.music,
                            color: Color(0xff0093ED)),
                        Text("Sound",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: const Color(0xff0093ED))),
                      ],
                    ),
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.258,
                              width: MediaQuery.of(context).size.height * 0.736,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 20),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  // mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        InkWell(
                                          child: Container(
                                            height: 20,
                                            width: 20,
                                            alignment: Alignment.center,
                                            decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(12)),
                                                color: Color(0xff7DD8FF)),
                                            child: const Center(
                                                child: Icon(
                                              Icons.cancel_outlined,
                                              color: Color(0xff0093ED),
                                            )),
                                          ),
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.030,
                                      width: MediaQuery.of(context).size.width *
                                          0.70,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Sound effects",
                                              style: GoogleFonts.poppins(
                                                  color:
                                                      const Color(0xFF000000),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600)),
                                          CupertinoSwitch(
                                            value: true,
                                            onChanged: (value) {
                                              state = value;
                                              setState(
                                                () {},
                                              );
                                            },
                                            thumbColor: const Color(0xffD6F5FF),
                                            activeColor:
                                                const Color(0xff7DD8FF),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.030,
                                      width: MediaQuery.of(context).size.width *
                                          0.70,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Music",
                                              style: GoogleFonts.poppins(
                                                  color:
                                                      const Color(0xFF000000),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600)),
                                          CupertinoSwitch(
                                            value: true,
                                            onChanged: (value) {
                                              state = value;
                                              setState(
                                                () {},
                                              );
                                            },
                                            thumbColor: const Color(0xffD6F5FF),
                                            activeColor:
                                                const Color(0xff7DD8FF),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.70,
                                      child: const Divider(
                                        height: 2,
                                        color: Color(0xffE0E0E0),
                                        thickness: 2,
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.030,
                                      width: MediaQuery.of(context).size.width *
                                          0.70,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Push notification",
                                              style: GoogleFonts.poppins(
                                                  color:
                                                      const Color(0xFF000000),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600)),
                                          CupertinoSwitch(
                                            value: true,
                                            onChanged: (value) {
                                              state = value;
                                              setState(
                                                () {
                                                  showDialog(
                                                      context: context,
                                                      builder:
                                                          (ctx) => SizedBox(
                                                                height: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height *
                                                                    0.209,
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.893,
                                                                child:
                                                                    AlertDialog(
                                                                  content:
                                                                      Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            20),
                                                                    child: Text(
                                                                        "Do you allow this app to send you notifications?",
                                                                        style: GoogleFonts.poppins(
                                                                            color:
                                                                                const Color(0xff000000),
                                                                            fontWeight: FontWeight.w600,
                                                                            fontSize: 16)),
                                                                  ),
                                                                  actions: <
                                                                      Widget>[
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                              .only(
                                                                          bottom:
                                                                              15,
                                                                          left:
                                                                              20,
                                                                          right:
                                                                              15),
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          TextButton(
                                                                              onPressed: () {
                                                                                Navigator.of(ctx).pop();
                                                                              },
                                                                              child: Text("Decline", style: GoogleFonts.poppins(color: const Color(0xff0093ED), fontWeight: FontWeight.w600, fontSize: 16))),
                                                                          SizedBox(
                                                                            width:
                                                                                MediaQuery.of(context).size.width * 0.384,
                                                                            height:
                                                                                MediaQuery.of(context).size.height * 0.059,
                                                                            child:
                                                                                ElevatedButton(
                                                                              onPressed: () {},
                                                                              child: Text("Allow", style: GoogleFonts.poppins(color: const Color(0xffFFFFFF), fontSize: 16, fontWeight: FontWeight.w600)),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                              ));
                                                },
                                              );
                                            },
                                            thumbColor: const Color(0xff0093ED),
                                            activeColor:
                                                const Color(0xff7DD8FF),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                  ),
                )
              ],
            ),
            InkWell(
                onTap: () {
                  // Navigator.pushReplacement(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => Playingcreen()),
                  // );
                },
                child: Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * 0.073,
                  width: MediaQuery.of(context).size.width * 0.869,
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: const Color(0xffF1F6FF), width: 3)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                            height: 25,
                            child: Image.asset("assets/images/Shape.png")),
                        Text("[Pack name]",
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff333333),
                            ))
                      ],
                    ),
                  ),
                )),

            CarouselSlider(
              items: items,
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * 0.396,
                aspectRatio: 16 / 9,
                viewportFraction: 0.7,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: false,
                autoPlayInterval: const Duration(seconds: 4),
                autoPlayAnimationDuration: const Duration(milliseconds: 1000),
                autoPlayCurve: Curves.fastOutSlowIn,
                // enlargeCenterPage: true,
                // onPageChanged: callbackFunction,
                scrollDirection: Axis.horizontal,
              ),
            ),
// ,
//           SizedBox(
//           height: MediaQuery.of(context).size.height * 0.396,
//       width: MediaQuery
//           .of(context)
//           .size
//           .width * 0.65,
//       child: PageView.builder(itemBuilder: (context, index) {
//         return Container(
//           height: MediaQuery
//               .of(context)
//               .size
//               .height * 0.396,
//           width: MediaQuery
//               .of(context)
//               .size
//               .width * 0.65,
//           decoration: BoxDecoration(
//               color: const Color(0xffF1F6FF),
//               border: Border.all(
//                   width: 2.68, color: const Color(0xffB6E1F4)),
//               borderRadius:
//               const BorderRadius.all(Radius.circular(21.46))),
//           child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Text(
//                   "Classic",
//                   style: GoogleFonts.poppins(
//                       color: const Color(0xff0093ED),
//                       fontSize: 32.2,
//                       fontWeight: FontWeight.w600),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     const Icon(
//                       Icons.circle,
//                       size: 20,
//                       color: Color(0xff0093ED),
//                     ),
//                     Text("Play randomly or with\na teammate",
//                         style: GoogleFonts.poppins(
//                             fontWeight: FontWeight.w500, fontSize: 14))
//                   ],
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     const Icon(
//                       Icons.circle,
//                       size: 20,
//                       color: Color(0xff0093ED),
//                     ),
//                     Text(
//                       "Limited playing time\n(3 minutes)",
//                       style: GoogleFonts.poppins(
//                           fontWeight: FontWeight.w500, fontSize: 14),
//                     )
//                   ],
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     const Icon(
//                       Icons.circle,
//                       size: 20,
//                       color: Color(0xff0093ED),
//                     ),
//                     Text(
//                       "Receive game\nexperience and\nincrease your league",
//                       style: GoogleFonts.poppins(
//                         fontWeight: FontWeight.w500,
//                         fontSize: 14,
//                       ),
//                     )
//                   ],
//                 ),
//               ]),
//         );
//       }),
//     ),

            // Container(
            //   height: MediaQuery.of(context).size.height * 0.396,
            //   width: MediaQuery.of(context).size.width * 0.65,
            //   decoration: BoxDecoration(
            //       color: const Color(0xffF1F6FF),
            //       border:
            //           Border.all(width: 2.68, color: const Color(0xffB6E1F4)),
            //       borderRadius: const BorderRadius.all(Radius.circular(21.46))),
            //   child: Column(
            //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //       children: [
            //         Text(
            //           "Classic",
            //           style: GoogleFonts.poppins(
            //               color: const Color(0xff0093ED),
            //               fontSize: 32.2,
            //               fontWeight: FontWeight.w600),
            //         ),
            //         Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //           children: [
            //             const Icon(
            //               Icons.circle,
            //               size: 20,
            //               color: Color(0xff0093ED),
            //             ),
            //             Text("Play randomly or with\na teammate",
            //                 style: GoogleFonts.poppins(
            //                     fontWeight: FontWeight.w500, fontSize: 14))
            //           ],
            //         ),
            //         Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //           children: [
            //             const Icon(
            //               Icons.circle,
            //               size: 20,
            //               color: Color(0xff0093ED),
            //             ),
            //             Text(
            //               "Limited playing time\n(3 minutes)",
            //               style: GoogleFonts.poppins(
            //                   fontWeight: FontWeight.w500, fontSize: 14),
            //             )
            //           ],
            //         ),
            //         Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //           children: [
            //             const Icon(
            //               Icons.circle,
            //               size: 20,
            //               color: Color(0xff0093ED),
            //             ),
            //             Text(
            //               "Receive game\nexperience and\nincrease your league",
            //               style: GoogleFonts.poppins(
            //                 fontWeight: FontWeight.w500,
            //                 fontSize: 14,
            //               ),
            //             )
            //           ],
            //         ),
            //       ]),
            // ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.071,
              width: MediaQuery.of(context).size.width * 0.38,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.topToBottom,
                            child: InvitefriendPage()));
                    //InvitefriendPage
                  },
                  child: Text(
                    "Play",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600, fontSize: 16),
                  )),
            )
          ],
        )),
      ),
    );
  }
}

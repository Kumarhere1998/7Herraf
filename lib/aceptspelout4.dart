// import 'package:flutter/material.dart';
// import 'package:flutter_polygon/flutter_polygon.dart';
// import 'package:google_fonts/google_fonts.dart';

// import 'package:herraf_app/aceptspelout5.dart';
// import 'package:page_transition/page_transition.dart';

// class Accept_SpellOutFour extends StatefulWidget {
//   const Accept_SpellOutFour({Key? key}) : super(key: key);

//   @override
//   State<Accept_SpellOutFour> createState() => _Accept_SpellOutFourState();
// }

// class _Accept_SpellOutFourState extends State<Accept_SpellOutFour> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         alignment: Alignment.center,
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 25),
//             child: SafeArea(
//               child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Row(
//                           children: [
//                             TextButton(
//                                 onPressed: () {
//                                   Navigator.pop(context);
//                                 },
//                                 child: Row(
//                                   children: [
//                                     const Icon(Icons.arrow_back_ios),
//                                     Text(
//                                       "Leave Game",
//                                       style: GoogleFonts.poppins(
//                                           fontWeight: FontWeight.w600,
//                                           fontSize: 18,
//                                           color: const Color(0xff0093ED)),
//                                     )
//                                   ],
//                                 )),
//                             Container(
//                               height: MediaQuery.of(context).size.height * 0.12,
//                               width: MediaQuery.of(context).size.width * 0.103,
//                               color: const Color(0xff333333),
//                               alignment: Alignment.center,
//                               child: TextButton(
//                                 child: Text(
//                                   "Deck",
//                                   style: GoogleFonts.poppins(
//                                       color: const Color(0xffFFFFFF),
//                                       fontSize:
//                                           MediaQuery.of(context).size.width *
//                                               0.022,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                                 onPressed: () {
//                                   Navigator.push(
//                                       context,
//                                       PageTransition(
//                                           type: PageTransitionType.rightToLeft,
//                                           child: const Accept_SpellOutFive()));
//                                   //const Accept_SpellOutFive()));
//                                 },
//                               ),
//                             ),
//                           ],
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(right: 100),
//                           child: Stack(
//                             alignment: Alignment.bottomCenter,
//                             children: [
//                               Stack(
//                                 alignment: Alignment.bottomRight,
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.only(right: 12),
//                                     child: Stack(
//                                       alignment: Alignment.topRight,
//                                       children: [
//                                         Padding(
//                                           padding: const EdgeInsets.only(
//                                               right: 10, bottom: 15),
//                                           child: Padding(
//                                             padding:
//                                                 const EdgeInsets.only(top: 10),
//                                             child: SizedBox(
//                                                 height: MediaQuery.of(context)
//                                                         .size
//                                                         .height *
//                                                     0.21,
//                                                 width: 80,
//                                                 child: Container(
//                                                   decoration: BoxDecoration(
//                                                     border: Border.all(
//                                                         color: const Color(
//                                                             0xff0093ED),
//                                                         width: 3),
//                                                     borderRadius:
//                                                         const BorderRadius.all(
//                                                             Radius.circular(8)),
//                                                     color:
//                                                         const Color(0xffB6E1F4),
//                                                   ),
//                                                   child: Icon(
//                                                     Icons
//                                                         .account_circle_rounded,
//                                                     color:
//                                                         const Color(0xff0093ED),
//                                                     size: MediaQuery.of(context)
//                                                             .size
//                                                             .height *
//                                                         0.14,
//                                                   ),
//                                                 )),
//                                           ),
//                                         ),
//                                         Container(
//                                             height: MediaQuery.of(context)
//                                                     .size
//                                                     .width *
//                                                 0.027,
//                                             width: MediaQuery.of(context)
//                                                     .size
//                                                     .height *
//                                                 0.082,
//                                             decoration: BoxDecoration(
//                                                 border: Border.all(
//                                                     width: 3,
//                                                     color: const Color(
//                                                         0xff0093ED)),
//                                                 color:
//                                                     const Color(0xffB6E1F3))),
//                                       ],
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.only(
//                                         right: 20, bottom: 7),
//                                     child: Transform.rotate(
//                                       angle: (-12.8),
//                                       child: Container(
//                                         height: 30,
//                                         width: 19,
//                                         decoration: BoxDecoration(
//                                             color: const Color(0xffB6E1F3),
//                                             borderRadius:
//                                                 const BorderRadius.all(
//                                                     Radius.circular(4)),
//                                             border: Border.all(
//                                                 width: 1,
//                                                 color:
//                                                     const Color(0xff0093ED))),
//                                         alignment: Alignment.center,
//                                       ),
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.only(
//                                         right: 16, bottom: 7),
//                                     child: Transform.rotate(
//                                       angle: (-12.7),
//                                       child: Container(
//                                         height: 30,
//                                         width: 19,
//                                         decoration: BoxDecoration(
//                                             color: const Color(0xffB6E1F3),
//                                             borderRadius:
//                                                 const BorderRadius.all(
//                                                     Radius.circular(4)),
//                                             border: Border.all(
//                                                 width: 1,
//                                                 color:
//                                                     const Color(0xff0093ED))),
//                                         alignment: Alignment.center,
//                                       ),
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.only(
//                                         right: 12, bottom: 7),
//                                     child: Transform.rotate(
//                                       angle: (-12.6),
//                                       child: Container(
//                                         height: 30,
//                                         width: 19,
//                                         decoration: BoxDecoration(
//                                             color: const Color(0xffB6E1F3),
//                                             borderRadius:
//                                                 const BorderRadius.all(
//                                                     Radius.circular(4)),
//                                             border: Border.all(
//                                                 width: 1,
//                                                 color:
//                                                     const Color(0xff0093ED))),
//                                         alignment: Alignment.center,
//                                       ),
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.only(
//                                         right: 8, bottom: 7),
//                                     child: Transform.rotate(
//                                       angle: (-12.5),
//                                       child: Container(
//                                         height: 30,
//                                         width: 19,
//                                         decoration: BoxDecoration(
//                                             color: const Color(0xffB6E1F3),
//                                             borderRadius:
//                                                 const BorderRadius.all(
//                                                     Radius.circular(4)),
//                                             border: Border.all(
//                                                 width: 1,
//                                                 color:
//                                                     const Color(0xff0093ED))),
//                                         alignment: Alignment.center,
//                                         transformAlignment: Alignment.topRight,
//                                       ),
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.only(
//                                         right: 4, bottom: 7),
//                                     child: Transform.rotate(
//                                       angle: (-12.4),
//                                       child: Container(
//                                         height: 30,
//                                         width: 19,
//                                         decoration: BoxDecoration(
//                                             color: const Color(0xffB6E1F3),
//                                             borderRadius:
//                                                 const BorderRadius.all(
//                                                     Radius.circular(4)),
//                                             border: Border.all(
//                                                 width: 1,
//                                                 color:
//                                                     const Color(0xff0093ED))),
//                                         alignment: Alignment.center,
//                                         transformAlignment: Alignment.topRight,
//                                         child: Text(
//                                           "x1",
//                                           style: GoogleFonts.poppins(
//                                               color: const Color(0xff000000),
//                                               fontSize: 12,
//                                               fontWeight: FontWeight.w600),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(right: 20),
//                                 child: SizedBox(
//                                   height: 35,
//                                   width: 35,
//                                   child: ClipPolygon(
//                                     sides: 6,
//                                     borderRadius: 5.0,
//                                     // Defaults to 0.0 degrees
//                                     rotate: 60.0,
//                                     // Defaults to 0.0 degrees
//                                     boxShadows: [
//                                       PolygonBoxShadow(
//                                           color: Colors.black, elevation: 1.0),
//                                       PolygonBoxShadow(
//                                         color: Colors.black,
//                                         elevation: 1,
//                                       )
//                                     ],
//                                     child: Container(
//                                         color: const Color(0xff1F1C1C),
//                                         alignment: Alignment.center,
//                                         child: Text("12",
//                                             style: GoogleFonts.poppins(
//                                                 fontWeight: FontWeight.w600,
//                                                 color: const Color(0xffFFFFFF),
//                                                 fontSize: 12),
//                                             textAlign: TextAlign.center)),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Row(
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.only(right: 10),
//                               child: Row(
//                                 children: [
//                                   const Icon(
//                                     Icons.watch_later_outlined,
//                                     size: 25,
//                                   ),
//                                   SizedBox(
//                                     width: 40,
//                                     child: TweenAnimationBuilder<Duration>(
//                                         duration: const Duration(minutes: 3),
//                                         tween: Tween(
//                                             begin: const Duration(minutes: 3),
//                                             end: Duration.zero),
//                                         onEnd: () {
//                                         },
//                                         builder: (BuildContext context,
//                                             Duration value, Widget? child) {
//                                           final minutes = value.inMinutes;
//                                           final seconds = value.inSeconds % 60;
//                                           return Padding(
//                                               padding:
//                                                   const EdgeInsets.symmetric(
//                                                       vertical: 5),
//                                               child: Text('$minutes:$seconds',
//                                                   textAlign: TextAlign.center,
//                                                   style: const TextStyle(
//                                                       color: Color(0xff00253A),
//                                                       fontWeight:
//                                                           FontWeight.w600,
//                                                       fontSize: 18)));
//                                         }),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Container(
//                                 height: 53,
//                                 width: 53,
//                                 alignment: Alignment.center,
//                                 decoration: const BoxDecoration(
//                                     color: Color(0xffF1F6FF),
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(16))),
//                                 child: SizedBox(
//                                     width: MediaQuery.of(context).size.width *
//                                         0.040,
//                                     // height:
//                                     //     MediaQuery.of(context).size.height * 0.029,
//                                     child: Image.asset(
//                                         "assets/images/Auto Layout Horizontal(8).png")))
//                           ],
//                         )
//                       ],
//                     ),
//                     Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(right: 100),
//                             child: Stack(
//                               alignment: Alignment.bottomCenter,
//                               children: [
//                                 Stack(
//                                   alignment: Alignment.bottomRight,
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.only(right: 12),
//                                       child: Stack(
//                                         alignment: Alignment.topRight,
//                                         children: [
//                                           Padding(
//                                             padding: const EdgeInsets.only(
//                                                 right: 10, bottom: 15),
//                                             child: Padding(
//                                               padding: const EdgeInsets.only(
//                                                   top: 10),
//                                               child: SizedBox(
//                                                   height: MediaQuery.of(context)
//                                                           .size
//                                                           .height *
//                                                       0.21,
//                                                   width: 80,
//                                                   child: Container(
//                                                       decoration: BoxDecoration(
//                                                           border: Border.all(
//                                                               color: const Color(
//                                                                   0xff0093ED),
//                                                               width: 3),
//                                                           borderRadius:
//                                                               const BorderRadius.all(
//                                                                   Radius.circular(
//                                                                       8)),
//                                                           color: const Color(
//                                                               0xffB6E1F4)),
//                                                       child:
//                                                           Image.network("https://media.istockphoto.com/id/160992974/photo/close-up-portrait-of-confident-businesswoman.jpg?b=1&s=170667a&w=0&k=20&c=CpF-fmlPdC-QdHplVfMhUshvp8uWqw80vIdVUlpo-WI="))),
//                                             ),
//                                           ),
//                                           Container(
//                                               height: MediaQuery.of(context)
//                                                       .size
//                                                       .width *
//                                                   0.027,
//                                               width: MediaQuery.of(context)
//                                                       .size
//                                                       .height *
//                                                   0.082,
//                                               decoration: BoxDecoration(
//                                                   border: Border.all(
//                                                       width: 3,
//                                                       color: const Color(
//                                                           0xff0093ED)),
//                                                   color:
//                                                       const Color(0xffB6E1F3))),
//                                         ],
//                                       ),
//                                     ),
//                                     Positioned(
//                                       left: 60,
//                                       child: Padding(
//                                         padding: const EdgeInsets.only(
//                                             right: 12, bottom: 7),
//                                         child: Transform.rotate(
//                                           angle: (-12.8),
//                                           child: Container(
//                                             height: 30,
//                                             width: 19,
//                                             decoration: BoxDecoration(
//                                                 color: const Color(0xffB6E1F3),
//                                                 borderRadius:
//                                                     const BorderRadius.all(
//                                                         Radius.circular(4)),
//                                                 border: Border.all(
//                                                     width: 1,
//                                                     color: const Color(
//                                                         0xff0093ED))),
//                                             alignment: Alignment.center,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                     Positioned(
//                                       left: 65,
//                                       child: Padding(
//                                         padding: const EdgeInsets.only(
//                                             right: 8, bottom: 7),
//                                         child: Transform.rotate(
//                                           angle: (-12.6),
//                                           child: Container(
//                                             height: 30,
//                                             width: 19,
//                                             decoration: BoxDecoration(
//                                                 color: const Color(0xffB6E1F3),
//                                                 borderRadius:
//                                                     const BorderRadius.all(
//                                                         Radius.circular(4)),
//                                                 border: Border.all(
//                                                     width: 1,
//                                                     color: const Color(
//                                                         0xff0093ED))),
//                                             alignment: Alignment.center,
//                                             transformAlignment:
//                                                 Alignment.topRight,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                     Positioned(
//                                       left: 70,
//                                       child: Padding(
//                                         padding: const EdgeInsets.only(
//                                             right: 4, bottom: 7),
//                                         child: Transform.rotate(
//                                           angle: (-12.4),
//                                           child: Container(
//                                             height: 30,
//                                             width: 19,
//                                             decoration: BoxDecoration(
//                                                 color: const Color(0xffB6E1F3),
//                                                 borderRadius:
//                                                     const BorderRadius.all(
//                                                         Radius.circular(4)),
//                                                 border: Border.all(
//                                                     width: 1,
//                                                     color: const Color(
//                                                         0xff0093ED))),
//                                             alignment: Alignment.center,
//                                             transformAlignment:
//                                                 Alignment.topRight,
//                                             child: Text(
//                                               "x3",
//                                               style: GoogleFonts.poppins(
//                                                   color:
//                                                       const Color(0xff000000),
//                                                   fontSize: 12,
//                                                   fontWeight: FontWeight.w600),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.only(right: 20),
//                                   child: SizedBox(
//                                     height: 35,
//                                     width: 35,
//                                     child: ClipPolygon(
//                                       sides: 6,
//                                       borderRadius: 5.0,
//                                       // Defaults to 0.0 degrees
//                                       rotate: 60.0,
//                                       // Defaults to 0.0 degrees
//                                       boxShadows: [
//                                         PolygonBoxShadow(
//                                             color: Colors.black,
//                                             elevation: 1.0),
//                                         PolygonBoxShadow(
//                                           color: Colors.black,
//                                           elevation: 1,
//                                         )
//                                       ],
//                                       child: Container(
//                                           color: const Color(0xff1F1C1C),
//                                           alignment: Alignment.center,
//                                           child: Text("45",
//                                               style: GoogleFonts.poppins(
//                                                   fontWeight: FontWeight.w600,
//                                                   color:
//                                                       const Color(0xffFFFFFF),
//                                                   fontSize: 12),
//                                               textAlign: TextAlign.center)),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Padding(
//                             padding: EdgeInsets.only(
//                                 right: MediaQuery.of(context).size.height / 5),
//                             child: Transform.rotate(
//                               angle: (-48.5),
//                               child: Container(
//                                 height: 128,
//                                 width: 83,
//                                 decoration: BoxDecoration(
//                                     color: const Color(0xffB6E1F3),
//                                     borderRadius: const BorderRadius.all(
//                                         Radius.circular(6)),
//                                     border: Border.all(
//                                         width: 2,
//                                         color: const Color(0xff0093ED))),
//                               ),
//                             ),
//                           ),
//                           Stack(
//                             alignment: Alignment.bottomCenter,
//                             children: [
//                               Stack(
//                                 alignment: Alignment.bottomRight,
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.only(right: 12),
//                                     child: Stack(
//                                       alignment: Alignment.topRight,
//                                       children: [
//                                         Padding(
//                                           padding: const EdgeInsets.only(
//                                               right: 10, bottom: 15),
//                                           child: Padding(
//                                             padding:
//                                                 const EdgeInsets.only(top: 10),
//                                             child: SizedBox(
//                                                 height: MediaQuery.of(context)
//                                                         .size
//                                                         .height *
//                                                     0.21,
//                                                 width: 80,
//                                                 child: Container(
//                                                     decoration: BoxDecoration(
//                                                       border: Border.all(
//                                                           color: const Color(
//                                                               0xff0093ED),
//                                                           width: 3),
//                                                       borderRadius:
//                                                           const BorderRadius
//                                                                   .all(
//                                                               Radius.circular(
//                                                                   8)),
//                                                       color: const Color(
//                                                           0xffB6E1F4),
//                                                     ),
//                                                     child: Image.network(
//                                                         "https://media.istockphoto.com/id/1399365616/photo/handsome-young-mixed-race-man-holding-his-digital-tablet-while-standing-in-studio-isolated.jpg?b=1&s=170667a&w=0&k=20&c=DcpOu6FVxKxZ4TxSbrpV0wWgKW50xeBuSxjJVzOvyp4="))),
//                                           ),
//                                         ),
//                                         Container(
//                                             height: MediaQuery.of(context)
//                                                     .size
//                                                     .width *
//                                                 0.027,
//                                             width: MediaQuery.of(context)
//                                                     .size
//                                                     .height *
//                                                 0.082,
//                                             decoration: BoxDecoration(
//                                                 border: Border.all(
//                                                     width: 3,
//                                                     color: const Color(
//                                                         0xff0093ED)),
//                                                 color:
//                                                     const Color(0xffB6E1F3))),
//                                       ],
//                                     ),
//                                   ),
//                                   Positioned(
//                                     left: 65,
//                                     child: Padding(
//                                       padding: const EdgeInsets.only(
//                                           right: 4, bottom: 7),
//                                       child: Transform.rotate(
//                                         angle: (0),
//                                         child: Container(
//                                           height: 30,
//                                           width: 19,
//                                           decoration: BoxDecoration(
//                                               color: const Color(0xffB6E1F3),
//                                               borderRadius:
//                                                   const BorderRadius.all(
//                                                       Radius.circular(4)),
//                                               border: Border.all(
//                                                   width: 1,
//                                                   color:
//                                                       const Color(0xff0093ED))),
//                                           alignment: Alignment.center,
//                                           transformAlignment:
//                                               Alignment.topRight,
//                                           child: Text(
//                                             "x1",
//                                             style: GoogleFonts.poppins(
//                                                 color: const Color(0xff000000),
//                                                 fontSize: 12,
//                                                 fontWeight: FontWeight.w600),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(right: 20),
//                                 child: SizedBox(
//                                   height: 35,
//                                   width: 35,
//                                   child: ClipPolygon(
//                                     sides: 6,
//                                     borderRadius: 5.0,
//                                     // Defaults to 0.0 degrees
//                                     rotate: 60.0,
//                                     // Defaults to 0.0 degrees
//                                     boxShadows: [
//                                       PolygonBoxShadow(
//                                           color: Colors.black, elevation: 1.0),
//                                       PolygonBoxShadow(
//                                         color: Colors.black,
//                                         elevation: 1,
//                                       )
//                                     ],
//                                     child: Container(
//                                         color: const Color(0xff1F1C1C),
//                                         alignment: Alignment.center,
//                                         child: Text("112",
//                                             style: GoogleFonts.poppins(
//                                                 fontWeight: FontWeight.w600,
//                                                 color: const Color(0xffFFFFFF),
//                                                 fontSize: 12),
//                                             textAlign: TextAlign.center)),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ]),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         Row(
//                           children: [
//                             Stack(
//                               alignment: Alignment.bottomCenter,
//                               children: [
//                                 Stack(
//                                   alignment: Alignment.bottomRight,
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.only(right: 12),
//                                       child: Stack(
//                                         alignment: Alignment.topRight,
//                                         children: [
//                                           Padding(
//                                             padding: const EdgeInsets.only(
//                                                 right: 10, bottom: 15),
//                                             child: Padding(
//                                               padding: const EdgeInsets.only(
//                                                   top: 10),
//                                               child: SizedBox(
//                                                   height: MediaQuery.of(context)
//                                                           .size
//                                                           .height *
//                                                       0.21,
//                                                   width: 80,
//                                                   child: Container(
//                                                       decoration: BoxDecoration(
//                                                         border: Border.all(
//                                                             color: const Color(
//                                                                 0xff0093ED),
//                                                             width: 3),
//                                                         borderRadius:
//                                                             const BorderRadius
//                                                                     .all(
//                                                                 Radius.circular(
//                                                                     8)),
//                                                         color: const Color(
//                                                             0xffB6E1F4),
//                                                       ),
//                                                       child: Image.network(
//                                                           "https://media.istockphoto.com/id/1128708780/photo/woman-with-creative-hairstyle.jpg?s=612x612&w=0&k=20&c=2wLlrRmdjd_d5SoLe2YNs09LJUVSUYS-gl0ibg_Lzsk="))),
//                                             ),
//                                           ),
//                                           Container(
//                                               height: MediaQuery.of(context)
//                                                       .size
//                                                       .width *
//                                                   0.027,
//                                               width: MediaQuery.of(context)
//                                                       .size
//                                                       .height *
//                                                   0.082,
//                                               decoration: BoxDecoration(
//                                                   border: Border.all(
//                                                       width: 3,
//                                                       color: const Color(
//                                                           0xff0093ED)),
//                                                   color:
//                                                       const Color(0xffB6E1F3))),
//                                         ],
//                                       ),
//                                     ),
//                                     Positioned(
//                                       left: 65,
//                                       child: Padding(
//                                         padding: const EdgeInsets.only(
//                                             right: 4, bottom: 7),
//                                         child: Transform.rotate(
//                                           angle: (0),
//                                           child: Container(
//                                             height: 30,
//                                             width: 19,
//                                             decoration: BoxDecoration(
//                                                 color: const Color(0xffB6E1F3),
//                                                 borderRadius:
//                                                     const BorderRadius.all(
//                                                         Radius.circular(4)),
//                                                 border: Border.all(
//                                                     width: 1,
//                                                     color: const Color(
//                                                         0xff0093ED))),
//                                             alignment: Alignment.center,
//                                             transformAlignment:
//                                                 Alignment.topRight,
//                                             child: Text(
//                                               "x1",
//                                               style: GoogleFonts.poppins(
//                                                   color:
//                                                       const Color(0xff000000),
//                                                   fontSize: 12,
//                                                   fontWeight: FontWeight.w600),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.only(right: 20),
//                                   child: SizedBox(
//                                     height: 35,
//                                     width: 35,
//                                     child: ClipPolygon(
//                                       sides: 6,
//                                       borderRadius: 5.0,
//                                       // Defaults to 0.0 degrees
//                                       rotate: 60.0,
//                                       // Defaults to 0.0 degrees
//                                       boxShadows: [
//                                         PolygonBoxShadow(
//                                             color: Colors.black,
//                                             elevation: 1.0),
//                                         PolygonBoxShadow(
//                                           color: Colors.black,
//                                           elevation: 1,
//                                         )
//                                       ],
//                                       child: Container(
//                                           color: const Color(0xff1F1C1C),
//                                           alignment: Alignment.center,
//                                           child: Text("25",
//                                               style: GoogleFonts.poppins(
//                                                   fontWeight: FontWeight.w600,
//                                                   color:
//                                                       const Color(0xffFFFFFF),
//                                                   fontSize: 12),
//                                               textAlign: TextAlign.center)),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(top: 30),
//                               child: Container(
//                                 height: 60,
//                                 width: 60,
//                                 decoration: const BoxDecoration(
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(17)),
//                                     color: Color(0xffF1F6FF)),
//                                 child: IconButton(
//                                   onPressed: () {
//                                     showGeneralDialog(
//                                         barrierColor:
//                                             Colors.black.withOpacity(0.5),
//                                         transitionBuilder:
//                                             (context, a1, a2, widget) {
//                                           final curvedValue = Curves
//                                                   .easeInOutBack
//                                                   .transform(a1.value) -
//                                               1.0;
//                                           return Transform(
//                                             transform:
//                                                 Matrix4.translationValues(
//                                                     -1, curvedValue * 150, 1),
//                                             child: Opacity(
//                                               opacity: a1.value,
//                                               child: Stack(
//                                                 children: [
//                                                   AlertDialog(
//                                                       content: SizedBox(
//                                                     height:
//                                                         MediaQuery.of(context)
//                                                                 .size
//                                                                 .height *
//                                                             0.8,
//                                                     width:
//                                                         MediaQuery.of(context)
//                                                                 .size
//                                                                 .width *
//                                                             0.387,
//                                                     child: Column(
//                                                         mainAxisAlignment:
//                                                             MainAxisAlignment
//                                                                 .spaceBetween,
//                                                         children: [
//                                                           Padding(
//                                                             padding:
//                                                                 const EdgeInsets
//                                                                         .symmetric(
//                                                                     horizontal:
//                                                                         40),
//                                                             child: Row(
//                                                               mainAxisAlignment:
//                                                                   MainAxisAlignment
//                                                                       .start,
//                                                               children: [
//                                                                 Text(
//                                                                   "Reactions",
//                                                                   style: GoogleFonts.poppins(
//                                                                       color: const Color(
//                                                                           0xff00253A),
//                                                                       fontSize:
//                                                                           18,
//                                                                       fontWeight:
//                                                                           FontWeight
//                                                                               .w700),
//                                                                 )
//                                                               ],
//                                                             ),
//                                                           ),
//                                                           Row(
//                                                             mainAxisAlignment:
//                                                                 MainAxisAlignment
//                                                                     .spaceEvenly,
//                                                             children: [
//                                                               SizedBox(
//                                                                   height: 40,
//                                                                   child: Image
//                                                                       .asset(
//                                                                           "assets/img/emoji1.png")),
//                                                               SizedBox(
//                                                                   height: 40,
//                                                                   child: Image
//                                                                       .asset(
//                                                                           "assets/img/emoji2.png")),
//                                                               SizedBox(
//                                                                   height: 40,
//                                                                   child: Image
//                                                                       .asset(
//                                                                           "assets/img/emoji3.png")),
//                                                               SizedBox(
//                                                                   height: 40,
//                                                                   child: Image
//                                                                       .asset(
//                                                                           "assets/img/emoji4.png")),
//                                                             ],
//                                                           ),
//                                                           Padding(
//                                                             padding:
//                                                                 const EdgeInsets
//                                                                         .symmetric(
//                                                                     horizontal:
//                                                                         40),
//                                                             child: Row(
//                                                               mainAxisAlignment:
//                                                                   MainAxisAlignment
//                                                                       .start,
//                                                               children: [
//                                                                 Text("Phrases",
//                                                                     style: GoogleFonts.poppins(
//                                                                         color: const Color(
//                                                                             0xff00253A),
//                                                                         fontWeight:
//                                                                             FontWeight
//                                                                                 .w700,
//                                                                         fontSize:
//                                                                             18)),
//                                                               ],
//                                                             ),
//                                                           ),
//                                                           Wrap(
//                                                             spacing: 20,
//                                                             runSpacing: 10,
//                                                             children: [
//                                                               ClipRRect(
//                                                                 child:
//                                                                     Container(
//                                                                   decoration: const BoxDecoration(
//                                                                       borderRadius:
//                                                                           BorderRadius.all(Radius.circular(
//                                                                               20)),
//                                                                       color: Color(
//                                                                           0xff0093ED)),
//                                                                   height: 34,
//                                                                   width: 120,
//                                                                   alignment:
//                                                                       Alignment
//                                                                           .center,
//                                                                   child: Text(
//                                                                       "I knew it!",
//                                                                       style: GoogleFonts.poppins(
//                                                                           fontWeight: FontWeight
//                                                                               .w600,
//                                                                           fontSize:
//                                                                               12,
//                                                                           color:
//                                                                               const Color(0xffFFFFFF))),
//                                                                 ),
//                                                               ),
//                                                               ClipRRect(
//                                                                 child:
//                                                                     Container(
//                                                                   decoration: const BoxDecoration(
//                                                                       borderRadius:
//                                                                           BorderRadius.all(Radius.circular(
//                                                                               20)),
//                                                                       color: Color(
//                                                                           0xff0093ED)),
//                                                                   height: 34,
//                                                                   width: 120,
//                                                                   alignment:
//                                                                       Alignment
//                                                                           .center,
//                                                                   child: Text(
//                                                                       "Best wishes",
//                                                                       style: GoogleFonts.poppins(
//                                                                           fontWeight: FontWeight
//                                                                               .w600,
//                                                                           fontSize:
//                                                                               12,
//                                                                           color:
//                                                                               const Color(0xffFFFFFF))),
//                                                                 ),
//                                                               ),
//                                                               ClipRRect(
//                                                                 child:
//                                                                     Container(
//                                                                   decoration: const BoxDecoration(
//                                                                       borderRadius:
//                                                                           BorderRadius.all(Radius.circular(
//                                                                               20)),
//                                                                       color: Color(
//                                                                           0xff0093ED)),
//                                                                   height: 34,
//                                                                   width: 120,
//                                                                   alignment:
//                                                                       Alignment
//                                                                           .center,
//                                                                   child: Text(
//                                                                       "Well played!",
//                                                                       style: GoogleFonts.poppins(
//                                                                           fontWeight: FontWeight
//                                                                               .w600,
//                                                                           fontSize:
//                                                                               12,
//                                                                           color:
//                                                                               const Color(0xffFFFFFF))),
//                                                                 ),
//                                                               ),
//                                                               ClipRRect(
//                                                                 child:
//                                                                     Container(
//                                                                   decoration: const BoxDecoration(
//                                                                       borderRadius:
//                                                                           BorderRadius.all(Radius.circular(
//                                                                               20)),
//                                                                       color: Color(
//                                                                           0xff0093ED)),
//                                                                   height: 34,
//                                                                   width: 120,
//                                                                   alignment:
//                                                                       Alignment
//                                                                           .center,
//                                                                   child: Text(
//                                                                       "Hi!",
//                                                                       style: GoogleFonts.poppins(
//                                                                           fontWeight: FontWeight
//                                                                               .w600,
//                                                                           fontSize:
//                                                                               12,
//                                                                           color:
//                                                                               const Color(0xffFFFFFF))),
//                                                                 ),
//                                                               ),
//                                                               ClipRRect(
//                                                                 child:
//                                                                     Container(
//                                                                   decoration: const BoxDecoration(
//                                                                       borderRadius:
//                                                                           BorderRadius.all(Radius.circular(
//                                                                               20)),
//                                                                       color: Color(
//                                                                           0xff0093ED)),
//                                                                   height: 34,
//                                                                   width: 120,
//                                                                   alignment:
//                                                                       Alignment
//                                                                           .center,
//                                                                   child: Text(
//                                                                       "Thanks!",
//                                                                       style: GoogleFonts.poppins(
//                                                                           fontWeight: FontWeight
//                                                                               .w600,
//                                                                           fontSize:
//                                                                               12,
//                                                                           color:
//                                                                               const Color(0xffFFFFFF))),
//                                                                 ),
//                                                               ),
//                                                               ClipRRect(
//                                                                 child:
//                                                                     Container(
//                                                                   decoration: const BoxDecoration(
//                                                                       borderRadius:
//                                                                           BorderRadius.all(Radius.circular(
//                                                                               20)),
//                                                                       color: Color(
//                                                                           0xff0093ED)),
//                                                                   height: 34,
//                                                                   width: 120,
//                                                                   alignment:
//                                                                       Alignment
//                                                                           .center,
//                                                                   child: Text(
//                                                                       "hit herraf!",
//                                                                       style: GoogleFonts.poppins(
//                                                                           fontWeight: FontWeight
//                                                                               .w600,
//                                                                           fontSize:
//                                                                               12,
//                                                                           color:
//                                                                               const Color(0xffFFFFFF))),
//                                                                 ),
//                                                               ),
//                                                               ClipRRect(
//                                                                 child:
//                                                                     Container(
//                                                                   decoration: const BoxDecoration(
//                                                                       borderRadius:
//                                                                           BorderRadius.all(Radius.circular(
//                                                                               20)),
//                                                                       color: Color(
//                                                                           0xff0093ED)),
//                                                                   height: 34,
//                                                                   width: 120,
//                                                                   alignment:
//                                                                       Alignment
//                                                                           .center,
//                                                                   child: Text(
//                                                                       "Challenge it!",
//                                                                       style: GoogleFonts.poppins(
//                                                                           fontWeight: FontWeight
//                                                                               .w600,
//                                                                           fontSize:
//                                                                               12,
//                                                                           color:
//                                                                               const Color(0xffFFFFFF))),
//                                                                 ),
//                                                               ),
//                                                             ],
//                                                           )
//                                                         ]),
//                                                   )),
//                                                   // Positioned(
//                                                   //   right: MediaQuery.of(context).size.width * 0.221,
//                                                   //   top: MediaQuery.of(context).size.height * 0.358,
//                                                   //   child: TextButton(
//                                                   //     onPressed: () {
//                                                   //       Navigator.pop(context);
//                                                   //     },
//                                                   //     child: Container(
//                                                   //         alignment: Alignment.center,
//                                                   //         height: 50,
//                                                   //         child: Image.asset("assets/img/sideback.png")),
//                                                   //   ),
//                                                   // )
//                                                 ],
//                                               ),
//                                             ),
//                                           );
//                                         },
//                                         transitionDuration:
//                                             const Duration(milliseconds: 1000),
//                                         barrierDismissible: true,
//                                         barrierLabel: '',
//                                         context: context,
//                                         pageBuilder:
//                                             (context, animation1, animation2) {
//                                           return Container();
//                                         });
//                                   },
//                                   icon: const Icon(Icons.sms_outlined,
//                                       color: Color(0xff0093ED), size: 30),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         Column(
//                           children: [
//                             Stack(
//                               clipBehavior: Clip.none,
//                               alignment: Alignment.bottomCenter,
//                               children: [
//                                 Positioned(
//                                   child: Padding(
//                                     padding: const EdgeInsets.only(right: 180),
//                                     child: Transform.rotate(
//                                       angle: (-11.3),
//                                       child: Container(
//                                         height: 83,
//                                         width: 108,
//                                         decoration: BoxDecoration(
//                                             color: const Color(0xffB6E1F3),
//                                             borderRadius:
//                                                 const BorderRadius.all(
//                                                     Radius.circular(4)),
//                                             border: Border.all(
//                                                 width: 2,
//                                                 color:
//                                                     const Color(0xff0093ED))),
//                                         alignment: Alignment.center,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 Positioned(
//                                   child: Padding(
//                                     padding: const EdgeInsets.only(
//                                         right: 110, bottom: 8),
//                                     child: Transform.rotate(
//                                       angle: (-11.2),
//                                       child: Container(
//                                         height: 83,
//                                         width: 118,
//                                         decoration: BoxDecoration(
//                                             color: const Color(0xffB6E1F3),
//                                             borderRadius:
//                                                 const BorderRadius.all(
//                                                     Radius.circular(4)),
//                                             border: Border.all(
//                                                 width: 2,
//                                                 color:
//                                                     const Color(0xff0093ED))),
//                                         alignment: Alignment.center,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 Positioned(
//                                   child: Padding(
//                                     padding: const EdgeInsets.only(
//                                         right: 40, bottom: 12),
//                                     child: Transform.rotate(
//                                       angle: (-11.1),
//                                       child: Container(
//                                         height: 83,
//                                         width: 125,
//                                         decoration: BoxDecoration(
//                                             color: const Color(0xffB6E1F3),
//                                             borderRadius:
//                                                 const BorderRadius.all(
//                                                     Radius.circular(4)),
//                                             border: Border.all(
//                                                 width: 2,
//                                                 color:
//                                                     const Color(0xff0093ED))),
//                                         alignment: Alignment.center,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 Positioned(
//                                   child: Padding(
//                                     padding: const EdgeInsets.only(
//                                         left: 30, bottom: 13),
//                                     child: Transform.rotate(
//                                       angle: (-11),
//                                       child: Container(
//                                         height: 83,
//                                         width: 128,
//                                         decoration: BoxDecoration(
//                                             color: const Color(0xffB6E1F3),
//                                             borderRadius:
//                                                 const BorderRadius.all(
//                                                     Radius.circular(4)),
//                                             border: Border.all(
//                                                 width: 2,
//                                                 color:
//                                                     const Color(0xff0093ED))),
//                                         alignment: Alignment.center,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 Positioned(
//                                   top: 1,
//                                   child: Padding(
//                                     padding: const EdgeInsets.only(
//                                         left: 90, bottom: 14),
//                                     child: Transform.rotate(
//                                       angle: (-10.8),
//                                       child: Container(
//                                         height: 83,
//                                         width: 128,
//                                         decoration: BoxDecoration(
//                                             color: const Color(0xffB6E1F3),
//                                             borderRadius:
//                                                 const BorderRadius.all(
//                                                     Radius.circular(4)),
//                                             border: Border.all(
//                                                 width: 2,
//                                                 color:
//                                                     const Color(0xff0093ED))),
//                                         alignment: Alignment.center,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 Positioned(
//                                   top: 8,
//                                   child: Padding(
//                                     padding: const EdgeInsets.only(
//                                         left: 160, bottom: 10),
//                                     child: Transform.rotate(
//                                       angle: (-10.7),
//                                       child: Container(
//                                         height: 83,
//                                         width: 128,
//                                         decoration: BoxDecoration(
//                                             color: const Color(0xffB6E1F3),
//                                             borderRadius:
//                                                 const BorderRadius.all(
//                                                     Radius.circular(4)),
//                                             border: Border.all(
//                                                 width: 2,
//                                                 color:
//                                                     const Color(0xff0093ED))),
//                                         alignment: Alignment.center,
//                                         transformAlignment: Alignment.topRight,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 Positioned(
//                                   top: 20,
//                                   child: Padding(
//                                     padding: const EdgeInsets.only(left: 230),
//                                     child: Transform.rotate(
//                                       angle: (-10.6),
//                                       child: Container(
//                                         height: 83,
//                                         width: 128,
//                                         decoration: BoxDecoration(
//                                             color: const Color(0xffB6E1F3),
//                                             borderRadius:
//                                                 const BorderRadius.all(
//                                                     Radius.circular(4)),
//                                             border: Border.all(
//                                                 width: 2,
//                                                 color:
//                                                     const Color(0xff0093ED))),
//                                         alignment: Alignment.center,
//                                         transformAlignment: Alignment.topRight,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 Positioned(
//                                   bottom: -40,
//                                   child: Container(
//                                     alignment: Alignment.topCenter,
//                                     height: 83,
//                                     width: 83,
//                                     decoration: BoxDecoration(
//                                         border: Border.all(
//                                             color: const Color(0xff0093ED),
//                                             width: 8),
//                                         shape: BoxShape.circle,
//                                         color: const Color(0xffFFFFFF)),
//                                     child: Padding(
//                                       padding: const EdgeInsets.only(top: 10),
//                                       child: Text("herraf",
//                                           style: GoogleFonts.poppins(
//                                               fontSize: 14,
//                                               color: const Color(0xff000000),
//                                               fontWeight: FontWeight.w700),
//                                           textAlign: TextAlign.center),
//                                     ),
//                                   ),
//                                 )
//                                 // Positioned(
//                                 //   bottom: -30,
//                                 //   child: Container(
//                                 //     width: 70,
//                                 //     height: 70,
//                                 //     decoration: BoxDecoration(
//                                 //         border: Border.all(
//                                 //             width: 8,
//                                 //             color: const Color(0xff0093ED)),
//                                 //         borderRadius: const BorderRadius.all(
//                                 //             Radius.circular(50))),
//                                 //     alignment: Alignment.center,
//                                 //     child: FloatingActionButton(
//                                 //       backgroundColor: const Color(0xffFFFFFF),
//                                 //       onPressed: () {},
//                                 //       child: Text("herraf",
//                                 //           style: GoogleFonts.poppins(
//                                 //               fontSize: 14,
//                                 //               color: const Color(0xff000000),
//                                 //               fontWeight: FontWeight.w700)),
//                                 //     ),
//                                 //   ),
//                                 // )
//                               ],
//                             ),
//                           ],
//                         ),
//                         const SizedBox(
//                           width: 150,
//                         )
//                       ],
//                     )
//                   ]),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 20),
//             child: Container(
//               height: MediaQuery.of(context).size.height * 0.76,
//               width: MediaQuery.of(context).size.width * 0.230,
//               decoration: BoxDecoration(
//                 borderRadius: const BorderRadius.all(Radius.circular(4.45)),
//                 border: Border.all(color: const Color(0xff0093ED), width: 3.33),
//                 color: const Color(0xffF1F6FF),
//               ),
//               child: Padding(
//                 padding: EdgeInsets.only(
//                     bottom: MediaQuery.of(context).size.height * 0.10),
//                 child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Container(
//                             width: MediaQuery.of(context).size.width * 0.076,
//                             height: MediaQuery.of(context).size.height * 0.165,
//                             alignment: Alignment.center,
//                             decoration: const BoxDecoration(
//                               borderRadius: BorderRadius.only(
//                                   bottomLeft: Radius.circular(5.56)),
//                               color: Colors.blue,
//                             ),
//                             child: Text("4",
//                                 style: GoogleFonts.roboto(
//                                     color: const Color(0xffFFFFFF),
//                                     fontSize: 40,
//                                     fontWeight: FontWeight.w700)),
//                           )
//                         ],
//                       ),
//                       Container(
//                         height: MediaQuery.of(context).size.height * 0.312,
//                         width: MediaQuery.of(context).size.width * 0.144,
//                         decoration:
//                             const BoxDecoration(color: Color(0xffB6E1F3)),
//                       ),
//                       Text(
//                         "Tape le vcd",
//                         style: GoogleFonts.roboto(
//                             color: const Color(0xff0093ED),
//                             fontWeight: FontWeight.w700,
//                             fontSize: 20),
//                       )
//                     ]),
//               ),
//             ),
//           ),
//           Positioned(
//             left: -5,
//             bottom: -15,
//             child: Transform.rotate(
//               angle: 44.8,
//               child: Container(
//                 width: 100,
//                 height: 161,
//                 color: const Color(0xff0093Ed),
//                 child: Padding(
//                   padding: const EdgeInsets.only(top: 30),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Stack(
//                         clipBehavior: Clip.none,
//                         children: [
//                           Stack(
//                             clipBehavior: Clip.none,
//                             children: [
//                               SizedBox(
//                                   height: 40,
//                                   child: Transform.rotate(
//                                       angle: 11.6,
//                                       child:
//                                           Image.asset("assets/img/change.png")))
//                             ],
//                           ),
//                           Positioned(
//                             right: -10,
//                             top: -30,
//                             child: Transform.rotate(
//                               angle: 11.7,
//                               child: Container(
//                                   height:
//                                       MediaQuery.of(context).size.width * 0.027,
//                                   width: MediaQuery.of(context).size.height *
//                                       0.082,
//                                   decoration: BoxDecoration(
//                                       border: Border.all(
//                                           width: 3,
//                                           color: const Color(0xff0093ED)),
//                                       color: const Color(0xffB6E1F3))),
//                             ),
//                           ),
//                         ],
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text(
//                           "Reverse\ndirection",
//                           style: GoogleFonts.roboto(
//                               fontWeight: FontWeight.w500,
//                               fontSize: 14,
//                               color: const Color(0xffFFFFFF)),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//             right: -10,
//             bottom: -5,
//             child: Transform.rotate(
//               angle: 19.7,
//               child: Container(
//                 alignment: Alignment.center,
//                 height: 100,
//                 width: 161,
//                 color: const Color(0xff0093Ed),
//                 child: Text("Spell out",
//                     style: GoogleFonts.roboto(
//                         color: Color(0xffFFFFFF),
//                         fontSize: 24,
//                         fontWeight: FontWeight.w700)),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

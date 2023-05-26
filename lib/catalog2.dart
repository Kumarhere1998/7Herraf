// // TODO Implement this library.// ignore_for_file: prefer_const_constructors, unnecessary_new, implementation_imports

// // ignore_for_file: prefer_const_constructors, unnecessary_new

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// import 'package:herraf_app/catalog2.dart';
// import 'package:herraf_app/catalog3.dart';
// import 'package:herraf_app/checkout1.dart';

// class CatalogPage2 extends StatefulWidget {
//   const CatalogPage2({Key? key}) : super(key: key);

//   @override
//   State<CatalogPage2> createState() => _CatalogPageState();
// }

// class _CatalogPageState extends State<CatalogPage2> {
//   final GlobalKey webViewKey = GlobalKey();

//   final _scaffoldKey = GlobalKey<ScaffoldState>();

//   @override
//   Widget build(BuildContext context) {
//     var imageFile;
//     return Scaffold(
//         backgroundColor: Color(0xffE5E5E5),
//         body: SingleChildScrollView(
//             padding: const EdgeInsets.only(
//               top: 10,
//             ),
//             child: Column(children: [
//               Container(
//                 padding: const EdgeInsets.only(top: 28),
//                 margin: new EdgeInsets.symmetric(
//                   horizontal: 20.0,
//                 ),
//                 alignment: Alignment.centerLeft,
//                 child: Row(children: <Widget>[
//                   Text(
//                     "Buy cards",
//                     style: GoogleFonts.poppins(
//                         color: Color(0xff0093ED),
//                         fontSize: 18,
//                         fontWeight: FontWeight.w600),
//                   ),
//                   Padding(padding: const EdgeInsets.only(right: 205)),
//                   InkWell(
//                     onTap: (() {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => CheckOutOne()),
//                       );
//                     }),
//                     child: Stack(
//                       alignment: AlignmentDirectional.center,
//                       children: [
//                         IconButton(
//                           onPressed: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => CheckOutOne()),
//                             );
//                           },
//                           icon: const Icon(
//                             Icons.shopping_cart_sharp,
//                             size: 30,
//                             color: Color(0xff0093ED),
//                           ),
//                         ),
//                         Positioned(
//                           top: 4,
//                           right: 6,
//                           child: Container(
//                             height: 21,
//                             width: 21,
//                             decoration: const BoxDecoration(
//                               shape: BoxShape.circle,
//                               color: Color(0xff0093ED),
//                             ),
//                             child: Center(
//                                 child: Text(
//                               "1",
//                               style: GoogleFonts.poppins(
//                                   color: Color(0xfffffffff),
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w700),
//                             )),
//                           ),
//                         ),
//                       ],
//                     ),
//                     // Container(
//                     //   child: Image.asset(
//                     //     'assets/images/addcart.png',
//                     //     height: 32,
//                     //     width: 32,
//                     //     // width: MediaQuery.of(context).size.width * 0.94,
//                     //     // height: MediaQuery.of(context).size.height * 0.14,
//                     //   ), // <-- SEE HERE
//                     // ),
//                   ),
//                 ]),
//               ),
//               Container(
//                 margin: new EdgeInsets.symmetric(
//                   horizontal: 20.0,
//                 ),
//                 padding: const EdgeInsets.only(top: 20),
//                 height: MediaQuery.of(context).size.height * 0.9,
//                 child: DefaultTabController(
//                     length: 2, // length of tabs
//                     // initialIndex: 0,
//                     child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.stretch,
//                         children: <Widget>[
//                           Container(
//                             child: TabBar(
//                               indicatorColor: Color(0xff0093ED),
//                               indicatorWeight: 8,
//                               //isScrollable: true,
//                               labelColor: Color(0xff00253A),
//                               unselectedLabelColor: Color(0xFF828282),
//                               tabs: [
//                                 Tab(
//                                   child: Container(
//                                     // alignment: Alignment.center,
//                                     //  constraints: BoxConstraints.expand(),
//                                     child: Text(
//                                       "All",
//                                       style: GoogleFonts.poppins(
//                                           // color: Color(0xff0093ED),
//                                           fontSize: 18,
//                                           fontWeight: FontWeight.w700),
//                                     ),
//                                   ),
//                                 ),
//                                 Tab(
//                                   child: Container(
//                                     // padding: const EdgeInsets.only(
//                                     //   left: 65,
//                                     //   //right: 75,
//                                     // ),
//                                     //  alignment: Alignment.center,
//                                     //  constraints: BoxConstraints.expand(),
//                                     //  color: BLUE_DEEP,
//                                     child: Text(
//                                       "My flashcards",
//                                       style: GoogleFonts.poppins(
//                                           // color: Color(0xff0093ED),
//                                           fontSize: 18,
//                                           fontWeight: FontWeight.w700),
//                                       //   ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Container(
//                               padding: EdgeInsets.only(
//                                 top: 10,
//                               ),
//                               width: 190,
//                               height: MediaQuery.of(context).size.height * 0.8,
//                               // width: 900, //height of TabBarView
//                               decoration: BoxDecoration(),
//                               child: TabBarView(children: <Widget>[
//                                 Container(
//                                   margin: new EdgeInsets.symmetric(
//                                     horizontal: 5.0,
//                                   ),
//                                   // child: Padding(
//                                   //  padding: const EdgeInsets.all(8.0),
//                                   child: ListView.builder(
//                                     itemCount: 50,
//                                     itemBuilder: (context, index) {
//                                       return Container(
//                                           height: 600,
//                                           width: 240,
//                                           child: Card(
//                                               color: Color(0xffE5E5E5),
//                                               elevation: 0,
//                                               shape: RoundedRectangleBorder(
//                                                 borderRadius: BorderRadius.all(
//                                                     Radius.circular(0)),
//                                               ),
//                                               child: Column(children: <Widget>[
//                                                 Stack(
//                                                   children: [
//                                                     Container(
//                                                       width: 338.0,
//                                                       height: 300.0,
//                                                       decoration: BoxDecoration(
//                                                         color:
//                                                             Color(0xffB6E1F3),
//                                                         image: DecorationImage(
//                                                             image: AssetImage(
//                                                                 'assets/images/card.png'),
//                                                             fit: BoxFit.cover),
//                                                         borderRadius:
//                                                             BorderRadius.all(
//                                                                 Radius.circular(
//                                                                     0.0)),
//                                                         // ignore: prefer_const_literals_to_create_immutables
//                                                         // boxShadow: [
//                                                         //   BoxShadow(blurRadius: 7.0, color: Colors.black)
//                                                         // ]
//                                                       ),
//                                                     ),
//                                                     Positioned(
//                                                       // The Positioned widget is used to position the text inside the Stack widget
//                                                       // bottom: 80,
//                                                       // right: 85,
//                                                       child: Column(
//                                                         mainAxisAlignment:
//                                                             MainAxisAlignment
//                                                                 .start, //change here don't //worked
//                                                         crossAxisAlignment:
//                                                             CrossAxisAlignment
//                                                                 .center,
//                                                         children: <Widget>[
//                                                           Container(
//                                                             // margin: new EdgeInsets
//                                                             //         .symmetric(
//                                                             //     horizontal: 7.0,
//                                                             //     vertical: 3),
//                                                             alignment: Alignment
//                                                                 .topRight,
//                                                             child: FlatButton(
//                                                                 height: 36,
//                                                                 minWidth: 100,
//                                                                 materialTapTargetSize:
//                                                                     MaterialTapTargetSize
//                                                                         .shrinkWrap,
//                                                                 shape: RoundedRectangleBorder(
//                                                                     borderRadius:
//                                                                         BorderRadius.circular(
//                                                                             0.0)),
//                                                                 color: Color(
//                                                                     0xff000000),
//                                                                 onPressed: () {
//                                                                   // Navigator.of(context)
//                                                                   //     .pushReplacement(
//                                                                   //         MaterialPageRoute(
//                                                                   //             builder: (context) =>
//                                                                   //                 ShoppingBag()));
//                                                                 },
//                                                                 child: Text(
//                                                                     '20 off',
//                                                                     style: GoogleFonts.montserrat(
//                                                                         //color: Colors.red,
//                                                                         color: Color(0xffffffff),
//                                                                         fontSize: 12,
//                                                                         fontWeight: FontWeight.w700))),
//                                                           ),
//                                                           Padding(
//                                                             padding:
//                                                                 EdgeInsets.only(
//                                                                     top: 200,
//                                                                     right: 0),
//                                                           ),
//                                                           Row(
//                                                             crossAxisAlignment:
//                                                                 CrossAxisAlignment
//                                                                     .start,
//                                                             children: <Widget>[
//                                                               Container(
//                                                                 margin: new EdgeInsets
//                                                                         .symmetric(
//                                                                     horizontal:
//                                                                         11.0,
//                                                                     vertical:
//                                                                         0),
//                                                                 alignment: Alignment
//                                                                     .centerLeft,
//                                                                 child: FlatButton(
//                                                                     height: 36,
//                                                                     minWidth: 100,
//                                                                     materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                                                                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
//                                                                     color: Color(0xff0093ED),
//                                                                     onPressed: () {
//                                                                       // Navigator.of(
//                                                                       //         context)
//                                                                       //     .pushReplacement(
//                                                                       //         MaterialPageRoute(builder: (context) => CatalogPage2()));
//                                                                     },
//                                                                     child: Text('newest',
//                                                                         style: GoogleFonts.montserrat(
//                                                                             //color: Colors.red,
//                                                                             color: Color(0xffffffff),
//                                                                             fontSize: 12,
//                                                                             fontWeight: FontWeight.w700))),
//                                                               ),
//                                                             ],
//                                                           ),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                                 Padding(
//                                                   padding:
//                                                       const EdgeInsets.only(
//                                                     top: 20,
//                                                   ),
//                                                 ),
//                                                 Row(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment
//                                                           .spaceBetween,
//                                                   children: <Widget>[
//                                                     Text('Pack 1 Name',
//                                                         style: GoogleFonts
//                                                             .montserrat(
//                                                                 //color: Colors.red,
//                                                                 color: Color(
//                                                                     0xff00253A),
//                                                                 fontSize: 18,
//                                                                 fontWeight:
//                                                                     FontWeight
//                                                                         .w700)),
//                                                     Padding(
//                                                       padding:
//                                                           const EdgeInsets.only(
//                                                         left: 3,
//                                                       ),
//                                                     ),
//                                                     Text('€15',
//                                                         style: GoogleFonts
//                                                             .montserrat(
//                                                                 //color: Colors.red,
//                                                                 color: Color(
//                                                                     0xff333333),
//                                                                 fontSize: 14,
//                                                                 fontWeight:
//                                                                     FontWeight
//                                                                         .w500)),
//                                                     Text('€12',
//                                                         style: GoogleFonts
//                                                             .montserrat(
//                                                                 //color: Colors.red,
//                                                                 color: Color(
//                                                                     0xff0093ED),
//                                                                 fontSize: 24,
//                                                                 fontWeight:
//                                                                     FontWeight
//                                                                         .w700)),
//                                                   ],
//                                                 ),
//                                                 Padding(
//                                                   padding:
//                                                       const EdgeInsets.only(
//                                                     top: 10,
//                                                   ),
//                                                 ),
//                                                 Row(children: <Widget>[
//                                                   Container(
//                                                     //margin: new EdgeInsets.symmetric(horizontal: 19),
//                                                     padding:
//                                                         const EdgeInsets.only(
//                                                       top: 5,
//                                                     ),
//                                                     child: Text(
//                                                       "Topics",
//                                                       style:
//                                                           GoogleFonts.poppins(
//                                                         color:
//                                                             Color(0xff6B6665),
//                                                         fontSize: 16,
//                                                         fontWeight:
//                                                             FontWeight.w500,
//                                                       ),
//                                                       textAlign: TextAlign.left,
//                                                     ),
//                                                   ),
//                                                 ]),
//                                                 Container(
//                                                   margin: new EdgeInsets
//                                                       .symmetric(),
//                                                   padding: const EdgeInsets
//                                                       .symmetric(vertical: 5),
//                                                   child: Text(
//                                                     "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,.....",
//                                                     style: GoogleFonts.poppins(
//                                                       color: Color(0xffB6E1F4),
//                                                       fontSize: 14,
//                                                       fontWeight:
//                                                           FontWeight.w600,
//                                                     ),
//                                                     //textAlign: TextAlign.left,
//                                                     textAlign:
//                                                         TextAlign.justify,
//                                                   ),
//                                                 ),
//                                                 Row(children: <Widget>[
//                                                   Container(
//                                                     // padding: EdgeInsets.only(top: 10),
//                                                     // decoration: BoxDecoration(
//                                                     //     borderRadius: BorderRadius.circular(15.0),
//                                                     //     color: Colors.blue),
//                                                     padding:
//                                                         const EdgeInsets.only(
//                                                             top: 20.0,
//                                                             right: 170),
//                                                     child: Row(
//                                                         mainAxisAlignment:
//                                                             MainAxisAlignment
//                                                                 .center,
//                                                         children: <Widget>[
//                                                           FlatButton(
//                                                             minWidth: 120.0,
//                                                             height: 47,
//                                                             onPressed: () {
//                                                               // Navigator.of(
//                                                               //         context)
//                                                               //     .pushReplacement(
//                                                               //         MaterialPageRoute(
//                                                               //             builder: (context) =>
//                                                               //                 CartPage()));
//                                                             },
//                                                             child: Text(
//                                                               'Add to cart',
//                                                               // ignore: prefer_const_constructors, unnecessary_new
//                                                               style: GoogleFonts.poppins(
//                                                                   color: Color(
//                                                                       0xff0093ED),
//                                                                   fontSize: 14,
//                                                                   fontWeight:
//                                                                       FontWeight
//                                                                           .w600),
//                                                             ),
//                                                             textColor: Color(
//                                                                 0xff0093ED),
//                                                             shape: RoundedRectangleBorder(
//                                                                 side: BorderSide(
//                                                                     color: Color(
//                                                                         0xff0093ED),
//                                                                     width: 2,
//                                                                     style: BorderStyle
//                                                                         .solid),
//                                                                 borderRadius:
//                                                                     BorderRadius
//                                                                         .circular(
//                                                                             0)),
//                                                           ),

//                                                           //             // use the email provided here
//                                                           //           )
//                                                           //         ])),
//                                                         ]),
//                                                   )
//                                                 ]),
//                                               ])));
//                                     },
//                                   ),
//                                 ),
//                                 Container(
//                                   margin: new EdgeInsets.symmetric(
//                                     horizontal: 5.0,
//                                   ),
//                                   // child: Padding(
//                                   //  padding: const EdgeInsets.all(8.0),
//                                   child: ListView.builder(
//                                     itemCount: 50,
//                                     itemBuilder: (context, index) {
//                                       return Container(
//                                           height: 490,
//                                           width: 220,
//                                           child: Card(
//                                               color: Color(0xffE5E5E5),
//                                               elevation: 0,
//                                               shape: RoundedRectangleBorder(
//                                                 borderRadius: BorderRadius.all(
//                                                     Radius.circular(0)),
//                                               ),
//                                               child: Column(children: <Widget>[
//                                                 Stack(
//                                                   children: [
//                                                     Container(
//                                                       width: 400.0,
//                                                       height: 300.0,
//                                                       decoration: BoxDecoration(
//                                                         color:
//                                                             Color(0xffB6E1F3),
//                                                         image: DecorationImage(
//                                                             image: AssetImage(
//                                                                 'assets/images/Rectangle.png'),
//                                                             fit: BoxFit.cover),
//                                                         borderRadius:
//                                                             BorderRadius.all(
//                                                                 Radius.circular(
//                                                                     0.0)),
//                                                         // ignore: prefer_const_literals_to_create_immutables
//                                                         // boxShadow: [
//                                                         //   BoxShadow(blurRadius: 7.0, color: Colors.black)
//                                                         // ]
//                                                       ),
//                                                     ),
//                                                     Positioned(
//                                                       // The Positioned widget is used to position the text inside the Stack widget
//                                                       // bottom: 80,
//                                                       // right: 85,
//                                                       child: Column(
//                                                         mainAxisAlignment:
//                                                             MainAxisAlignment
//                                                                 .start, //change here don't //worked
//                                                         crossAxisAlignment:
//                                                             CrossAxisAlignment
//                                                                 .center,
//                                                         children: <Widget>[
//                                                           Container(
//                                                             // margin: new EdgeInsets
//                                                             //         .symmetric(
//                                                             //     horizontal: 7.0,
//                                                             //     vertical: 3),
//                                                             alignment: Alignment
//                                                                 .topRight,
//                                                             child: FlatButton(
//                                                                 height: 36,
//                                                                 minWidth: 100,
//                                                                 materialTapTargetSize:
//                                                                     MaterialTapTargetSize
//                                                                         .shrinkWrap,
//                                                                 shape: RoundedRectangleBorder(
//                                                                     borderRadius:
//                                                                         BorderRadius.circular(
//                                                                             0.0)),
//                                                                 color: Color(
//                                                                     0xff000000),
//                                                                 onPressed: () {
//                                                                   // Navigator.of(context)
//                                                                   //     .pushReplacement(
//                                                                   //         MaterialPageRoute(
//                                                                   //             builder: (context) =>
//                                                                   //                 ShoppingBag()));
//                                                                 },
//                                                                 child: Text(
//                                                                     '20 off',
//                                                                     style: GoogleFonts.montserrat(
//                                                                         //color: Colors.red,
//                                                                         color: Color(0xffffffff),
//                                                                         fontSize: 12,
//                                                                         fontWeight: FontWeight.w700))),
//                                                           ),
//                                                           Padding(
//                                                             padding:
//                                                                 EdgeInsets.only(
//                                                                     top: 180,
//                                                                     right: 0),
//                                                           ),
//                                                           Row(
//                                                             crossAxisAlignment:
//                                                                 CrossAxisAlignment
//                                                                     .start,
//                                                             children: <Widget>[
//                                                               Container(
//                                                                 margin: new EdgeInsets
//                                                                         .symmetric(
//                                                                     horizontal:
//                                                                         11.0,
//                                                                     vertical:
//                                                                         0),
//                                                                 alignment: Alignment
//                                                                     .centerLeft,
//                                                                 child: FlatButton(
//                                                                     height: 36,
//                                                                     minWidth: 100,
//                                                                     materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                                                                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
//                                                                     color: Color(0xff0093ED),
//                                                                     onPressed: () {
//                                                                       // Navigator.of(
//                                                                       //         context)
//                                                                       //     .pushReplacement(
//                                                                       //         MaterialPageRoute(builder: (context) => CatalogPage2()));
//                                                                     },
//                                                                     child: Text('newest',
//                                                                         style: GoogleFonts.montserrat(
//                                                                             //color: Colors.red,
//                                                                             color: Color(0xffffffff),
//                                                                             fontSize: 12,
//                                                                             fontWeight: FontWeight.w700))),
//                                                               ),
//                                                               Container(
//                                                                 margin: new EdgeInsets
//                                                                         .symmetric(
//                                                                     horizontal:
//                                                                         7.0,
//                                                                     vertical:
//                                                                         3),
//                                                                 alignment: Alignment
//                                                                     .centerLeft,
//                                                                 child: FlatButton(
//                                                                     height: 36,
//                                                                     minWidth: 100,
//                                                                     materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                                                                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
//                                                                     color: Color(0xff0093ED),
//                                                                     onPressed: () {
//                                                                       // Navigator.of(context)
//                                                                       //     .pushReplacement(
//                                                                       //         MaterialPageRoute(
//                                                                       //             builder: (context) =>
//                                                                       //                 ShoppingBag()));
//                                                                     },
//                                                                     child: Text('cardio',
//                                                                         style: GoogleFonts.montserrat(
//                                                                             //color: Colors.red,
//                                                                             color: Color(0xffffffff),
//                                                                             fontSize: 12,
//                                                                             fontWeight: FontWeight.w700))),
//                                                               ),
//                                                             ],
//                                                           ),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                                 Row(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment
//                                                           .spaceBetween,
//                                                   children: <Widget>[
//                                                     Text('Pack 1 Name',
//                                                         style: GoogleFonts
//                                                             .montserrat(
//                                                                 //color: Colors.red,
//                                                                 color: Color(
//                                                                     0xff00253A),
//                                                                 fontSize: 18,
//                                                                 fontWeight:
//                                                                     FontWeight
//                                                                         .w700)),
//                                                     Padding(
//                                                       padding:
//                                                           const EdgeInsets.only(
//                                                         left: 3,
//                                                       ),
//                                                     ),
//                                                     Text('€15',
//                                                         style: GoogleFonts
//                                                             .montserrat(
//                                                                 //color: Colors.red,
//                                                                 color: Color(
//                                                                     0xff333333),
//                                                                 fontSize: 14,
//                                                                 fontWeight:
//                                                                     FontWeight
//                                                                         .w500)),
//                                                     Text('€12',
//                                                         style: GoogleFonts
//                                                             .montserrat(
//                                                                 //color: Colors.red,
//                                                                 color: Color(
//                                                                     0xff0093ED),
//                                                                 fontSize: 24,
//                                                                 fontWeight:
//                                                                     FontWeight
//                                                                         .w700)),
//                                                   ],
//                                                 ),
//                                                 Container(
//                                                   // padding: EdgeInsets.only(top: 10),
//                                                   // decoration: BoxDecoration(
//                                                   //     borderRadius: BorderRadius.circular(15.0),
//                                                   //     color: Colors.blue),
//                                                   padding:
//                                                       const EdgeInsets.only(
//                                                           top: 75.0,
//                                                           right: 170),
//                                                   child: Row(
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .center,
//                                                       children: <Widget>[
//                                                         FlatButton(
//                                                           minWidth: 120.0,
//                                                           height: 47,
//                                                           onPressed: () {
//                                                             Navigator.of(
//                                                                     context)
//                                                                 .pushReplacement(
//                                                                     MaterialPageRoute(
//                                                                         builder:
//                                                                             (context) =>
//                                                                                 CatalogPage2()));
//                                                           },
//                                                           child: Text(
//                                                             'Add to cart',
//                                                             // ignore: prefer_const_constructors, unnecessary_new
//                                                             style: GoogleFonts.poppins(
//                                                                 color: Color(
//                                                                     0xff0093ED),
//                                                                 fontSize: 14,
//                                                                 fontWeight:
//                                                                     FontWeight
//                                                                         .w600),
//                                                           ),
//                                                           textColor:
//                                                               Color(0xff0093ED),
//                                                           shape: RoundedRectangleBorder(
//                                                               side: BorderSide(
//                                                                   color: Color(
//                                                                       0xff0093ED),
//                                                                   width: 2,
//                                                                   style:
//                                                                       BorderStyle
//                                                                           .solid),
//                                                               borderRadius:
//                                                                   BorderRadius
//                                                                       .circular(
//                                                                           0)),
//                                                         ),

//                                                         //             // use the email provided here
//                                                         //           )
//                                                         //         ])),
//                                                       ]),
//                                                 )
//                                               ])));
//                                     },
//                                   ),
//                                 ),
//                               ]))
//                         ])),
//               ),
//             ])));

//     // _navigateRegistration() {
//     //   Navigator.push(
//     //       context, MaterialPageRoute(builder: (context) => LoginPage()));
//     // }
//   }
// }

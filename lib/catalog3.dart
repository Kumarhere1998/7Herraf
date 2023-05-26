// // TODO Implement this library.// ignore_for_file: prefer_const_constructors, unnecessary_new, implementation_imports

// // ignore_for_file: prefer_const_constructors, unnecessary_new

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// import 'package:herraf_app/api_servivce.dart';
// import 'package:herraf_app/catalog2.dart';
// import 'package:herraf_app/catalog4.dart';
// import 'package:herraf_app/checkout1.dart';

// class CatalogPage3 extends StatefulWidget {
//   const CatalogPage3({Key? key}) : super(key: key);

//   @override
//   State<CatalogPage3> createState() => _CatalogPage3State();
// }

// class _CatalogPage3State extends State<CatalogPage3> {
//   final GlobalKey webViewKey = GlobalKey();

//   //final GlobalKey<ScaffoldState> _key = GlobalKey();
//   final _scaffoldKey = GlobalKey<ScaffoldState>();

//   // void register(){
//   //   ApiService.login(_data).then((value)  {

//   //   });

//   List<dynamic> catalog = [];
//   @override
//   void initState() {
//     catalogdata();

//     super.initState();
//   }

//   catalogdata() {
//     ApiService.catalogdata().then((value) {
//       // ApiService.class_data("3,4", pref.getString("token"),date).then((value) {

//       print("hoglllg");
//       setState(() {
//         print("rakhi${value}");
//         catalog = value;
//       });
//     });
//   }

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
//                   horizontal: 10.0,
//                 ),
//                 alignment: Alignment.centerLeft,
//                 child: Row(children: <Widget>[
//                   InkWell(
//                       onTap: (() {
//                         //   Navigator.push(
//                         //   context,
//                         //   MaterialPageRoute(
//                         //       builder: (context) => GetCartPage()),
//                         // );
//                       }),
//                       child: Image.asset(
//                         'assets/images/Frame(5).png',
//                         height: 32,
//                         width: 32,
//                         // width: MediaQuery.of(context).size.width * 0.94,
//                         // height: MediaQuery.of(context).size.height * 0.14,
//                       )), // <-- SEE HERE

//                   Padding(padding: const EdgeInsets.only(right: 5)),
//                   InkWell(
//                     onTap: (() {
//                       // Navigator.push(
//                       //   context,
//                       //   MaterialPageRoute(builder: (context) => CartPage()),
//                       // );
//                     }),
//                     child: Text(
//                       "Cart (1)",
//                       style: GoogleFonts.poppins(
//                           color: Color(0xff0093ED),
//                           fontSize: 18,
//                           fontWeight: FontWeight.w600),
//                     ),
//                   ),
//                 ]),
//               ),
//               Container(
//                 padding: EdgeInsets.only(top: 20, left: 20, right: 20),
//                 child: SizedBox(
//                   width: 340,
//                   height: 320,
//                   child: Stack(
//                     children: [
//                       Container(
//                         //  width: 338.0,
//                         height: 320.0,
//                         decoration: BoxDecoration(
//                           color: Color(0xffB6E1F3),
//                           image: DecorationImage(
//                               image: AssetImage('assets/images/card.png'),
//                               fit: BoxFit.cover),
//                           borderRadius: BorderRadius.all(Radius.circular(0.0)),
//                           // ignore: prefer_const_literals_to_create_immutables
//                           // boxShadow: [
//                           //   BoxShadow(blurRadius: 7.0, color: Colors.black)
//                           // ]
//                         ),
//                       ),
//                       Positioned(
//                         // The Positioned widget is used to position the text inside the Stack widget
//                         // bottom: 80,
//                         // right: 85,
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment
//                               .start, //change here don't //worked
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: <Widget>[
//                             Container(
//                               // margin: new EdgeInsets
//                               //         .symmetric(
//                               //     horizontal: 7.0,
//                               //     vertical: 3),
//                               alignment: Alignment.topRight,
//                               // child: FlatButton(
//                               //     height: 36,
//                               //     minWidth: 100,
//                               //     materialTapTargetSize:
//                               //         MaterialTapTargetSize.shrinkWrap,
//                               //     shape: RoundedRectangleBorder(
//                               //         borderRadius: BorderRadius.circular(0.0)),
//                               //     color: Color(0xff000000),
//                               //     onPressed: () {
//                               //       // Navigator.of(context)
//                               //       //     .pushReplacement(
//                               //       //         MaterialPageRoute(
//                               //       //             builder: (context) =>
//                               //       //                 ShoppingBag()));
//                               //     },
//                               // child: Icon(
//                               //   Icons.delete,
//                               //   color: Color(0xff000000),
//                               //   size: 32,
//                               // )
//                               //),
//                             ),
//                             Padding(
//                               padding: EdgeInsets.only(top: 254, left: 4),
//                             ),
//                             Row(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: <Widget>[
//                                 Container(
//                                   margin: new EdgeInsets.symmetric(
//                                       horizontal: 11.0, vertical: 0),
//                                   alignment: Alignment.centerLeft,
//                                   child: FlatButton(
//                                       height: 36,
//                                       minWidth: 100,
//                                       materialTapTargetSize:
//                                           MaterialTapTargetSize.shrinkWrap,
//                                       shape: RoundedRectangleBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(30.0)),
//                                       color: Color(0xff0093ED),
//                                       onPressed: () {
//                                         // Navigator.of(
//                                         //         context)
//                                         //     .pushReplacement(
//                                         //         MaterialPageRoute(builder: (context) => CatalogPage2()));
//                                       },
//                                       child: Text('newest',
//                                           style: GoogleFonts.montserrat(
//                                               //color: Colors.red,
//                                               color: Color(0xffffffff),
//                                               fontSize: 12,
//                                               fontWeight: FontWeight.w700))),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                   // child: Card(
//                   //   margin: EdgeInsets.all(10),
//                   //   color: Color(0xffF1F6FF),
//                   //   //shadowColor: Colors.blueGrey,
//                   //   elevation: 0,
//                   //   child: Column(
//                   //     mainAxisAlignment:
//                   //         MainAxisAlignment.start, //change here don't //worked
//                   //     crossAxisAlignment: CrossAxisAlignment.center,
//                   //     children: <Widget>[
//                   //       Container(
//                   //         // margin: new EdgeInsets
//                   //         //         .symmetric(
//                   //         //     horizontal: 7.0,
//                   //         //     vertical: 3),
//                   //         alignment: Alignment.topRight,
//                   //         child: Container(
//                   //             width: 50.0,
//                   //             height: 50.0,
//                   //             child: Icon(
//                   //               Icons.delete,
//                   //               color: Color(0xff000000),
//                   //               size: 32,
//                   //             )
//                   //             // decoration: BoxDecoration(
//                   //             //   color: Color(0xffB6E1F3),
//                   //             //   image: DecorationImage(
//                   //             //       image: AssetImage(
//                   //             //           'assets/images/Vector(51).png'),
//                   //             //       fit: BoxFit.cover),
//                   //             //   borderRadius:
//                   //             //       BorderRadius.all(Radius.circular(0.0)),
//                   //             //   // ignore: prefer_const_literals_to_create_immutables
//                   //             //   // boxShadow: [
//                   //             //   //   BoxShadow(blurRadius: 7.0, color: Colors.black)
//                   //             //   // ]
//                   //             // ),
//                   //             ),
//                   //       ),
//                   //       Padding(
//                   //         padding: EdgeInsets.only(top: 180, right: 0),
//                   //       ),
//                   //       Row(
//                   //         crossAxisAlignment: CrossAxisAlignment.start,
//                   //         children: <Widget>[
//                   //           Container(
//                   //             margin: new EdgeInsets.symmetric(
//                   //                 horizontal: 11.0, vertical: 0),
//                   //             alignment: Alignment.centerLeft,
//                   //             child: FlatButton(
//                   //                 height: 36,
//                   //                 minWidth: 100,
//                   //                 materialTapTargetSize:
//                   //                     MaterialTapTargetSize.shrinkWrap,
//                   //                 shape: RoundedRectangleBorder(
//                   //                     borderRadius:
//                   //                         BorderRadius.circular(30.0)),
//                   //                 color: Color(0xff0093ED),
//                   //                 onPressed: () {
//                   //                   // Navigator.of(
//                   //                   //         context)
//                   //                   //     .pushReplacement(
//                   //                   //         MaterialPageRoute(builder: (context) => CatalogPage2()));
//                   //                 },
//                   //                 child: Text('newest',
//                   //                     style: GoogleFonts.montserrat(
//                   //                         //color: Colors.red,
//                   //                         color: Color(0xffffffff),
//                   //                         fontSize: 12,
//                   //                         fontWeight: FontWeight.w700))),
//                   //           ),
//                   //         ],
//                   //       ),
//                   //     ],
//                   //   ),
//                   // ),
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.only(top: 0, right: 228, left: 20),
//                 child: Text(
//                   'Pack 1 Name',
//                   style: GoogleFonts.poppins(
//                       color: Color(0xff00253A),
//                       fontSize: 18,
//                       fontWeight: FontWeight.w700),
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.only(top: 7, right: 278, left: 20),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: <Widget>[
//                     Padding(
//                       padding: const EdgeInsets.only(
//                         left: 3,
//                       ),
//                     ),
//                     Text('€15',
//                         style: GoogleFonts.poppins(
//                             //color: Colors.red,
//                             color: Color(0xff333333),
//                             fontSize: 14,
//                             fontWeight: FontWeight.w500)),
//                     Text('€12',
//                         style: GoogleFonts.poppins(
//                             //color: Colors.red,
//                             color: Color(0xff0093ED),
//                             fontSize: 24,
//                             fontWeight: FontWeight.w700)),
//                   ],
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.only(top: 27, left: 30),
//                 child: Row(
//                   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: <Widget>[
//                     // Padding(
//                     //   padding: const EdgeInsets.only(
//                     //     left: 3,
//                     //   ),
//                     // ),
//                     Text('You might also like',
//                         style: GoogleFonts.poppins(
//                             //color: Colors.red,
//                             color: Color(0xff333333),
//                             fontSize: 18,
//                             fontWeight: FontWeight.w700)),
//                     Padding(
//                       padding: EdgeInsets.only(left: 100, right: 20),
//                     ),
//                     Image.asset(
//                       'assets/images/Group(6).png',
//                       height: 36,
//                       width: 36,
//                       // width: MediaQuery.of(context).size.width * 0.94,
//                       // height: MediaQuery.of(context).size.height * 0.14,
//                     ), // <-- SEE HERE
//                   ],
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.only(top: 27, left: 20, right: 22),
//                 child: Divider(
//                   thickness: 0,
//                   color: Color(0xff0093ED),
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.only(top: 20, left: 30, right: 20),
//                 child: Row(
//                   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: <Widget>[
//                     // Padding(
//                     //   padding: const EdgeInsets.only(
//                     //     left: 3,
//                     //   ),
//                     // ),
//                     Text('Total:',
//                         style: GoogleFonts.poppins(
//                             //color: Colors.red,
//                             color: Color(0xff00253A),
//                             fontSize: 18,
//                             fontWeight: FontWeight.w700)),
//                     Padding(
//                       padding: EdgeInsets.only(left: 239),
//                     ),
//                     Text('€12',
//                         style: GoogleFonts.poppins(
//                             //color: Colors.red,
//                             color: Color(0xff0093ED),
//                             fontSize: 24,
//                             fontWeight: FontWeight.w700)),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(
//                   top: 30,
//                 ),
//               ),
//               Container(
//                 constraints: BoxConstraints(maxWidth: 360.0, minHeight: 60.0),
//                 margin: EdgeInsets.all(25),
//                 child: RaisedButton(
//                   onPressed: () {
//                     Navigator.of(context).push(
//                         MaterialPageRoute(builder: (context) => CheckOutOne()));
//                   },
//                   color: const Color(0xff0093ED),
//                   child: Container(
//                     alignment: Alignment.center,
//                     padding: const EdgeInsets.only(left: 60),
//                     child: Row(
//                       //mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: <Widget>[
//                         Text(
//                           'Proceed to a checkout',
//                           style: GoogleFonts.poppins(
//                               color: Color(0xfffffffff),
//                               fontSize: 14,
//                               fontWeight: FontWeight.w600),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 20, top: 20),
//                         ),
//                         // Icon(
//                         //   Icons.arrow_forward,
//                         //   color: Colors.white,
//                         // )
//                       ],
//                     ),
//                   ),
//                 ),
//               ),

//               //
//             ])));

//     // _navigateRegistration() {
//     //   Navigator.push(
//     //       context, MaterialPageRoute(builder: (context) => LoginPage()));
//     // }
//   }
// }

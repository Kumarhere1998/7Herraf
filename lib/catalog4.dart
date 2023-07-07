// TODO Implement this library.// ignore_for_file: prefer_const_constructors, unnecessary_new, implementation_imports

// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CatalogPage4 extends StatefulWidget {
  const CatalogPage4({Key? key}) : super(key: key);

  @override
  State<CatalogPage4> createState() => _CatalogPage4State();
}

class _CatalogPage4State extends State<CatalogPage4> {
  final GlobalKey webViewKey = GlobalKey();

  //final GlobalKey<ScaffoldState> _key = GlobalKey();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  // void register(){
  //   ApiService.login(_data).then((value)  {

  //   });

  @override
  Widget build(BuildContext context) {
    var imageFile;
    return Scaffold(
        backgroundColor: Color(0xffE5E5E5),
        body: SingleChildScrollView(
            padding: const EdgeInsets.only(
              top: 10,
            ),
            child: Column(children: [
              Container(
                padding: const EdgeInsets.only(top: 28),
                margin: new EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                alignment: Alignment.centerLeft,
                child: Row(children: <Widget>[
                  InkWell(
                    onTap: (() {}),
                    child: Image.asset(
                      'assets/images/Frame(5).png',
                      height: 32,
                      width: 32,
                      // width: MediaQuery.of(context).size.width * 0.94,
                      // height: MediaQuery.of(context).size.height * 0.14,
                    ), // <-- SEE
                  ),
                  Padding(padding: const EdgeInsets.only(right: 5)),
                  InkWell(
                    onTap: (() {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => MyCoursePage()),
                      // );
                    }),
                    child: Text(
                      "Cart (0)",
                      style: GoogleFonts.poppins(
                          color: Color(0xff0093ED),
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ]),
              ),
              Container(
                padding: EdgeInsets.only(top: 27, right: 70),
                child: Text(
                  'Your cart is empty',
                  style: GoogleFonts.poppins(
                      color: Color(0xff828282),
                      fontSize: 23,
                      fontWeight: FontWeight.w500),
                ),
              ),
              // Container(
              //   padding: EdgeInsets.only(top: 30, right: 155),
              //   child: SizedBox(
              //     width: 210,
              //     height: 300,
              //     child: Card(
              //       margin: EdgeInsets.all(10),
              //       color: Color(0xffF1F6FF),
              //       //shadowColor: Colors.blueGrey,
              //       elevation: 0,
              //       child: Column(
              //         mainAxisAlignment:
              //             MainAxisAlignment.start, //change here don't //worked
              //         crossAxisAlignment: CrossAxisAlignment.center,
              //         children: <Widget>[
              //           Container(
              //             // margin: new EdgeInsets
              //             //         .symmetric(
              //             //     horizontal: 7.0,
              //             //     vertical: 3),
              //             alignment: Alignment.topRight,
              //             child: Container(
              //                 width: 50.0,
              //                 height: 50.0,
              //                 child: Icon(
              //                   Icons.delete,
              //                   color: Color(0xff000000),
              //                   size: 32,
              //                 )
              //                 // decoration: BoxDecoration(
              //                 //   color: Color(0xffB6E1F3),
              //                 //   image: DecorationImage(
              //                 //       image: AssetImage(
              //                 //           'assets/images/Vector(51).png'),
              //                 //       fit: BoxFit.cover),
              //                 //   borderRadius:
              //                 //       BorderRadius.all(Radius.circular(0.0)),
              //                 //   // ignore: prefer_const_literals_to_create_immutables
              //                 //   // boxShadow: [
              //                 //   //   BoxShadow(blurRadius: 7.0, color: Colors.black)
              //                 //   // ]
              //                 // ),
              //                 ),
              //           ),
              //           Padding(
              //             padding: EdgeInsets.only(top: 180, right: 0),
              //           ),
              //           Row(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: <Widget>[
              //               Container(
              //                 margin: new EdgeInsets.symmetric(
              //                     horizontal: 11.0, vertical: 0),
              //                 alignment: Alignment.centerLeft,
              //                 child: FlatButton(
              //                     height: 36,
              //                     minWidth: 100,
              //                     materialTapTargetSize:
              //                         MaterialTapTargetSize.shrinkWrap,
              //                     shape: RoundedRectangleBorder(
              //                         borderRadius:
              //                             BorderRadius.circular(30.0)),
              //                     color: Color(0xff0093ED),
              //                     onPressed: () {
              //                       // Navigator.of(
              //                       //         context)
              //                       //     .pushReplacement(
              //                       //         MaterialPageRoute(builder: (context) => CatalogPage2()));
              //                     },
              //                     child: Text('newest',
              //                         style: GoogleFonts.montserrat(
              //                             //color: Colors.red,
              //                             color: Color(0xffffffff),
              //                             fontSize: 12,
              //                             fontWeight: FontWeight.w700))),
              //               ),
              //             ],
              //           ),
              //         ],
              //       ),
              //       // child: Column(
              //       //   mainAxisSize: MainAxisSize.min,
              //       //   children: <Widget>[
              //       //     Column(
              //       //       children: <Widget>[
              //       //         Container(
              //       //           padding: EdgeInsets.only(
              //       //             top: 220,
              //       //           ),
              //       //           margin: new EdgeInsets.symmetric(
              //       //               horizontal: 7.0, vertical: 3),
              //       //           alignment: Alignment.centerLeft,
              //       //           child: FlatButton(
              //       //               height: 36,
              //       //               minWidth: 100,
              //       //               materialTapTargetSize:
              //       //                   MaterialTapTargetSize.shrinkWrap,
              //       //               shape: RoundedRectangleBorder(
              //       //                   borderRadius:
              //       //                       BorderRadius.circular(30.0)),
              //       //               color: Color(0xff0093ED),
              //       //               onPressed: () {
              //       //                 // Navigator.of(context)
              //       //                 //     .pushReplacement(
              //       //                 //         MaterialPageRoute(
              //       //                 //             builder: (context) =>
              //       //                 //                 ShoppingBag()));
              //       //               },
              //       //               child: Text(
              //       //                 'newest',
              //       //                 style: GoogleFonts.poppins(
              //       //                     color: Color(0xffffffff),
              //       //                     fontSize: 14,
              //       //                     fontWeight: FontWeight.w700),
              //       //               )),
              //       //         ),
              //       //       ],
              //       //     )
              //     ),
              //),
              // ),
              Container(
                padding: EdgeInsets.only(top: 257, right: 71),
                child: Text(
                  'Recommended for you',
                  style: GoogleFonts.poppins(
                      color: Color(0xff00253A),
                      fontSize: 23,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 7, right: 83),
                child: Text(
                  'offered  when bought together with \nflashcards',
                  style: GoogleFonts.poppins(
                      color: Color(0xff828282),
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20.0, right: 20, top: 10),
                width: 390,
                height: 110,
                child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0),
                      side: BorderSide(
                        color: Color(0x33686565),
                      ),
                    ),
                    color: Color(0xffE5E5E5),
                    child: Column(children: [
                      Container(
                        padding: EdgeInsets.only(top: 9, left: 18),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            // Padding(
                            //   padding: const EdgeInsets.only(
                            //     left: 3,
                            //   ),
                            // ),
                            Text('Assistance',
                                style: GoogleFonts.poppins(
                                    //color: Colors.red,
                                    color: Color(0xff333333),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700)),
                            Padding(
                              padding: EdgeInsets.only(left: 175),
                            ),
                            Image.asset(
                              'assets/images/Group(7).png',
                              height: 36,
                              width: 36,
                              // width: MediaQuery.of(context).size.width * 0.94,
                              // height: MediaQuery.of(context).size.height * 0.14,
                            ), // <-- SEE
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 225),
                        child: Text(
                          '€8/hour',
                          style: GoogleFonts.poppins(
                              //color: Colors.red,
                              color: Color(0xff0093ED),
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ])),
              ),
              Container(
                padding: EdgeInsets.only(left: 20.0, right: 20, top: 20),
                width: 390,
                height: 120,
                child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0),
                      side: BorderSide(
                        color: Color(0x33686565),
                      ),
                    ),
                    color: Color(0xffE5E5E5),
                    child: Column(children: [
                      Container(
                        padding: EdgeInsets.only(top: 9, left: 18),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            // Padding(
                            //   padding: const EdgeInsets.only(
                            //     left: 3,
                            //   ),
                            // ),
                            Text('Online course',
                                style: GoogleFonts.poppins(
                                    //color: Colors.red,
                                    color: Color(0xff333333),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700)),
                            Padding(
                              padding: EdgeInsets.only(left: 155),
                            ),
                            Image.asset(
                              'assets/images/Group(7).png',
                              height: 36,
                              width: 36,
                              // width: MediaQuery.of(context).size.width * 0.94,
                              // height: MediaQuery.of(context).size.height * 0.14,
                            ), // <-- SEE
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 80),
                        child: Text(
                          '50% off when bought together \nwith a flash cards.',
                          style: GoogleFonts.poppins(
                              //color: Colors.red,
                              color: Color(0xff686565),
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ])),
              ),

              //
            ])));

    // _navigateRegistration() {
    //   Navigator.push(
    //       context, MaterialPageRoute(builder: (context) => LoginPage()));
    // }
  }
}

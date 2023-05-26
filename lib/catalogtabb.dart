// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:herraf_app/catalog2.dart';
import 'package:http/http.dart' as http;

class Downmember extends StatefulWidget {
  const Downmember({Key? key}) : super(key: key);

  @override
  State<Downmember> createState() => _DownmemberState();
}

class _DownmemberState extends State<Downmember> {
  List<dynamic> allMemberData = [];
  List<dynamic> conectData = [];

  @override
  void initState() {
    super.initState();
  }

  bool isLoading = true;
  bool isLoading3 = true;

  @override
  Widget build(BuildContext context) {
    var imageFile;
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              // ignore: prefer_const_constructors
              bottom: TabBar(
                  padding: const EdgeInsets.only(
                    bottom: 30,
                  ),
                  unselectedLabelColor: Color(0x99343434),
                  labelColor: Color(0xff267693),
                  indicatorColor: Color(0xff267693),
                  indicatorSize: TabBarIndicatorSize.tab,
                  // indicator: BoxDecoration(
                  //     gradient: LinearGradient(
                  //         colors: const [Colors.blue, Colors.blue]),
                  //     borderRadius: BorderRadius.circular(50),
                  //     color: Colors.redAccent),
                  tabs: [
                    Tab(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "All",
                          style: GoogleFonts.poppins(
                              // color: Color(0xff0093ED),
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    Tab(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "My flashcards",
                          style: GoogleFonts.poppins(
                              // color: Color(0xff0093ED),
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                          //   ),
                        ),
                      ),
                    ),
                  ]),
            ),
            body: Container(
              child: TabBarView(children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 40),
                  height: MediaQuery.of(context).size.height * 0.95,
                  width: MediaQuery.of(context).size.height * 0.95,
                  child: ListView.builder(
                    itemCount: 50,
                    itemBuilder: (context, index) {
                      return Container(
                          height: 590,
                          width: 200,
                          child: Card(
                              color: Color(0xffE5E5E5),
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(0)),
                              ),
                              child: Column(children: <Widget>[
                                Stack(
                                  children: [
                                    Container(
                                      width: 438.0,
                                      height: 300.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xffB6E1F3),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/Rectangle.png'),
                                            fit: BoxFit.cover),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(0.0)),
                                        // ignore: prefer_const_literals_to_create_immutables
                                        // boxShadow: [
                                        //   BoxShadow(blurRadius: 7.0, color: Colors.black)
                                        // ]
                                      ),
                                    ),
                                    Positioned(
                                      // The Positioned widget is used to position the text inside the Stack widget
                                      // bottom: 80,
                                      // right: 85,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment
                                            .start, //change here don't //worked
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Container(
                                              // margin: new EdgeInsets
                                              //         .symmetric(
                                              //     horizontal: 7.0,
                                              //     vertical: 3),
                                              alignment: Alignment.topRight,
                                              child: Text("")
                                              //  FlatButton(
                                              //     height: 36,
                                              //     minWidth: 100,
                                              //     materialTapTargetSize:
                                              //         MaterialTapTargetSize
                                              //             .shrinkWrap,
                                              //     shape: RoundedRectangleBorder(
                                              //         borderRadius:
                                              //             BorderRadius.circular(
                                              //                 0.0)),
                                              //     color: Color(0xff000000),
                                              //     onPressed: () {
                                              //       // Navigator.of(context)
                                              //       //     .pushReplacement(
                                              //       //         MaterialPageRoute(
                                              //       //             builder: (context) =>
                                              //       //                 ShoppingBag()));
                                              //     },
                                              //     child: Text('20 off',
                                              //         style:
                                              //             GoogleFonts.montserrat(
                                              //                 //color: Colors.red,
                                              //                 color: Color(
                                              //                     0xffffffff),
                                              //                 fontSize: 12,
                                              //                 fontWeight:
                                              //                     FontWeight
                                              //                         .w700))),
                                              ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 180, right: 0),
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Container(
                                                  margin:
                                                      new EdgeInsets.symmetric(
                                                          horizontal: 11.0,
                                                          vertical: 0),
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text("")
                                                  //  FlatButton(
                                                  //     height: 36,
                                                  //     minWidth: 100,
                                                  //     materialTapTargetSize:
                                                  //         MaterialTapTargetSize
                                                  //             .shrinkWrap,
                                                  //     shape:
                                                  //         RoundedRectangleBorder(
                                                  //             borderRadius:
                                                  //                 BorderRadius
                                                  //                     .circular(
                                                  //                         30.0)),
                                                  //     color: Color(0xff0093ED),
                                                  //     onPressed: () {
                                                  //       // Navigator.of(
                                                  //       //         context)
                                                  //       //     .pushReplacement(
                                                  //       //         MaterialPageRoute(builder: (context) => CatalogPage2()));
                                                  //     },
                                                  //     child: Text('newest',
                                                  //         style: GoogleFonts
                                                  //             .montserrat(
                                                  //                 //color: Colors.red,
                                                  //                 color: Color(
                                                  //                     0xffffffff),
                                                  //                 fontSize: 12,
                                                  //                 fontWeight:
                                                  //                     FontWeight
                                                  //                         .w700))),
                                                  ),
                                              Container(
                                                  margin:
                                                      new EdgeInsets.symmetric(
                                                          horizontal: 7.0,
                                                          vertical: 3),
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text("")
                                                  // FlatButton(
                                                  //     height: 36,
                                                  //     minWidth: 100,
                                                  //     materialTapTargetSize:
                                                  //         MaterialTapTargetSize
                                                  //             .shrinkWrap,
                                                  //     shape:
                                                  //         RoundedRectangleBorder(
                                                  //             borderRadius:
                                                  //                 BorderRadius
                                                  //                     .circular(
                                                  //                         30.0)),
                                                  //     color: Color(0xff0093ED),
                                                  //     onPressed: () {
                                                  //       // Navigator.of(context)
                                                  //       //     .pushReplacement(
                                                  //       //         MaterialPageRoute(
                                                  //       //             builder: (context) =>
                                                  //       //                 ShoppingBag()));
                                                  //     },
                                                  //     child: Text('cardio',
                                                  //         style: GoogleFonts
                                                  //             .montserrat(
                                                  //                 //color: Colors.red,
                                                  //                 color: Color(
                                                  //                     0xffffffff),
                                                  //                 fontSize: 12,
                                                  //                 fontWeight:
                                                  //                     FontWeight
                                                  //                         .w700))),
                                                  ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text('Pack 1 Name',
                                        style: GoogleFonts.montserrat(
                                            //color: Colors.red,
                                            color: Color(0xff00253A),
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700)),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 3,
                                      ),
                                    ),
                                    Text('€15',
                                        style: GoogleFonts.montserrat(
                                            //color: Colors.red,
                                            color: Color(0xff333333),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500)),
                                    Text('€12',
                                        style: GoogleFonts.montserrat(
                                            //color: Colors.red,
                                            color: Color(0xff0093ED),
                                            fontSize: 24,
                                            fontWeight: FontWeight.w700)),
                                  ],
                                ),
                                Row(children: <Widget>[
                                  Container(
                                    //margin: new EdgeInsets.symmetric(horizontal: 19),
                                    padding: const EdgeInsets.only(
                                      top: 10,
                                    ),
                                    child: Text(
                                      "Topics",
                                      style: GoogleFonts.poppins(
                                        color: Color(0xff6B6665),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ]),
                                Container(
                                  //margin: new EdgeInsets.symmetric(horizontal: 19),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 0, vertical: 5),
                                  child: Text(
                                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ",
                                    style: GoogleFonts.poppins(
                                      color: Color(0xffB6E1F4),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    //textAlign: TextAlign.left,
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                                Container(
                                  // padding: EdgeInsets.only(top: 10),
                                  // decoration: BoxDecoration(
                                  //     borderRadius: BorderRadius.circular(15.0),
                                  //     color: Colors.blue),
                                  padding: const EdgeInsets.only(
                                      top: 10.0, right: 219),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        // FlatButton(
                                        //   minWidth: 120.0,
                                        //   height: 47,
                                        //   onPressed: () {
                                        //     Navigator.of(context)
                                        //         .pushReplacement(
                                        //             MaterialPageRoute(
                                        //                 builder: (context) =>
                                        //                     CatalogPage2()));
                                        //   },
                                        //   child: Text(
                                        //     'Add to cart',
                                        //     // ignore: prefer_const_constructors, unnecessary_new
                                        //     style: GoogleFonts.poppins(
                                        //         color: Color(0xff0093ED),
                                        //         fontSize: 14,
                                        //         fontWeight: FontWeight.w600),
                                        //   ),
                                        //   textColor: Color(0xff0093ED),
                                        //   shape: RoundedRectangleBorder(
                                        //       side: BorderSide(
                                        //           color: Color(0xff0093ED),
                                        //           width: 2,
                                        //           style: BorderStyle.solid),
                                        //       borderRadius:
                                        //           BorderRadius.circular(0)),
                                        // ),

                                        //             // use the email provided here
                                        //           )
                                        //         ])),
                                      ]),
                                )
                              ])));
                    },
                  ),
                ),
                Container(
                  child:
                      //isLoading3
                      //     ? Center(child: CircularProgressIndicator())
                      //     :
                      ListView.builder(
                    itemCount: 50,
                    itemBuilder: (context, index) {
                      return Container(
                          height: 490,
                          width: 220,
                          child: Card(
                              color: Color(0xffE5E5E5),
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(0)),
                              ),
                              child: Column(children: <Widget>[
                                Stack(
                                  children: [
                                    Container(
                                      width: 400.0,
                                      height: 300.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xffB6E1F3),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/Rectangle.png'),
                                            fit: BoxFit.cover),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(0.0)),
                                        // ignore: prefer_const_literals_to_create_immutables
                                        // boxShadow: [
                                        //   BoxShadow(blurRadius: 7.0, color: Colors.black)
                                        // ]
                                      ),
                                    ),
                                    Positioned(
                                      // The Positioned widget is used to position the text inside the Stack widget
                                      // bottom: 80,
                                      // right: 85,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment
                                            .start, //change here don't //worked
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Container(
                                              // margin: new EdgeInsets
                                              //         .symmetric(
                                              //     horizontal: 7.0,
                                              //     vertical: 3),
                                              alignment: Alignment.topRight,
                                              child: Text("")
                                              // FlatButton(
                                              //     height: 36,
                                              //     minWidth: 100,
                                              //     materialTapTargetSize:
                                              //         MaterialTapTargetSize
                                              //             .shrinkWrap,
                                              //     shape: RoundedRectangleBorder(
                                              //         borderRadius:
                                              //             BorderRadius.circular(
                                              //                 0.0)),
                                              //     color: Color(0xff000000),
                                              //     onPressed: () {
                                              //       // Navigator.of(context)
                                              //       //     .pushReplacement(
                                              //       //         MaterialPageRoute(
                                              //       //             builder: (context) =>
                                              //       //                 ShoppingBag()));
                                              //     },
                                              //     child: Text('20 off',
                                              //         style:
                                              //             GoogleFonts.montserrat(
                                              //                 //color: Colors.red,
                                              //                 color: Color(
                                              //                     0xffffffff),
                                              //                 fontSize: 12,
                                              //                 fontWeight:
                                              //                     FontWeight
                                              //                         .w700))),
                                              ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 180, right: 0),
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Container(
                                                  margin:
                                                      new EdgeInsets.symmetric(
                                                          horizontal: 11.0,
                                                          vertical: 0),
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text("")
                                                  //  FlatButton(
                                                  //     height: 36,
                                                  //     minWidth: 100,
                                                  //     materialTapTargetSize:
                                                  //         MaterialTapTargetSize
                                                  //             .shrinkWrap,
                                                  //     shape:
                                                  //         RoundedRectangleBorder(
                                                  //             borderRadius:
                                                  //                 BorderRadius
                                                  //                     .circular(
                                                  //                         30.0)),
                                                  //     color: Color(0xff0093ED),
                                                  //     onPressed: () {
                                                  //       // Navigator.of(
                                                  //       //         context)
                                                  //       //     .pushReplacement(
                                                  //       //         MaterialPageRoute(builder: (context) => CatalogPage2()));
                                                  //     },
                                                  //     child: Text('newest',
                                                  //         style: GoogleFonts
                                                  //             .montserrat(
                                                  //                 //color: Colors.red,
                                                  //                 color: Color(
                                                  //                     0xffffffff),
                                                  //                 fontSize: 12,
                                                  //                 fontWeight:
                                                  //                     FontWeight
                                                  //                         .w700))),
                                                  ),
                                              Container(
                                                  margin:
                                                      new EdgeInsets.symmetric(
                                                          horizontal: 7.0,
                                                          vertical: 3),
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text("")
                                                  //  FlatButton(
                                                  //     height: 36,
                                                  //     minWidth: 100,
                                                  //     materialTapTargetSize:
                                                  //         MaterialTapTargetSize
                                                  //             .shrinkWrap,
                                                  //     shape:
                                                  //         RoundedRectangleBorder(
                                                  //             borderRadius:
                                                  //                 BorderRadius
                                                  //                     .circular(
                                                  //                         30.0)),
                                                  //     color: Color(0xff0093ED),
                                                  //     onPressed: () {
                                                  //       // Navigator.of(context)
                                                  //       //     .pushReplacement(
                                                  //       //         MaterialPageRoute(
                                                  //       //             builder: (context) =>
                                                  //       //                 ShoppingBag()));
                                                  //     },
                                                  //     child: Text('cardio',
                                                  //         style: GoogleFonts
                                                  //             .montserrat(
                                                  //                 //color: Colors.red,
                                                  //                 color: Color(
                                                  //                     0xffffffff),
                                                  //                 fontSize: 12,
                                                  //                 fontWeight:
                                                  //                     FontWeight
                                                  //                         .w700))),
                                                  ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text('Pack 1 Name',
                                        style: GoogleFonts.montserrat(
                                            //color: Colors.red,
                                            color: Color(0xff00253A),
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700)),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 3,
                                      ),
                                    ),
                                    Text('€15',
                                        style: GoogleFonts.montserrat(
                                            //color: Colors.red,
                                            color: Color(0xff333333),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500)),
                                    Text('€12',
                                        style: GoogleFonts.montserrat(
                                            //color: Colors.red,
                                            color: Color(0xff0093ED),
                                            fontSize: 24,
                                            fontWeight: FontWeight.w700)),
                                  ],
                                ),
                                Container(
                                  // padding: EdgeInsets.only(top: 10),
                                  // decoration: BoxDecoration(
                                  //     borderRadius: BorderRadius.circular(15.0),
                                  //     color: Colors.blue),
                                  padding: const EdgeInsets.only(
                                      top: 75.0, right: 190),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        // FlatButton(
                                        //   minWidth: 120.0,
                                        //   height: 47,
                                        //   onPressed: () {
                                        //     Navigator.of(context)
                                        //         .pushReplacement(
                                        //             MaterialPageRoute(
                                        //                 builder: (context) =>
                                        //                     CatalogPage2()));
                                        //   },
                                        //   child: Text(
                                        //     'Add to cart',
                                        //     // ignore: prefer_const_constructors, unnecessary_new
                                        //     style: GoogleFonts.poppins(
                                        //         color: Color(0xff0093ED),
                                        //         fontSize: 14,
                                        //         fontWeight: FontWeight.w600),
                                        //   ),
                                        //   textColor: Color(0xff0093ED),
                                        //   shape: RoundedRectangleBorder(
                                        //       side: BorderSide(
                                        //           color: Color(0xff0093ED),
                                        //           width: 2,
                                        //           style: BorderStyle.solid),
                                        //       borderRadius:
                                        //           BorderRadius.circular(0)),
                                        // ),

                                        //             // use the email provided here
                                        //           )
                                        //         ])),
                                      ]),
                                )
                              ])));
                    },
                  ),
                ),
              ]),
            )));
  }
}

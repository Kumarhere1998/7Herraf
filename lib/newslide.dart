import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:herraf_app/bottomNavBar.dart';
import 'package:herraf_app/bottomtab.dart';
import 'package:herraf_app/catalog.dart';

import 'package:herraf_app/newcatalog.dart';
import 'package:herraf_app/newhome.dart';
import 'package:herraf_app/newslide1.dart';

class HomePageMain extends StatefulWidget {
  @override
  _HomePageMainState createState() => _HomePageMainState();
}

class _HomePageMainState extends State<HomePageMain> {
  late PageController _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xffDADADA),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          PageView(
            onPageChanged: (int page) {
              setState(() {
                currentIndex = page;
              });
            },
            controller: _pageController,
            children: <Widget>[
              Container(
                  child: Column(children: [
                SizedBox(
                  child: Stack(
                      alignment: Alignment.topCenter,
                      clipBehavior: Clip.none,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.30,
                          width: double.infinity,
                          child: Image.asset(
                              "assets/images/background-top(2).png"),
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.height * 0.115,
                          child: Container(
                              alignment: Alignment.center,
                              height: MediaQuery.of(context).size.height * 0.25,
                              width: MediaQuery.of(context).size.width * 0.533,
                              child: Image.asset("assets/images/Group1.png")),
                        ),
                      ]),
                ),
                Container(
                  margin: new EdgeInsets.only(
                    top: 60,
                  ),
                  padding: new EdgeInsets.symmetric(
                    horizontal: 30.0,
                  ),
                  child:
                      // alignment: Alignment.centerLeft,

                      Text(
                    "Rediscover the pleasure of learning medicine!",
                    style: GoogleFonts.poppins(
                        color: Color(0xff212121),
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  margin: new EdgeInsets.only(
                    top: 10,
                  ),
                  padding: new EdgeInsets.symmetric(
                    horizontal: 30.0,
                  ),
                  child:
                      // alignment: Alignment.centerLeft,

                      Text(
                    "Learning has never been as fun as before. Improve your medical knowledge in a pain-free way.",
                    style: GoogleFonts.poppins(
                        color: Color(0xff6C6363),
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 260,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //  Padding(padding: new EdgeInsets.only(left: 12, right: 12)),
                    InkWell(
                        onTap: () {
                          setState(() {
                            currentIndex = 2;
                            // _pageController.animateToPage(2);
                            _pageController.animateToPage(2,
                                duration: Duration(milliseconds: 100),
                                curve: Curves.bounceInOut);
                            //_pageController.jumpTo(2);
                          });
                        },
                        child: Container(
                          margin: new EdgeInsets.symmetric(
                              horizontal: 4.0, vertical: 4),
                          alignment: Alignment.center,
                          height: 56,
                          width: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            // color: Color(0xffDADADA),
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                          //  color: Color(0xff267693),
                          child: Text(
                            "Skip",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                color: Color(0xffB0A9A9),
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 5,
                        right: 5,
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          setState(() {
                            currentIndex = 2;
                            // _pageController.animateToPage(2);
                            _pageController.animateToPage(1,
                                duration: Duration(milliseconds: 100),
                                curve: Curves.bounceInOut);
                            //_pageController.jumpTo(2);
                          });
                        },
                        child: Container(
                          margin: new EdgeInsets.symmetric(
                              horizontal: 4.0, vertical: 4),
                          alignment: Alignment.center,
                          height: 56,
                          width: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Color(0xffCE8C8C),
                          ),
                          //  color: Color(0xff267693),
                          child: Text(
                            "Next",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                color: Color(0xffffffff),
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        )),
                  ],
                )
              ])),
              Container(
                  child: Column(children: [
                SizedBox(
                  child: Stack(
                      alignment: Alignment.topCenter,
                      clipBehavior: Clip.none,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.30,
                          width: double.infinity,
                          child: Image.asset(
                              "assets/images/background-top(2).png"),
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.height * 0.115,
                          child: Container(
                              alignment: Alignment.center,
                              height: MediaQuery.of(context).size.height * 0.25,
                              width: MediaQuery.of(context).size.width * 0.75,
                              child: Image.asset("assets/images/Group.png")),
                        ),
                      ]),
                ),
                Container(
                  margin: new EdgeInsets.only(
                    top: 70,
                  ),
                  padding: new EdgeInsets.symmetric(
                    horizontal: 30.0,
                  ),
                  child: Text(
                    "Memorize better",
                    style: GoogleFonts.poppins(
                        color: Color(0xff212121),
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  margin: new EdgeInsets.only(
                    top: 5,
                  ),
                  padding: new EdgeInsets.symmetric(
                    horizontal: 30.0,
                  ),
                  child: Text(
                    "Practically confirmed positive impact on your ability to memorize more information in less time.",
                    style: GoogleFonts.poppins(
                        color: Color(0xff6C6363),
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 280,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //  Padding(padding: new EdgeInsets.only(left: 12, right: 12)),
                    InkWell(
                        onTap: () {
                          setState(() {
                            currentIndex = 2;
                            // _pageController.animateToPage(2);
                            _pageController.animateToPage(2,
                                duration: Duration(milliseconds: 100),
                                curve: Curves.bounceInOut);
                            //_pageController.jumpTo(2);
                          });
                        },
                        child: Container(
                          margin: new EdgeInsets.symmetric(
                              horizontal: 4.0, vertical: 4),
                          alignment: Alignment.center,
                          height: 56,
                          width: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Color(0xffDADADA),
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                          //  color: Color(0xff267693),
                          child: Text(
                            "Skip",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                color: Color(0xffB0A9A9),
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 5,
                        right: 5,
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          setState(() {
                            currentIndex = 2;
                            _pageController.animateToPage(2,
                                duration: Duration(milliseconds: 100),
                                curve: Curves.bounceInOut);
                          });
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => HomePageMain()),
                          // );
                        },
                        child: Container(
                          margin: new EdgeInsets.symmetric(
                              horizontal: 4.0, vertical: 4),
                          alignment: Alignment.center,
                          height: 56,
                          width: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Color(0xffCE8C8C),
                          ),
                          //  color: Color(0xff267693),
                          child: Text(
                            "Next",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                color: Color(0xffffffff),
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        )),
                  ],
                )
              ])),
              Container(
                  child: Column(children: [
                SizedBox(
                  child: Stack(
                      alignment: Alignment.topCenter,
                      clipBehavior: Clip.none,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.30,
                          width: double.infinity,
                          child: Image.asset(
                              "assets/images/background-top(2).png"),
                        ),
                        Positioned(
                            top: MediaQuery.of(context).size.height * 0.11,
                            child: Column(
                              children: <Widget>[
                                Container(
                                    alignment: Alignment.center,
                                    height: MediaQuery.of(context).size.height *
                                        0.30,
                                    width: MediaQuery.of(context).size.width *
                                        0.80,
                                    child:
                                        Image.asset("assets/images/yes.png")),
                              ],
                            )),
                      ]),
                ),
                Container(
                  margin: new EdgeInsets.only(
                    top: 100,
                  ),
                  padding: new EdgeInsets.symmetric(
                    horizontal: 30.0,
                  ),
                  child:
                      // alignment: Alignment.centerLeft,

                      Text(
                    "Flashcards",
                    style: GoogleFonts.poppins(
                        color: Color(0xff212121),
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  margin: new EdgeInsets.only(
                    top: 10,
                  ),
                  padding: new EdgeInsets.symmetric(
                    horizontal: 30.0,
                  ),
                  child:
                      // alignment: Alignment.centerLeft,

                      Text(
                    "This cards are available only physically. Buy at least one pack to be able to apply learned material when playing.",
                    style: GoogleFonts.poppins(
                        color: Color(0xff6C6363),
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 170,
                  ),
                ),
                InkWell(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => Home(2)),
                      // );
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BottomNav(2)),
                      );
                    },
                    child: Container(
                      margin: new EdgeInsets.symmetric(
                          horizontal: 4.0, vertical: 4),
                      alignment: Alignment.center,
                      height: 56,
                      width: 330,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xffCE8C8C),
                      ),
                      //  color: Color(0xff267693),
                      child: Text(
                        "Buy flashcards",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            color: Color(0xffffffff),
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                  ),
                ),
                InkWell(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => Home(4)),
                      // );
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BottomNav(2)),
                      );
                      //   setState(() {
                      //     showDialog(
                      //         context: context,
                      //         builder: (ctx) => Container(
                      //               height: MediaQuery.of(context).size.height *
                      //                   0.209,
                      //               width:
                      //                   MediaQuery.of(context).size.width * 0.893,
                      //               child: Stack(
                      //                 children: [
                      //                   AlertDialog(
                      //                       shape: const OutlineInputBorder(
                      //                           borderRadius: BorderRadius.all(
                      //                               Radius.circular(20)),
                      //                           borderSide: BorderSide(
                      //                               color: Color(0xffFFFFFF))),
                      //                       backgroundColor:
                      //                           const Color(0xffFAFAFA),
                      //                       content: SizedBox(
                      //                         height: 300,
                      //                         width: 350,
                      //                         child: Column(
                      //                             mainAxisAlignment:
                      //                                 MainAxisAlignment
                      //                                     .spaceBetween,
                      //                             children: [
                      //                               Text(
                      //                                 "Welcome! ",
                      //                                 style: GoogleFonts.poppins(
                      //                                     fontWeight:
                      //                                         FontWeight.w500,
                      //                                     fontSize: 20,
                      //                                     color: const Color(
                      //                                         0xff212121)),
                      //                               ),
                      //                               InkWell(
                      //                                 child: Container(
                      //                                     height: 72,
                      //                                     width: 72,
                      //                                     decoration: const BoxDecoration(
                      //                                         borderRadius:
                      //                                             BorderRadius
                      //                                                 .all(Radius
                      //                                                     .circular(
                      //                                                         60)),
                      //                                         color: Color(
                      //                                             0xffEBE9E9)),
                      //                                     child: const Icon(
                      //                                         Icons.add,
                      //                                         size: 40)),
                      //                                 onTap: () {},
                      //                               ),
                      //                               TextFormField(
                      //                                   keyboardType:
                      //                                       TextInputType.text,
                      //                                   decoration: const InputDecoration(
                      //                                       border: OutlineInputBorder(
                      //                                           borderRadius: BorderRadius
                      //                                               .all(Radius
                      //                                                   .circular(
                      //                                                       24)),
                      //                                           borderSide: BorderSide(
                      //                                               width: 1,
                      //                                               color: Color(
                      //                                                   0xffD7D4D4))))),
                      //                               Row(
                      //                                 mainAxisAlignment:
                      //                                     MainAxisAlignment
                      //                                         .center,
                      //                                 children: [
                      //                                   Container(
                      //                                     decoration: const BoxDecoration(
                      //                                         color: Color(
                      //                                             0xffCE8C8C),
                      //                                         borderRadius:
                      //                                             BorderRadius
                      //                                                 .all(Radius
                      //                                                     .circular(
                      //                                                         32))),
                      //                                     width: 148,
                      //                                     height: 56,
                      //                                     child: TextButton(
                      //                                         onPressed: () {
                      //                                           Navigator.pop(
                      //                                               context);
                      //                                         },
                      //                                         child: Text(
                      //                                           "Save",
                      //                                           style: GoogleFonts.poppins(
                      //                                               fontWeight:
                      //                                                   FontWeight
                      //                                                       .w500,
                      //                                               fontSize: 14,
                      //                                               color: const Color(
                      //                                                   0xffFFFFFF)),
                      //                                         )),
                      //                                   ),
                      //                                 ],
                      //                               )
                      //                             ]),
                      //                       )),
                      //                   Positioned(
                      //                     top:
                      //                         MediaQuery.of(context).size.height *
                      //                             0.270,
                      //                     right:
                      //                         MediaQuery.of(context).size.width *
                      //                             0.082,
                      //                     child: GestureDetector(
                      //                       child: const Icon(
                      //                         Icons.cancel,
                      //                         color: Color(0xffCE8C8C),
                      //                         size: 50,
                      //                       ),
                      //                       onTap: () {
                      //                         Navigator.pop(context);
                      //                       },
                      //                     ),
                      //                   )
                      //                 ],
                      //               ),
                      //             ));
                      //   });
                    },
                    child: Container(
                      margin: new EdgeInsets.symmetric(
                          horizontal: 4.0, vertical: 4),
                      alignment: Alignment.center,
                      height: 56,
                      width: 330,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xffDADADA),
                        border: Border.all(
                          color: Colors.grey,
                          width: 1,
                        ),
                      ),
                      //  color: Color(0xff267693),
                      child: Text(
                        "Finish onboarding",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            color: Color(0xffB0A9A9),
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    )),
              ])),
            ],
          ),
          Container(
            margin: EdgeInsets.only(bottom: 290),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildIndicator(),
            ),
          )
        ],
      ),
    );
  }

  Widget makePage({image, title, content, reverse = false}) {
    return Container(
      padding: EdgeInsets.only(left: 50, right: 50, bottom: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          !reverse
              ? Container(
                  height: 237,
                  width: 164,
                  child: Image.asset(image),
                )
              : SizedBox(),
          Text(
            title,
            style: GoogleFonts.poppins(
                color: Color(0xff212121),
                fontSize: 20,
                fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            content,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
                color: Color(0xff6C6363),
                fontSize: 14,
                fontWeight: FontWeight.w400),
          ),
          reverse
              ? Column(
                  children: <Widget>[
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Image.asset(image),
                    ),
                  ],
                )
              : SizedBox(),
        ],
      ),
    );
  }

  Widget _indicator(bool isActive) {
    margin:
    EdgeInsets.only(bottom: 20);
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 5,
      width: isActive ? 28 : 10,
      margin: EdgeInsets.only(right: 5, top: 290),
      decoration: BoxDecoration(
          color: Color(0xffCE8C8C), borderRadius: BorderRadius.circular(5)),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < 3; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }

    return indicators;
  }
}

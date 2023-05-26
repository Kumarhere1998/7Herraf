// ignore_for_file: prefer_const_constructors, unnecessary_new, avoid_print, library_private_types_in_public_api

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:herraf_app/api_servivce.dart';
import 'package:herraf_app/catalog.dart';
import 'package:herraf_app/newhome.dart';
import 'package:herraf_app/notification.dart';
import 'package:herraf_app/profile3.dart';
import 'package:herraf_app/scan.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class BottomNav extends StatefulWidget {
  const BottomNav(this.pageIndex, {Key? key}) : super(key: key);
  final int pageIndex;

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  final ratingController = TextEditingController();

  int _selectedIndex = 0;
  var rating = 0.0;
  Map reviewData = {};

  _ratingUpdate() async {
    ApiService.updaterating(rating, ratingController.text).then((value) {
      print(value);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(value['message'])));
      if (value['status']) {
        ratingController.clear();
        Navigator.pop(context);
      }
    });
  }

  _appReview() async {
    ApiService.app_review().then((value) {
      // print(value);

      setState(() {
        reviewData = {};
        reviewData = value;
        if (reviewData['status'] == true) {
          print('true');
          SystemNavigator.pop();
        } else {
          print('false');
          showDialog(
              context: context,
              builder: (ctx) => StatefulBuilder(
                    builder: (BuildContext context,
                        void Function(void Function()) setState) {
                      return Container(
                        margin: EdgeInsets.only(top: 200),
                        height: MediaQuery.of(context).size.height * 0.200,
                        width: MediaQuery.of(context).size.width * 9,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AlertDialog(
                              shape: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  borderSide:
                                      BorderSide(color: Color(0xffFFFFFF))),
                              backgroundColor: const Color(0xffFAFAFA),
                              title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "How’s your playing\n expericence?",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20,
                                          color: const Color(0xff212121)),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Column(
                                      children: [
                                        GestureDetector(
                                          child: const Icon(
                                            Icons.cancel,
                                            color: Color(0xffCE8C8C),
                                            size: 30,
                                          ),
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                        SizedBox(
                                          height: 20,
                                        )
                                      ],
                                    ),
                                  ]),
                              content: Column(
                                children: [
                                  RatingBar.builder(
                                    initialRating: 3,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    // allowHalfRating: true,
                                    itemCount: 5,
                                    itemSize: 27,
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Color(0xffCE8C8C),
                                    ),

                                    onRatingUpdate: (value) {
                                      setState(() {
                                        rating = value;
                                        print(rating);
                                      });
                                    },
                                  ),
                                  rating > 0
                                      ? TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Rating :  $rating',
                                            style: TextStyle(
                                              color: Color(0xffCE8C8C),
                                            ),
                                          ),
                                        )
                                      : TextButton(
                                          onPressed: () {
                                            SystemNavigator.pop();
                                          },
                                          child: Text(
                                            'Ask me later',
                                            style: TextStyle(
                                              color: Color(0xffCE8C8C),
                                            ),
                                          ),
                                        ),
                                  rating > 0
                                      ? Container(
                                          child: Column(
                                            children: [
                                              TextFormField(
                                                controller: ratingController,
                                                decoration: InputDecoration(
                                                    hintText:
                                                        "Please give your feedback",
                                                    contentPadding:
                                                        EdgeInsets.only(
                                                            left: 20),
                                                    // border: InputBorder.none,
                                                    focusedBorder:
                                                        InputBorder.none,
                                                    errorBorder:
                                                        InputBorder.none,
                                                    hintStyle: TextStyle(
                                                        color: Colors.black26,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w500)),
                                              ),
                                              FlatButton(
                                                  onPressed: () {
                                                    _ratingUpdate();
                                                  },
                                                  child: Text('Submit'))
                                            ],
                                          ),
                                        )
                                      : Container()
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    // child:
                  ));
          // : SystemNavigator.pop();

        }
        print('REVIEW==>$reviewData');
        // loading = false;
      });
    });
  }

  @override
  void initState() {
    rating;
    // appReview();
    super.initState();

    _selectedIndex = widget.pageIndex;
  }

  List<dynamic> dataItem = [];
  bool userDetails = true;

  _onItemTapped(int index) {
    _selectedIndex = index;
    // print(_selectedIndex);
    setState(() {});
    switch (_selectedIndex) {
      case 0:
        return CatalogPage();

      case 1:
        return Onboarding();

      case 2:
        return HomepageOne();

      case 3:
        return Profile();

      case 4:
        return NotificationPage1();
    }
  }

  Future<bool> _willPopCallback() async {
    if (_selectedIndex != 0) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => BottomNav(2)));
      _appReview();
    }
    // else {
    //   SystemNavigator.pop();
    // }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: _willPopCallback,
        child: Scaffold(
          body: _onItemTapped(_selectedIndex),
          bottomNavigationBar: Stack(
            children: [
              SizedBox(
                height: 70,
                child: BottomNavigationBar(
                  showUnselectedLabels: false,
                  type: BottomNavigationBarType.fixed,
                  currentIndex: _selectedIndex,
                  selectedItemColor: Colors.black,
                  unselectedItemColor: Color.fromARGB(255, 217, 216, 216),
                  backgroundColor: Colors.white,
                  items: [
                    BottomNavigationBarItem(
                      icon: ImageIcon(
                        AssetImage('assets/images/bottom2.png'),
                      ),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: ImageIcon(
                        AssetImage('assets/images/bottom.png'),
                      ),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: Stack(
                        alignment: Alignment.center,
                        children: [
                          ImageIcon(
                            AssetImage('assets/images/BG1.png'),
                            size: 63,
                          ),
                          Positioned(
                            top: 10,
                            child: SizedBox(
                                height: 55,
                                width: 60,
                                child: Image.asset('assets/images/BG2.png')),
                          )
                        ],
                      ),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: ImageIcon(
                        AssetImage('assets/images/bottom4.png'),
                      ),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: ImageIcon(
                        AssetImage('assets/images/bottom3.png'),
                      ),
                      label: '',
                    ),
                  ],
                  onTap: _onItemTapped,
                ),
              ),
            ],
          ),
        ));
  }
}

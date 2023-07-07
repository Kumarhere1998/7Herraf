import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:herraf_app/api_servivce.dart';
import 'package:herraf_app/invite.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Playingcreen extends StatefulWidget {
  @override
  _PlayingcreenState createState() => _PlayingcreenState();
}

class _PlayingcreenState extends State<Playingcreen> {
  int _selection = 0;

  selectTime(dynamic timeSelected) {
    setState(() {
      _selection = timeSelected;
    });
  }

  @override
  void initState() {
    selectpack();
    super.initState();
  }

  Map mypack = {};
  selectpack() async {
    ApiService.selectpack().then((value) {
      print(value);

      setState(() {
        mypack = value["data"];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var radio = Radio(
      focusColor: Colors.white,
      groupValue: _selection,
      onChanged: selectTime,
      value: 1,
    );
    var radio2 = Radio(
      focusColor: Colors.white,
      groupValue: _selection,
      onChanged: selectTime,
      value: 2,
    );
    var radio6 = Radio(
      focusColor: Colors.white,
      groupValue: _selection,
      onChanged: selectTime,
      value: 3,
    );
    var radio3 = radio6;
    var radio4 = Radio(
      focusColor: Colors.white,
      groupValue: _selection,
      onChanged: selectTime,
      value: 4,
    );
    var radio5 = Radio(
      focusColor: Colors.white,
      groupValue: _selection,
      onChanged: selectTime,
      value: 5,
    );

    return Scaffold(
        body: Center(
            child: Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.0001),
                child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          Image.asset("assets/images/background-top(1).png"),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 40, left: 25, right: 25),
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: Row(children: <Widget>[
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Icon(
                                    Icons.arrow_back,
                                    size: 24,
                                    color: Color(0xff212121),
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(left: 8)),
                                Text(
                                  "Select playing pack",
                                  style: GoogleFonts.poppins(
                                      color: Color(0xff212121),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ]),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            //margin: new EdgeInsets.symmetric(horizontal: 19),
                            padding: const EdgeInsets.only(
                              left: 20,
                            ),
                            child: Text(
                              "My packs (3)",
                              style: GoogleFonts.poppins(
                                color: Color(0xff212121),
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                      Container(
                          margin: new EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        _selection = 1;
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    InvitefriendPage()));
                                      });
                                    },
                                    child: Stack(
                                      children: <Widget>[
                                        Container(
                                          height: 148,
                                          width: 160,
                                          color: _selection == 1
                                              ? Color(0xfffffffff)
                                              : Color(0xffF1F6FF),
                                        ),
                                        Column(
                                          children: <Widget>[
                                            Container(
                                              child: Image.asset(
                                                'assets/images/cardd.png',
                                                height: 90,
                                                width: 160,
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  child: radio,
                                                ),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 0),
                                                  child: Text(
                                                    "Pneumo",
                                                    style: GoogleFonts.poppins(
                                                        color:
                                                            Color(0xff544D4D),
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                    textAlign: TextAlign.start,
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        _selection = 2;
                                      });
                                    },
                                    child: Stack(
                                      children: <Widget>[
                                        Container(
                                          height: 148,
                                          width: 160,
                                          color: _selection == 2
                                              ? Color(0xffF1F6FF)
                                              : Color(0xfffffffff),
                                        ),
                                        Column(
                                          children: <Widget>[
                                            Container(
                                              child: Image.asset(
                                                'assets/images/cardd.png',
                                                height: 90,
                                                width: 160,
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  child: radio2,
                                                ),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 0),
                                                  child: Text(
                                                    "Pneumo",
                                                    style: GoogleFonts.poppins(
                                                        color:
                                                            Color(0xff544D4D),
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                    textAlign: TextAlign.start,
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                              ),
                              Row(
                                children: <Widget>[
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        _selection = 3;
                                      });
                                    },
                                    child: Stack(
                                      children: <Widget>[
                                        Container(
                                          height: 148,
                                          width: 160,
                                          color: _selection == 3
                                              ? Color(0xffF1F6FF)
                                              : Color(0xffffffff),
                                        ),
                                        Column(
                                          children: <Widget>[
                                            Container(
                                              child: Image.asset(
                                                'assets/images/cardd.png',
                                                height: 90,
                                                width: 160,
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  child: radio3,
                                                ),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 0),
                                                  child: Text(
                                                    "Pneumo",
                                                    style: GoogleFonts.poppins(
                                                        color:
                                                            Color(0xff544D4D),
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                    textAlign: TextAlign.start,
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        _selection = 4;
                                      });
                                    },
                                    child: Stack(
                                      children: <Widget>[
                                        Container(
                                          height: 148,
                                          width: 160,
                                          color: _selection == 4
                                              ? Color(0xffF1F6FF)
                                              : Color(0xffffffff),
                                        ),
                                        Column(
                                          children: <Widget>[
                                            Container(
                                              child: Image.asset(
                                                'assets/images/cardd.png',
                                                height: 90,
                                                width: 160,
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  child: radio4,
                                                ),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 0),
                                                  child: Text(
                                                    "Pneumo",
                                                    style: GoogleFonts.poppins(
                                                        color:
                                                            Color(0xff544D4D),
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                    textAlign: TextAlign.start,
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          )),
                    ]))));
  }
}

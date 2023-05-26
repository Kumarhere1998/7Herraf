// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:herraf_app/api_servivce.dart';
import 'package:herraf_app/yes.dart';
import 'package:page_transition/page_transition.dart';

// This widget is the root of your application.

class HomePage1 extends StatefulWidget {
  @override
  _HomePage1State createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
  List<dynamic> country = [];
  @override
  void initState() {
    selectcountrydata();

    super.initState();
  }

  selectcountrydata() {
    ApiService.selectcountrydata().then((value) {
      // ApiService.class_data("3,4", pref.getString("token"),date).then((value) {

      print("hoglllg");
      setState(() {
        print("rakhi${value}");
        country = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Color(0xffDADADA),
        body: SingleChildScrollView(
            child: Column(children: [
      Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            child: Image.asset(
              'assets/images/background-top(2).png',
              width: MediaQuery.of(context).size.width,
            ), // <-- SEE HERE
          ),
          Container(
            child: Text(
              "Select your country",
              style: GoogleFonts.poppins(
                  color: Color(0xff212121),
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      Container(
          margin: EdgeInsets.only(top: 15),
          height: 52.0,
          width: 320,
          decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: const Color(0xffB0A9A9),
              ),
              borderRadius: BorderRadius.circular(24.0),
              color: Colors.white),
          child: TextField(
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
                hintText: "Enter name",
                hintStyle: GoogleFonts.poppins(
                    color: Color(0xffB0A9A9),
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  color: Color(0xffB0A9A9),
                  onPressed: () {},
                  //searchAndNavigate,
                  iconSize: 20.0,
                )),
          )),
      SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 10),
          padding: new EdgeInsets.symmetric(
            horizontal: 15.0,
          ),
          height: MediaQuery.of(context).size.height * 0.9,
          width: MediaQuery.of(context).size.width * 0.9,
          child: ListView.builder(
            itemCount: country.length,
            itemBuilder: (BuildContext context, int index) {
              print(country.length);
              return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.topToBottom,
                            child: YesPage()));
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    height: 65,
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: const Color(0xffB0A9A9),
                        ),
                        borderRadius: BorderRadius.circular(40.0),
                        color: Colors.white),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(17.0),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                                "http://165.22.215.103:4000/uploads/${country[index]["flag"]}"),
                            radius: 30.0,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(0.0),
                          child: Text(
                            country[index]["country_name"],
                            // child: Text(
                            //   "France",
                            style: GoogleFonts.poppins(
                                color: Color(0xff212121),
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ));
            },
          ),
        ),
      ),
    ])));
  }
}

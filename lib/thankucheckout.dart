import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:herraf_app/api_servivce.dart';
import 'package:herraf_app/bottomNavBar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Thankucheckout extends StatefulWidget {
  final String total;
  Thankucheckout(this.total);
  @override
  State<Thankucheckout> createState() => _ThankucheckoutState();
}

void initState() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
}

@override
dispose() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  dispose();
}

class _ThankucheckoutState extends State<Thankucheckout> {
  void initState() {
    paymentdata();
    super.initState();
  }

  Map pay = {};

  Future<void> paymentdata() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    ApiService.paymentdata(pref.getString('user_id')).then((value) {
      setState(() {
        pay = value["data"];
      });
    });
  }

  Future<bool> _onBackPressed() async {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onBackPressed,
        child: new Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 0),
              child: Center(
                  child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 90),
                    child: SizedBox(
                        //   height: 220,
                        width: 260,
                        child: Image.asset("assets/images/illustration1.png")),
                  ),
                  Container(
                    margin: new EdgeInsets.only(
                      top: 30,
                    ),
                    padding: new EdgeInsets.symmetric(
                      horizontal: 30.0,
                    ),
                    child:
                        // alignment: Alignment.centerLeft,

                        Text(
                      "Thank you!",
                      style: GoogleFonts.poppins(
                          color: Color(0xff212121),
                          fontSize: 32,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    padding: new EdgeInsets.only(
                      top: 20,
                    ),
                    margin: new EdgeInsets.symmetric(
                      horizontal: 40.0,
                    ),
                    child:
                        // alignment: Alignment.centerLeft,

                        Text(
                      "Your oder was registred. Upon receiving don’t forget to scan QR code from a box to activate your pack(s).",
                      style: GoogleFonts.poppins(
                          color: Color(0xff786E6E),
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                      margin: new EdgeInsets.only(top: 50, left: 150),
                      child: Row(
                        children: <Widget>[
                          Text(
                            "€",
                            style: GoogleFonts.poppins(
                                color: Color(0xFF786E6E),
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            widget.total,
                            style: GoogleFonts.poppins(
                                color: Color(0xffB0A9A9),
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )),
                  Padding(
                    padding: new EdgeInsets.only(
                      top: 100,
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                          width: 312,
                          height: 53,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color(0xffCE8C8C)),
                          child: TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BottomNav(2)),
                                );
                              },
                              child: Text(
                                "Back to a home screen",
                                style: GoogleFonts.poppins(
                                    color: Color(0xfffffffff),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ))),
                    ],
                  )
                ],
              )),
            ),
          ),
        ));
  }
}

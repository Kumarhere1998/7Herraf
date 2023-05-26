import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:herraf_app/allowscreen.dart';
import 'package:herraf_app/bottomNavBar.dart';
import 'package:herraf_app/bottomtab.dart';
import 'package:herraf_app/newlogin.dart';
import 'package:herraf_app/qrlogin.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'newhome.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  void initState() {
    super.initState();
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
    super.dispose();
  }

  void checklogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.getString("user_id") != null) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Camera access',
                  style: GoogleFonts.poppins(
                      color: const Color(0xff212121),
                      fontWeight: FontWeight.w500,
                      fontSize: 20)),
              content: Text(
                  'Do you allow this app to have an access to your camera?',
                  style: GoogleFonts.poppins(
                      color: const Color(0xff786E6E),
                      fontWeight: FontWeight.w400,
                      fontSize: 14)),
              actions: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color(0xffB0A9A9), width: 1),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8))),
                      height: MediaQuery.of(context).size.height * 0.082,
                      width: MediaQuery.of(context).size.width * 0.350,
                      child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Deny",
                              style: GoogleFonts.poppins(
                                  color: const Color(0xffB0A9A9),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500))),
                    ),
                    InkWell(
                      child: Container(
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height * 0.082,
                        width: MediaQuery.of(context).size.width * 0.350,
                        decoration: const BoxDecoration(
                            color: Color(0xffCE8C8C),
                            borderRadius:
                                BorderRadius.all((Radius.circular(10)))),
                        child: InkWell(
                          child: Text("Allow",
                              style: GoogleFonts.poppins(
                                  color: const Color(0xffFFFFFF),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600)),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => QrCodeScannerOne()));
                            // showDialog(
                            //     context: context,
                            //     builder: (context) {
                            //       return AlertDialog(
                            //         title: Text('Taking pictures',
                            //             style: GoogleFonts.poppins(
                            //                 color: const Color(0xff212121),
                            //                 fontWeight: FontWeight.w500,
                            //                 fontSize: 20)),
                            //         content: Text(
                            //             'Do you allow this app to take pictures\non your device?',
                            //             style: GoogleFonts.poppins(
                            //                 color: const Color(0xff786E6E),
                            //                 fontWeight: FontWeight.w400,
                            //                 fontSize: 14)),
                            //         actions: <Widget>[
                            //           Row(
                            //             mainAxisAlignment:
                            //                 MainAxisAlignment.spaceAround,
                            //             children: [
                            //               Container(
                            //                 decoration: BoxDecoration(
                            //                     border: Border.all(
                            //                         color:
                            //                             const Color(0xffB0A9A9),
                            //                         width: 1),
                            //                     borderRadius:
                            //                         const BorderRadius.all(
                            //                             Radius.circular(8))),
                            //                 height: MediaQuery.of(context)
                            //                         .size
                            //                         .height *
                            //                     0.082,
                            //                 width: MediaQuery.of(context)
                            //                         .size
                            //                         .width *
                            //                     0.350,
                            //                 child: TextButton(
                            //                     onPressed: () {
                            //                       Navigator.pop(context);
                            //                     },
                            //                     child: Text("Deny",
                            //                         style: GoogleFonts.poppins(
                            //                             color: const Color(
                            //                                 0xffB0A9A9),
                            //                             fontSize: 14,
                            //                             fontWeight:
                            //                                 FontWeight.w500))),
                            //               ),
                            //               InkWell(
                            //                 child: Container(
                            //                   alignment: Alignment.center,
                            //                   height: MediaQuery.of(context)
                            //                           .size
                            //                           .height *
                            //                       0.082,
                            //                   width: MediaQuery.of(context)
                            //                           .size
                            //                           .width *
                            //                       0.350,
                            //                   decoration: const BoxDecoration(
                            //                       color: Color(0xffCE8C8C),
                            //                       borderRadius:
                            //                           BorderRadius.all(
                            //                               (Radius.circular(
                            //                                   10)))),
                            //                   child: InkWell(
                            //                     child: Text("Allow",
                            //                         style: GoogleFonts.poppins(
                            //                             color: const Color(
                            //                                 0xffFFFFFF),
                            //                             fontSize: 14,
                            //                             fontWeight:
                            //                                 FontWeight.w600)),
                            //                     onTap: () {
                            //                       Navigator.push(
                            //                           context,
                            //                           MaterialPageRoute(
                            //                               builder: (context) =>
                            //                                   QrCodeScannerOne()));
                            //                     },
                            //                   ),
                            //                 ),
                            //                 onTap: () async {
                            //                   // if (await Permission.location.request().isGranted) {
                            //                   //   // Either the permission was already granted before or the user just granted it.
                            //                   //   print("Location Permission is granted");
                            //                   // }else{
                            //                   //   print("Location Permission is denied.");
                            //                   // }
                            //                   // Navigator.push(
                            //                   //     context,
                            //                   //     MaterialPageRoute(
                            //                   //         builder:
                            //                   //             (context) =>
                            //                   //         const QrCodeScannerOne()));
                            //                 },
                            //               ),
                            //             ],
                            //           )
                            //         ],
                            //       );
                            //     });
                          },
                        ),
                      ),
                      onTap: () {},
                    ),
                  ],
                )
              ],
            );
          });
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => GoogleloginPage1()));
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.0100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                child: Stack(
                    alignment: Alignment.topCenter,
                    clipBehavior: Clip.none,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.30,
                        width: double.infinity,
                        child:
                            Image.asset("assets/images/background-top(2).png"),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.height * 0.115,
                        child: Container(
                            alignment: Alignment.center,
                            height: MediaQuery.of(context).size.height * 0.30,
                            width: MediaQuery.of(context).size.width * 0.533,
                            child: Image.asset("assets/images/Group(3).png")),
                      ),
                    ]),
              ),
              const SizedBox(
                height: 28,
                width: 28,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 80
                    // MediaQuery.of(context).size.height * 0,
                    ),
                child: Column(
                  children: [
                    Text("Scan QR code on the back \nof your pack",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: const Color(0xff00253A)),
                        textAlign: TextAlign.center),
                  ],
                ),
              ),
              const SizedBox(
                height: 14,
                width: double.infinity,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.82,
                height: MediaQuery.of(context).size.height * 0.085,
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Text(
                      "By doing this you will be able to use the benefits of the full version and apply your knowledge on practice",
                      style: GoogleFonts.poppins(
                          color: const Color(0xff786E6E),
                          fontWeight: FontWeight.w400,
                          fontSize: 14),
                      textAlign: TextAlign.center),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color(0xffB0A9A9), width: 1),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8))),
                    height: MediaQuery.of(context).size.height * 0.082,
                    width: MediaQuery.of(context).size.width * 0.411,
                    child: TextButton(
                        onPressed: () {
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) => Home(0)));
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BottomNav(2)),
                          );
                        },
                        child: Text("Not now",
                            style: GoogleFonts.poppins(
                                color: const Color(0xffB0A9A9),
                                fontSize: 14,
                                fontWeight: FontWeight.w500))),
                  ),
                  InkWell(
                    child: Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height * 0.082,
                      width: MediaQuery.of(context).size.width * 0.411,
                      decoration: const BoxDecoration(
                          color: Color(0xffCE8C8C),
                          borderRadius:
                              BorderRadius.all((Radius.circular(10)))),
                      child: Text("Scan",
                          style: GoogleFonts.poppins(
                              color: const Color(0xffFFFFFF),
                              fontSize: 14,
                              fontWeight: FontWeight.w500)),
                    ),
                    onTap: () {
                      checklogin();
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => GoogleloginPageNew()));
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

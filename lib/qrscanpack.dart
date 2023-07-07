import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:herraf_app/bottomNavBar.dart';
import 'package:herraf_app/bottomtab.dart';
import 'package:herraf_app/newhome.dart';
import 'package:herraf_app/scan.dart';

class QrPackActivated extends StatefulWidget {
  String packname;
  QrPackActivated(this.packname);

  @override
  State<QrPackActivated> createState() => _QrPackActivatedState();
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

class _QrPackActivatedState extends State<QrPackActivated> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.437,
                  width: MediaQuery.of(context).size.width * 0.777,
                  child: Image.asset("assets/images/illustration.png")),
              SizedBox(
                // height: MediaQuery.of(context).size.height * 0.08688,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 25),
                      child: Row(
                        children: [
                          Flexible(
                            child: Text(
                              "${widget.packname} is Activated",
                              style: GoogleFonts.poppins(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xff212121)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "Have fun playing",
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff786E6E)),
                    ),
                  ],
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BottomNav(2)));
                          },
                          child: Text(
                            "Continue Scanning",
                            style: GoogleFonts.poppins(
                                color: const Color(0xffFFFFFF)),
                          ))),
                  Container(
                      margin: const EdgeInsets.only(top: 20, bottom: 10),
                      width: 312,
                      height: 53,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color(0xffFFFFFF),
                          border: Border.all(
                              color: const Color(0xffB0A9A9), width: 1)),
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BottomNav(2)));
                            // setState(() {
                            //   showDialog(
                            //       context: context,
                            //       builder: (ctx) => Container(
                            //             height:
                            //                 MediaQuery.of(context).size.height *
                            //                     0.209,
                            //             width:
                            //                 MediaQuery.of(context).size.width *
                            //                     0.893,
                            //             child: AlertDialog(
                            //                 shape: const OutlineInputBorder(
                            //                     borderRadius: BorderRadius.all(
                            //                         Radius.circular(20)),
                            //                     borderSide: BorderSide(
                            //                         color: Color(0xffFFFFFF))),
                            //                 backgroundColor:
                            //                     const Color(0xffFAFAFA),
                            //                 content: SizedBox(
                            //                   height: 300,
                            //                   width: 350,
                            //                   child: Column(
                            //                       mainAxisAlignment:
                            //                           MainAxisAlignment
                            //                               .spaceBetween,
                            //                       children: [
                            //                         Row(
                            //                           mainAxisAlignment:
                            //                               MainAxisAlignment
                            //                                   .spaceBetween,
                            //                           children: [
                            //                             Padding(
                            //                               padding: EdgeInsets.only(
                            //                                   left: MediaQuery.of(
                            //                                               context)
                            //                                           .size
                            //                                           .height *
                            //                                       0.0930),
                            //                               child: Text(
                            //                                 "Welcome!",
                            //                                 style: GoogleFonts.poppins(
                            //                                     fontWeight:
                            //                                         FontWeight
                            //                                             .w500,
                            //                                     fontSize: 20,
                            //                                     color: const Color(
                            //                                         0xff212121)),
                            //                               ),
                            //                             ),
                            //                             GestureDetector(
                            //                               child: const Icon(
                            //                                 Icons.cancel,
                            //                                 color: Color(
                            //                                     0xffCE8C8C),
                            //                                 size: 50,
                            //                               ),
                            //                               onTap: () {
                            //                                 Navigator.pop(
                            //                                     context);
                            //                               },
                            //                             ),
                            //                           ],
                            //                         ),
                            //                         InkWell(
                            //                           child: Container(
                            //                               height: 72,
                            //                               width: 72,
                            //                               decoration: const BoxDecoration(
                            //                                   borderRadius: BorderRadius
                            //                                       .all(Radius
                            //                                           .circular(
                            //                                               60)),
                            //                                   color: Color(
                            //                                       0xffEBE9E9)),
                            //                               child: const Icon(
                            //                                   Icons.add,
                            //                                   size: 40)),
                            //                           onTap: () {},
                            //                         ),
                            //                         TextFormField(
                            //                             keyboardType:
                            //                                 TextInputType.text,
                            //                             decoration: const InputDecoration(
                            //                                 border: OutlineInputBorder(
                            //                                     borderRadius: BorderRadius
                            //                                         .all(Radius
                            //                                             .circular(
                            //                                                 24)),
                            //                                     borderSide: BorderSide(
                            //                                         width: 1,
                            //                                         color: Color(
                            //                                             0xffD7D4D4))))),
                            //                         Row(
                            //                           mainAxisAlignment:
                            //                               MainAxisAlignment
                            //                                   .center,
                            //                           children: [
                            //                             Container(
                            //                               decoration: const BoxDecoration(
                            //                                   color: Color(
                            //                                       0xffCE8C8C),
                            //                                   borderRadius: BorderRadius
                            //                                       .all(Radius
                            //                                           .circular(
                            //                                               32))),
                            //                               width: 148,
                            //                               height: 56,
                            //                               child: TextButton(
                            //                                   onPressed: () {
                            //                                     Navigator.pop(
                            //                                         context);
                            //                                   },
                            //                                   child: Text(
                            //                                     "Save",
                            //                                     style: GoogleFonts.poppins(
                            //                                         fontWeight:
                            //                                             FontWeight
                            //                                                 .w500,
                            //                                         fontSize:
                            //                                             14,
                            //                                         color: const Color(
                            //                                             0xffFFFFFF)),
                            //                                   )),
                            //                             ),
                            //                           ],
                            //                         )
                            //                       ]),
                            //                 )),
                            //           ));
                            // });
                          },
                          child: Text(
                            "Go to a home screen",
                            style: GoogleFonts.poppins(
                                color: const Color(0xffB0A9A9)),
                          ))),
                ],
              )
            ],
          )),
        ),
      ),
    );
  }
}

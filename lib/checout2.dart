import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:herraf_app/checkout3.dart';
import 'package:herraf_app/checkout4.dart';
import 'package:herraf_app/checkout6.dart';

class CheckoutTwo extends StatefulWidget {
  const CheckoutTwo({Key? key}) : super(key: key);

  @override
  State<CheckoutTwo> createState() => _CheckoutTwoState();
}

class _CheckoutTwoState extends State<CheckoutTwo> {
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
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  int selected_inx = 0;
  bool isCashSelected = false;
  bool isCardSelected = false;
  bool isPayPalSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: (() {
                              Navigator.of(context).pop();
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(builder: (context) => profilePage2()),
                              // );
                            }),
                            child: Container(
                              padding: const EdgeInsets.only(
                                left: 20,
                              ),
                              child: Icon(
                                Icons.arrow_back,
                                size: 24,
                                color: Color(0xff212121),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                            width: 15,
                          ),
                          Text(
                            "Checkout",
                            style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff212121)),
                          )
                        ],
                      ),
                      const SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: 30,
                              width: 30,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                color: Color(0xffF1F6FF),
                              ),
                              child: const Text("1"),
                            ),
                            Container(
                              height: 3,
                              width: 60,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(24)),
                                color: Color(0xff686565),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 30,
                              width: 30,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                color: Color(0xffF1F6FF),
                              ),
                              child: const Text("2"),
                            ),
                            Container(
                              height: 3,
                              width: 60,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(24)),
                                color: Color(0xff686565),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 30,
                              width: 30,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                color: Color(0xffF1F6FF),
                              ),
                              child: const Text("3"),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Address",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color:
                                    const Color(0xff00253A).withOpacity(0.3)),
                          ),
                          Text(
                            "Payment",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                                color: const Color(0xff0093ED)),
                          ),
                          Text(
                            "Confirm",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color:
                                    const Color(0xff00253A).withOpacity(0.3)),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: Text(
                      "Preffered payment method:",
                      style: GoogleFonts.poppins(
                          color: const Color(0xff000000),
                          fontWeight: FontWeight.w700,
                          fontSize: 18),
                    ),
                  ),
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 2,
                                color: isCashSelected
                                    ? Colors.blue
                                    : const Color(0xffE0E0E0)),
                            color: isCashSelected
                                ? Colors.blue
                                : Colors.transparent),
                        height: MediaQuery.of(context).size.height / 9.12,
                        width: MediaQuery.of(context).size.width * 0.88,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  isCashSelected ? "Cash" : "Cash ",
                                  style: GoogleFonts.poppins(
                                      color: isCashSelected
                                          ? Colors.white
                                          : const Color(0xff333333),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                                isCashSelected
                                    ? const Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.white,
                                      )
                                    : const Icon(Icons.arrow_forward_ios)
                              ]),
                        ),
                      ),
                    ),
                    onTap: () {
                      if (isCashSelected) {
                        setState(() {
                          isCashSelected = false;
                        });
                      } else {
                        setState(() {
                          isCashSelected = true;
                          isCardSelected = false;
                          isPayPalSelected = false;
                        });
                      }

                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => const CheckoutSix()));
                    },
                  ),
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 2,
                                color: isCardSelected
                                    ? Colors.blue
                                    : const Color(0xffE0E0E0)),
                            color: isCardSelected
                                ? Colors.blue
                                : Colors.transparent),
                        height: MediaQuery.of(context).size.height / 9.12,
                        width: MediaQuery.of(context).size.width * 0.88,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Text(
                                //   "Card",
                                //   style: GoogleFonts.poppins(
                                //       color: const Color(0xff333333),
                                //       fontSize: 18,
                                //       fontWeight: FontWeight.w600),
                                // ),
                                // const Icon(Icons.arrow_forward_ios),
                                Text(
                                  isCardSelected ? "Card" : "Card ",
                                  style: GoogleFonts.poppins(
                                      color: isCardSelected
                                          ? Colors.white
                                          : const Color(0xff333333),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                                isCardSelected
                                    ? const Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.white,
                                      )
                                    : const Icon(Icons.arrow_forward_ios)
                              ]),
                        ),
                      ),
                    ),
                    onTap: () {
                      if (isCardSelected) {
                        setState(() {
                          isCardSelected = false;
                        });
                      } else {
                        setState(() {
                          isCardSelected = true;
                          isCashSelected = false;
                          isPayPalSelected = false;
                        });
                      }

                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => const CheckoutFour()));
                    },
                  ),
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 2,
                                color: isPayPalSelected
                                    ? Colors.blue
                                    : const Color(0xffE0E0E0)),
                            color: isPayPalSelected
                                ? Colors.blue
                                : Colors.transparent),
                        height: MediaQuery.of(context).size.height / 9.12,
                        width: MediaQuery.of(context).size.width * 0.88,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  isPayPalSelected ? "Paypal" : "Paypal ",
                                  style: GoogleFonts.poppins(
                                      color: isPayPalSelected
                                          ? Colors.white
                                          : const Color(0xff333333),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                                isPayPalSelected
                                    ? const Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.white,
                                      )
                                    : const Icon(Icons.arrow_forward_ios)
                              ]),
                        ),
                      ),
                    ),
                    onTap: () {
                      if (isPayPalSelected) {
                        setState(() {
                          isPayPalSelected = false;
                        });
                      } else {
                        setState(() {
                          isCardSelected = false;
                          isCashSelected = false;
                          isPayPalSelected = true;
                        });
                      }

                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => const CheckoutFive()));
                    },
                  ),
                ]),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: 20,
                      top: MediaQuery.of(context).size.height * 0.120),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Container(
                          alignment: Alignment.center,
                          height: MediaQuery.of(context).size.height * 0.11,
                          width: MediaQuery.of(context).size.width * 0.88,
                          decoration: const BoxDecoration(),
                          child: Container(
                            decoration:
                                const BoxDecoration(color: Color(0xffF1F6FF)),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: const [
                                        Icon(
                                          Icons.error_outline_rounded,
                                          textDirection: TextDirection.rtl,
                                          color: Color(0xff0093ED),
                                        )
                                      ],
                                    ),
                                    // SizedBox(
                                    //   height: 72,
                                    //   width: 271,
                                    //   child: Column(
                                    //     crossAxisAlignment:
                                    //         CrossAxisAlignment.start,
                                    //     children: [
                                    //       Text(
                                    //         textAlign: TextAlign.start,
                                    //         "By proceeding with a checkout process you agree with our",
                                    //         style: GoogleFonts.poppins(
                                    //             fontSize: 16,
                                    //             fontWeight: FontWeight.w500,
                                    //             color: const Color(0xff686565)),
                                    //       ),
                                    //       Text(
                                    //         textAlign: TextAlign.start,
                                    //         "refund policy",
                                    //         style: GoogleFonts.poppins(
                                    //             decoration:
                                    //                 TextDecoration.underline,
                                    //             fontSize: 16,
                                    //             fontWeight: FontWeight.w700,
                                    //             color: const Color(0xff0093ED)),
                                    //       ),
                                    //     ],
                                    //   ),
                                    // )
                                  ]),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            // Container(
                            //     width: MediaQuery.of(context).size.width / 2.7,
                            //     height: MediaQuery.of(context).size.height / 15,
                            //     decoration: BoxDecoration(
                            //         border: Border.all(
                            //             width: 2,
                            //             color: const Color(0xff2F80ED))),
                            //     child: TextButton(
                            //         onPressed: () {
                            //           Navigator.pop(context);
                            //         },
                            //         child: Text(
                            //           "Back",
                            //           style: GoogleFonts.poppins(
                            //               color: const Color(0xff2F80ED),
                            //               fontSize: 18,
                            //               fontWeight: FontWeight.w600),
                            //         ))),
                            // Container(
                            //   decoration:
                            //       const BoxDecoration(color: Color(0xff0093ED)),
                            //   child: ElevatedButton(
                            //       style: ButtonStyle(
                            //         backgroundColor:
                            //             MaterialStateProperty.all<Color>(
                            //                 const Color(0xff0093ED)),
                            //       ),
                            //       onPressed: () {
                            //         // Navigator.push(
                            //         //     context,
                            //         //     MaterialPageRoute(
                            //         //         builder: (context) =>
                            //         //             const CheckoutThree()));
                            //         if (isCashSelected) {
                            //           Navigator.push(
                            //               context,
                            //               MaterialPageRoute(
                            //                   builder: (context) =>
                            //                       const CheckoutSix()));
                            //           print("Cash");
                            //         } else if (isCardSelected) {
                            //           Navigator.push(
                            //               context,
                            //               MaterialPageRoute(
                            //                   builder: (context) =>
                            //                       const CheckoutFour()));
                            //           print("Card");
                            //         } else if (isPayPalSelected) {
                            //           Navigator.push(
                            //               context,
                            //               MaterialPageRoute(
                            //                   builder: (context) =>
                            //                       const CheckoutThree()));
                            //           print("PayPal");
                            //         }
                            //         // Navigator.push(
                            //         //     context,
                            //         //     MaterialPageRoute(
                            //         //         builder: (_) => Deepak(
                            //         //               data: "THis is Data",
                            //         //               list: [],
                            //         //             )));
                            //       },
                            //       child: SizedBox(
                            //         width:
                            //             MediaQuery.of(context).size.width / 2.7,
                            //         height:
                            //             MediaQuery.of(context).size.height / 15,
                            //         child: Row(
                            //           mainAxisAlignment:
                            //               MainAxisAlignment.spaceAround,
                            //           children: [
                            //             Text("Next",
                            //                 style: GoogleFonts.poppins(
                            //                     fontSize: 17,
                            //                     fontWeight: FontWeight.w600)),
                            //             const Icon(
                            //               Icons.arrow_forward,
                            //               size: 22,
                            //             )
                            //           ],
                            //         ),
                            //       )),
                            // )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

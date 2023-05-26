import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:herraf_app/checkout4.dart';
import 'package:herraf_app/checkout5.dart';
import 'package:herraf_app/checout2.dart';

class CheckoutThree extends StatefulWidget {
  const CheckoutThree({Key? key}) : super(key: key);

  @override
  State<CheckoutThree> createState() => _CheckoutThreeState();
}

class _CheckoutThreeState extends State<CheckoutThree> {
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CheckoutTwo()),
                              );
                            }),
                            child: Icon(Icons.arrow_back_ios_outlined,
                                color: Color(0xff0093ED), size: 18),
                          ),
                          const SizedBox(
                            height: 30,
                            width: 15,
                          ),
                          Text(
                            "Checkout",
                            style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xff0093ED)),
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
                Padding(
                  padding: const EdgeInsets.only(bottom: 200),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Text(
                            "Paypal payment",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                                color: const Color(0xff000000)),
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Text(
                                  "Email address",
                                  style: GoogleFonts.poppins(
                                      color: const Color(0xff333333),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.059,
                              width: MediaQuery.of(context).size.width * 0.882,
                              child: const TextField(
                                style: TextStyle(),
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xffE0E0E0),
                                            width: 2)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xffE0E0E0),
                                            width: 2))),
                              ),
                            )
                          ],
                        ),
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 98),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.11,
                          width: MediaQuery.of(context).size.width * 0.88,
                          decoration: const BoxDecoration(),
                          child: Container(
                            decoration:
                                const BoxDecoration(color: Color(0xffF1F6FF)),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 5),
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
                                    SizedBox(
                                      height: 72,
                                      width: 271,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "By proceeding with a checkout process you agree with our",
                                            style: GoogleFonts.poppins(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: const Color(0xff686565)),
                                            textAlign: TextAlign.start,
                                          ),
                                          Text(
                                            "refund policy",
                                            style: GoogleFonts.poppins(
                                                decoration:
                                                    TextDecoration.underline,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                                color: const Color(0xff0093ED)),
                                            textAlign: TextAlign.start,
                                          ),
                                        ],
                                      ),
                                    )
                                  ]),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width / 2.7,
                              height: MediaQuery.of(context).size.height / 15,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2,
                                      color: const Color(0xff2F80ED))),
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    "Back",
                                    style: GoogleFonts.poppins(
                                        color: const Color(0xff2F80ED),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ))),
                          Container(
                            decoration:
                                const BoxDecoration(color: Color(0xff2F80ED)),
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              CheckoutFive()));
                                },
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 2.7,
                                  height:
                                      MediaQuery.of(context).size.height / 15,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text("Next",
                                          style: GoogleFonts.poppins(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w600)),
                                      const Icon(
                                        Icons.arrow_forward,
                                        size: 22,
                                      )
                                    ],
                                  ),
                                )),
                          )
                        ],
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

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:herraf_app/checkout3.dart';
import 'package:herraf_app/checkout6.dart';

class CheckoutFive extends StatefulWidget {
  const CheckoutFive({Key? key}) : super(key: key);

  @override
  State<CheckoutFive> createState() => _CheckoutFiveState();
}

class _CheckoutFiveState extends State<CheckoutFive> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
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
                                  builder: (context) => CheckoutThree()),
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
                              color: Color(0xff0093ED),
                            ),
                            child: Text("3",
                                style: GoogleFonts.poppins(
                                    color: const Color(0xffFFFFFF))),
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
                              color: const Color(0xff00253A).withOpacity(0.3)),
                        ),
                        Text(
                          "Payment",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: const Color(0xff00253A).withOpacity(0.3)),
                        ),
                        Text(
                          "Confirm",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              color: const Color(0xff0093ED)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Container(
                      alignment: Alignment.topLeft,
                      height: MediaQuery.of(context).size.height / 10,
                      child: Text(
                        "Please check the entered\ninfomation once again:",
                        style: GoogleFonts.poppins(
                            color: const Color(0xff333333),
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("The cards are going to be delivered in:",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: const Color(0xff333333))),
                  const SizedBox(height: 5),
                  Text("Marrakesh,\nMorroco,\nAv. Khalid Ibn El Oualid 54",
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff686565))),
                ],
              ),
              const SizedBox(height: 25),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Payment method:",
                        style: GoogleFonts.poppins(
                            color: const Color(0xff000000),
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      ),
                      Image.asset(
                        "assets/images/Frame(9).png",
                        height: 33,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Email address",
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xff333333))),
                          Text("kirylsavin@gmail.com",
                              style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xff0093ED),
                                  decoration: TextDecoration.underline)),
                        ]),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Amount to pay:",
                    style: GoogleFonts.poppins(
                        color: const Color(0xff000000),
                        fontWeight: FontWeight.w600,
                        fontSize: 18),
                  ),
                  Text(
                    "€12",
                    style: GoogleFonts.poppins(
                        color: const Color(0xff0093ED),
                        fontWeight: FontWeight.w700,
                        fontSize: 24),
                  ),
                ],
              ),
              const SizedBox(height: 100),
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width / 2.7,
                        height: MediaQuery.of(context).size.height / 15,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 2, color: const Color(0xff2F80ED))),
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
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      decoration: const BoxDecoration(color: Color(0xff2F80ED)),
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CheckoutSix()));
                          },
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width / 2.7,
                            height: MediaQuery.of(context).size.height / 15,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("Confirm",
                                    style: GoogleFonts.poppins(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600)),
                              ],
                            ),
                          )),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

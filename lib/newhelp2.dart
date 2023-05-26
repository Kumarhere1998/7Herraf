import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaidVersion extends StatelessWidget {
  const PaidVersion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAFAFA),
      body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
        children: [
          Stack(
            children: [
              Image.asset("assets/images/background-top(2).png"),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 15),
                    child: Row(
                      children: [
                        InkWell(
                            child: const Icon(Icons.arrow_back),
                            onTap: () {
                              Navigator.pop(context);
                            }),
                        const SizedBox(width: 10),
                        Text(
                          "Paid version",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: const Color(0xff212121)),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: Color(0xffFFFFFF),
                border: Border.all(color: Color(0xffEBE9E9), width: 1)),
            height: MediaQuery.of(context).size.height * 0.560,
            width: MediaQuery.of(context).size.width * 0.866,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(right: 55, top: 30, bottom: 30),
                  child: Text("One-time payment",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: const Color(0xff212121))),
                ),
                Text("Valid when bought and activated at\nleast one pack",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: const Color(0xff786E6E))),
                Padding(
                  padding: const EdgeInsets.only(left: 45, top: 20),
                  child: Row(
                    children: [
                      const Icon(Icons.check_circle),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.030,
                      ),
                      Text("Spell out acronyms",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: const Color(0xff212121)))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 45, top: 20),
                  child: Row(
                    children: [
                      const Icon(Icons.check_circle),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.030,
                      ),
                      Text("No adds",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: const Color(0xff212121)))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 45, top: 20),
                  child: Row(
                    children: [
                      const Icon(Icons.check_circle),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.030,
                      ),
                      Text("Unlimited playing experience",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: const Color(0xff212121)))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 45, top: 20),
                  child: Row(
                    children: [
                      const Icon(Icons.check_circle),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.030,
                      ),
                      Text("Daily streak",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: const Color(0xff212121)))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Color(0xffCE8C8C),
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height * 0.0828,
                    width: MediaQuery.of(context).size.width * 0.777,
                    child: Text("Buy flashcards",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: const Color(0xffFFFFFF))),
                  ),
                )
              ],
            ),
          )
        ],
      ))),
    );
  }
}

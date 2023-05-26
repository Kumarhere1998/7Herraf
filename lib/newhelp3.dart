import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RefundPayments extends StatelessWidget {
  const RefundPayments({Key? key}) : super(key: key);

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
                        SizedBox(width: 10),
                        Text(
                          "Refunds & payments",
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.030,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("The money was transffered\nwithout any discounts",
                      style: GoogleFonts.poppins(
                          color: const Color(0xff212121),
                          fontSize: 20,
                          fontWeight: FontWeight.w500)),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.020,
                  ),
                  Text(
                      "Vivamus sed egestas nunc, sapien. Dui\namet integer tempor sit ultricies enim in ac\nin. Lectus sit dui magnis vulputate eros, risus.\nId et eget urna nunc.",
                      style: GoogleFonts.poppins(
                          color: const Color(0xff786E6E),
                          fontSize: 14,
                          fontWeight: FontWeight.w400)),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.080,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("How long the refund can take?",
                      style: GoogleFonts.poppins(
                          color: const Color(0xff212121),
                          fontSize: 20,
                          fontWeight: FontWeight.w500)),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.020,
                  ),
                  Text(
                      "Nullam et tincidunt mauris ac vestibulum\nenim. Dolor montes, gravida ac,\nac scelerisque blandit. Mauris, id eu arcu\ndignissim.",
                      style: GoogleFonts.poppins(
                          color: const Color(0xff786E6E),
                          fontSize: 14,
                          fontWeight: FontWeight.w400)),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.080,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("How long the refund can take?",
                      style: GoogleFonts.poppins(
                          color: const Color(0xff212121),
                          fontSize: 20,
                          fontWeight: FontWeight.w500)),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.020,
                  ),
                  Text(
                      "Nullam et tincidunt mauris ac vestibulum\nenim. Dolor montes, gravida ac,\nac scelerisque blandit. Mauris, id eu arcu\ndignissim.",
                      style: GoogleFonts.poppins(
                          color: const Color(0xff786E6E),
                          fontSize: 14,
                          fontWeight: FontWeight.w400)),
                ],
              )
            ],
          )
        ],
      ))),
    );
  }
}

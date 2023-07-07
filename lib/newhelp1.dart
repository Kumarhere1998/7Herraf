import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:herraf_app/newhelp2.dart';
import 'package:herraf_app/newhelp3.dart';
import 'package:herraf_app/newhelp4.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Container(
          color: const Color(0xffFAFAFA),
          child: Column(
            children: [
              Stack(children: [
                Image.asset("assets/images/background-top(2).png"),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            child: Row(
                              children: [
                                const Icon(Icons.arrow_back),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text("Help",
                                    style: GoogleFonts.poppins(
                                        color: const Color(0xff212121),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500)),
                              ],
                            ),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                          IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SupportRequest()));
                              },
                              icon: Image.asset('assets/images/sms.png'))
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 340,
                      child: TextField(
                        scrollPhysics: const BouncingScrollPhysics(),
                        decoration: InputDecoration(
                            hintText: "What are you lookng for",
                            hintStyle: GoogleFonts.poppins(
                                color: const Color(0xffB0A9A9).withOpacity(0.8),
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                            enabledBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(24)))),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    InkWell(
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        width: MediaQuery.of(context).size.width * 0.866,
                        height: MediaQuery.of(context).size.height * 0.1,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color(0xffEBE9E9), width: 1),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                          color: const Color(0xffFFFFFF),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Refunds & payments",
                                    style: GoogleFonts.poppins(
                                        color: const Color(0xff212121),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500)),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color(0xff7E7E7E),
                                )
                              ]),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RefundPayments()));
                      },
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      width: MediaQuery.of(context).size.width * 0.866,
                      height: MediaQuery.of(context).size.height * 0.1,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color(0xffEBE9E9), width: 1),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        color: const Color(0xffFFFFFF),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Game rules",
                                  style: GoogleFonts.poppins(
                                      color: const Color(0xff212121),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500)),
                              const Icon(
                                Icons.arrow_forward_ios,
                                color: Color(0xff7E7E7E),
                              )
                            ]),
                      ),
                    ),
                    InkWell(
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        width: MediaQuery.of(context).size.width * 0.866,
                        height: MediaQuery.of(context).size.height * 0.1,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color(0xffEBE9E9), width: 1),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                          color: const Color(0xffFFFFFF),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Paid version",
                                    style: GoogleFonts.poppins(
                                        color: const Color(0xff212121),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500)),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color(0xff7E7E7E),
                                )
                              ]),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PaidVersion()));
                      },
                    ),
                  ],
                )
              ]),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.100,
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.041),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.021),
                      child: Text("Didn't find the answer?",
                          style: GoogleFonts.poppins(
                              color: const Color(0xff212121),
                              fontSize: 20,
                              fontWeight: FontWeight.w500)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.021),
                      child: Text(
                          "Write us with any question or problem you\nand we’ll be glad to assist you.",
                          style: GoogleFonts.poppins(
                              color: const Color(0xff786E6E),
                              fontSize: 14,
                              fontWeight: FontWeight.w400)),
                    ),
                    InkWell(
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.021),
                        width: MediaQuery.of(context).size.width * 0.866,
                        height: MediaQuery.of(context).size.height * 0.082,
                        decoration: const BoxDecoration(
                            color: Color(0xffCE8C8C),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Text(
                          "Contact support team",
                          style: GoogleFonts.poppins(
                              color: const Color(0xffFFFFFF),
                              fontWeight: FontWeight.w500,
                              fontSize: 14),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SupportRequest()));
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}

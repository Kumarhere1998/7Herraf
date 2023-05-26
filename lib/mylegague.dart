import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class League extends StatefulWidget {
  const League({Key? key}) : super(key: key);

  @override
  State<League> createState() => _LeagueState();
}

bool? state;

class _LeagueState extends State<League> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      backgroundColor: const Color(0xffDADADA),
      floatingActionButton: Container(
        decoration: BoxDecoration(
            color: const Color(0xffFFFFFF),
            border: Border.all(width: 1, color: const Color(0xffCE8C8C)),
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        height: MediaQuery.of(context).size.height * 0.1125,
        width: MediaQuery.of(context).size.width * 0.866,
        margin: const EdgeInsets.only(left: 50, right: 40),
        child: Column(
          children: [
            Container(
                child: Padding(
              padding: const EdgeInsets.symmetric(),
              child: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        margin: const EdgeInsets.only(left: 15),
                        height: 20,
                        width: 32,
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Text(
                          "24",
                          style: GoogleFonts.poppins(
                              color: const Color(0xff212121),
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: SizedBox(
                          height: 40,
                          width: 40,
                          child: Image.asset('assets/images/profile.png')),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Jane Cooper",
                              style: GoogleFonts.poppins(
                                  color: const Color(0xff212121),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16)),
                          Text("Exp 1400",
                              style: GoogleFonts.poppins(
                                  color: const Color(0xff786E6E),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12))
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    )
                  ],
                ),
              ),
            )),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height * 0.110),
          child: Column(children: [
            Stack(
              children: [
                Image.asset("assets/images/background-top(2).png"),
                Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.arrow_back)),
                        Text(
                          "My league",
                          style: GoogleFonts.poppins(
                              color: const Color(0xff212121),
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        )
                      ],
                    ),
                    SizedBox(
                      child: TabBar(
                        indicator: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        controller: tabController,
                        isScrollable: true,
                        labelPadding:
                            const EdgeInsets.symmetric(horizontal: 30),
                        tabs: [
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.140,
                              width: 75,
                              child: Image.asset("assets/images/bronze.png")),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.140,
                              width: 75,
                              child: Image.asset("assets/images/silver.png")),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.140,
                              width: 75,
                              child: Image.asset("assets/images/gold9.png")),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Icon(Icons.access_time_outlined,
                        color: Color(0xffCE8C8C)),
                  ),
                  Text("4 days left",
                      style: GoogleFonts.poppins(
                          color: const Color(0xff212121),
                          fontWeight: FontWeight.w500,
                          fontSize: 16)),
                ],
              ),
            ),
            Expanded(
                child: TabBarView(
              controller: tabController,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                            color: const Color(0xffFFFFFF),
                            border: Border.all(
                                width: 1, color: const Color(0xffEBE9E9)),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8))),
                        height: MediaQuery.of(context).size.height * 0.1125,
                        width: MediaQuery.of(context).size.width * 0.866,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        child: Column(
                          children: [
                            Container(
                                child: Padding(
                              padding: const EdgeInsets.symmetric(),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                        color: const Color(0xffFFD863),
                                        width: 6,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.09),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: SizedBox(
                                          width: 32,
                                          child: Image.asset(
                                              "assets/images/1st.png")),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: SizedBox(
                                          height: 40,
                                          width: 40,
                                          child: Image.asset(
                                              'assets/images/profile.png')),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text("Savannah Nguyen",
                                              style: GoogleFonts.poppins(
                                                  color:
                                                      const Color(0xff212121),
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16)),
                                          Text("Exp 2500",
                                              style: GoogleFonts.poppins(
                                                  color:
                                                      const Color(0xff786E6E),
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12))
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 30,
                                    )
                                  ],
                                ),
                              ),
                            )),
                          ],
                        ),
                      );
                    },
                    shrinkWrap: true,
                    itemCount: 10,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                            color: const Color(0xffFFFFFF),
                            border: Border.all(
                                width: 1, color: const Color(0xffEBE9E9)),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8))),
                        height: MediaQuery.of(context).size.height * 0.1125,
                        width: MediaQuery.of(context).size.width * 0.866,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        child: Column(
                          children: [
                            Container(
                                child: Padding(
                              padding: const EdgeInsets.symmetric(),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                        color: const Color(0xffFFD863),
                                        width: 6,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.09),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: SizedBox(
                                          width: 32,
                                          child: Image.asset(
                                              "assets/images/1st.png")),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: SizedBox(
                                          height: 40,
                                          width: 40,
                                          child: Image.asset(
                                              'assets/images/profile.png')),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text("Savannah Nguyen",
                                              style: GoogleFonts.poppins(
                                                  color:
                                                      const Color(0xff212121),
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16)),
                                          Text("Exp 2500",
                                              style: GoogleFonts.poppins(
                                                  color:
                                                      const Color(0xff786E6E),
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12))
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 30,
                                    )
                                  ],
                                ),
                              ),
                            )),
                          ],
                        ),
                      );
                    },
                    shrinkWrap: true,
                    itemCount: 10,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                            color: const Color(0xffFFFFFF),
                            border: Border.all(
                                width: 1, color: const Color(0xffEBE9E9)),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8))),
                        height: MediaQuery.of(context).size.height * 0.1125,
                        width: MediaQuery.of(context).size.width * 0.866,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        child: Column(
                          children: [
                            Container(
                                child: Padding(
                              padding: const EdgeInsets.symmetric(),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        0.0174),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      // Container(padding: EdgeInsets.only(left: 5),
                                      //     alignment: Alignment.center,
                                      //     height: 30,
                                      //     width: 30,
                                      //     decoration: BoxDecoration(
                                      //         borderRadius: BorderRadius.all(
                                      //             Radius.circular(20))),
                                      //     child: Text("1",
                                      //         style: GoogleFonts.poppins(
                                      //             color: const Color(0xff212121),
                                      //             fontWeight: FontWeight.w500,
                                      //             fontSize: 16))),
                                      SizedBox(
                                          width: 32,
                                          child: Image.asset(
                                              "assets/images/1st.png")),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: SizedBox(
                                            height: 40,
                                            width: 40,
                                            child: Image.asset(
                                                'assets/images/profile.png')),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text("Savannah Nguyen",
                                                style: GoogleFonts.poppins(
                                                    color:
                                                        const Color(0xff212121),
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 16)),
                                            Text("Exp 2500",
                                                style: GoogleFonts.poppins(
                                                    color:
                                                        const Color(0xff786E6E),
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 12))
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 30,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )),
                          ],
                        ),
                      );
                    },
                    shrinkWrap: true,
                    itemCount: 10,
                  ),
                ),
              ],
            ))
          ]),
        ),
      ),
    );
  }
}

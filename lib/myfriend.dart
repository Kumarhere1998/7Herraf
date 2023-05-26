import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FriendPage extends StatefulWidget {
  const FriendPage({Key? key}) : super(key: key);

  @override
  State<FriendPage> createState() => _FriendPageState();
}

bool? state;

class _FriendPageState extends State<FriendPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      backgroundColor: const Color(0xffDADADA),
      body: SafeArea(
        child: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.0),
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
                          "Add friend",
                          style: GoogleFonts.poppins(
                              color: const Color(0xff212121),
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                    ),
                    SizedBox(
                      child: Container(
                          height: 52.0,
                          width: 320,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24.0),
                              color: Colors.white),
                          child: TextField(
                            textInputAction: TextInputAction.search,
                            decoration: InputDecoration(
                                hintText: "Enter name",
                                hintStyle: GoogleFonts.poppins(
                                    color: Color(0xffB0A9A9),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                                border: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.only(left: 15.0, top: 15.0),
                                suffixIcon: IconButton(
                                  icon: Icon(Icons.search),
                                  color: Color(0xffB0A9A9),
                                  onPressed: () {},
                                  //searchAndNavigate,
                                  iconSize: 20.0,
                                )),
                          )),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Search results",
                      style: GoogleFonts.poppins(
                          color: const Color(0xff212121),
                          fontWeight: FontWeight.w500,
                          fontSize: 20)),
                ],
              ),
            ),
            Expanded(
                child: TabBarView(
              controller: tabController,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0),
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
                                          Text("Jenny Wilson",
                                              style: GoogleFonts.poppins(
                                                  color:
                                                      const Color(0xff212121),
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16)),
                                          Row(
                                            children: [
                                              SizedBox(
                                                  height: 20,
                                                  width: 20,
                                                  child: Image.asset(
                                                      'assets/images/friend.png')),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                              ),
                                              Text("Send request",
                                                  style: GoogleFonts.poppins(
                                                      color: const Color(
                                                          0xff786E6E),
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 12))
                                            ],
                                          )
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
                  padding: const EdgeInsets.symmetric(vertical: 0),
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

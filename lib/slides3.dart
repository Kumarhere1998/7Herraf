import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:herraf_app/catalog.dart';
import 'package:herraf_app/homepageone.dart';
import 'package:herraf_app/newscan2.dart';

class Series3 extends StatefulWidget {
  const Series3({Key? key}) : super(key: key);

  @override
  State<Series3> createState() => _Series3State();
}

class _Series3State extends State<Series3> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding:
            EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.0100),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(
              child: Column(children: [
            SizedBox(
              child: Stack(
                  alignment: Alignment.topCenter,
                  clipBehavior: Clip.none,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.30,
                      width: double.infinity,
                      child: Image.asset("assets/images/background-top(2).png"),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.11,
                      child: Container(
                          alignment: Alignment.center,
                          height: MediaQuery.of(context).size.height * 0.30,
                          width: MediaQuery.of(context).size.width * 0.80,
                          child: Image.asset("assets/images/yes.png")),
                    ),
                  ]),
            ),
            // Container(
            //   height: 260,
            //   child: Image.asset(
            //     'assets/images/background-top(2).png',
            //     // height: 230,
            //     width: MediaQuery.of(context).size.width,
            //     // width: MediaQuery.of(context).size.width * 0.94,
            //     // height: MediaQuery.of(context).size.height * 0.14,
            //   ), // <-- SEE HERE
            // ),
            // Container(
            //   //  height: 217,
            //   width: 190,
            //   padding:
            //       new EdgeInsets.symmetric(horizontal: 0.0, vertical: 0),
            //   child: Image.asset(
            //     'assets/images/yes.png',
            //     // height: 230,
            //     //width: MediaQuery.of(context).size.width,
            //     // width: MediaQuery.of(context).size.width * 0.94,
            //     // height: MediaQuery.of(context).size.height * 0.14,
            //   ), // <-- SEE HERE
            // ),
            Container(
              margin: new EdgeInsets.only(
                top: 100,
              ),
              padding: new EdgeInsets.symmetric(
                horizontal: 30.0,
              ),
              child:
                  // alignment: Alignment.centerLeft,

                  Text(
                "Flashcards",
                style: GoogleFonts.poppins(
                    color: Color(0xff212121),
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: new EdgeInsets.only(
                top: 10,
              ),
              padding: new EdgeInsets.symmetric(
                horizontal: 30.0,
              ),
              child:
                  // alignment: Alignment.centerLeft,

                  Text(
                "This cards are available only physically. Buy at least one pack to be able to apply learned material when playing.",
                style: GoogleFonts.poppins(
                    color: Color(0xff6C6363),
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 170,
              ),
            ),
            InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CatalogPage()),
                  );
                },
                child: Container(
                  margin:
                      new EdgeInsets.symmetric(horizontal: 4.0, vertical: 4),
                  alignment: Alignment.center,
                  height: 56,
                  width: 330,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color(0xffCE8C8C),
                  ),
                  //  color: Color(0xff267693),
                  child: Text(
                    "Buy flashcards",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        color: Color(0xffffffff),
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
              ),
            ),
            InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomepageOne()),
                  );
                  setState(() {
                    showDialog(
                        context: context,
                        builder: (ctx) => Container(
                              height:
                                  MediaQuery.of(context).size.height * 0.209,
                              width: MediaQuery.of(context).size.width * 0.893,
                              child: Stack(
                                children: [
                                  AlertDialog(
                                      shape: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                          borderSide: BorderSide(
                                              color: Color(0xffFFFFFF))),
                                      backgroundColor: const Color(0xffFAFAFA),
                                      content: SizedBox(
                                        height: 300,
                                        width: 350,
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Welcome!1",
                                                style: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 20,
                                                    color: const Color(
                                                        0xff212121)),
                                              ),
                                              InkWell(
                                                child: Container(
                                                    height: 72,
                                                    width: 72,
                                                    decoration: const BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    60)),
                                                        color:
                                                            Color(0xffEBE9E9)),
                                                    child: const Icon(Icons.add,
                                                        size: 40)),
                                                onTap: () {},
                                              ),
                                              TextFormField(
                                                  keyboardType:
                                                      TextInputType.text,
                                                  decoration: const InputDecoration(
                                                      border: OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          24)),
                                                          borderSide: BorderSide(
                                                              width: 1,
                                                              color: Color(
                                                                  0xffD7D4D4))))),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    decoration: const BoxDecoration(
                                                        color:
                                                            Color(0xffCE8C8C),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    32))),
                                                    width: 148,
                                                    height: 56,
                                                    child: TextButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Text(
                                                          "Save",
                                                          style: GoogleFonts.poppins(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 14,
                                                              color: const Color(
                                                                  0xffFFFFFF)),
                                                        )),
                                                  ),
                                                ],
                                              )
                                            ]),
                                      )),
                                  Positioned(
                                    top: MediaQuery.of(context).size.height *
                                        0.270,
                                    right: MediaQuery.of(context).size.width *
                                        0.082,
                                    child: GestureDetector(
                                      child: const Icon(
                                        Icons.cancel,
                                        color: Color(0xffCE8C8C),
                                        size: 50,
                                      ),
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ));
                  });
                },
                child: Container(
                  margin:
                      new EdgeInsets.symmetric(horizontal: 4.0, vertical: 4),
                  alignment: Alignment.center,
                  height: 56,
                  width: 330,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color(0xffDADADA),
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                  //  color: Color(0xff267693),
                  child: Text(
                    "Finish onboarding",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        color: Color(0xffB0A9A9),
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                )),
          ])),
        ]),
      ),
    ));
  }
}

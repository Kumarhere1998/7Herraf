import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:herraf_app/acronym1.dart';
import 'package:herraf_app/acronym3.dart';
import 'package:herraf_app/main.dart';

typedef SwitchOnChange = Function(int);

class CustomSwitchState extends StatefulWidget {
  @override
  _CustomSwitchStateState createState() => _CustomSwitchStateState();
}

class _CustomSwitchStateState extends State<CustomSwitchState>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;
  int activePageIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffE5E5E5),
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: _menuBar(context),
                  ),
                  Expanded(
                    flex: 2,
                    child: PageView(
                      controller: _pageController,
                      physics: const ClampingScrollPhysics(),
                      onPageChanged: (int i) {
                        FocusScope.of(context).requestFocus(FocusNode());
                        setState(() {
                          activePageIndex = i;
                        });
                      },
                      children: <Widget>[
                        ConstrainedBox(
                            constraints: const BoxConstraints.expand(),
                            child: ListView(
                              children: <Widget>[
                                Container(
                                  //margin: new EdgeInsets.symmetric(horizontal: 19),
                                  padding: const EdgeInsets.only(
                                      top: 30, left: 10, right: 20),
                                  child: Text(
                                    "Room size",
                                    style: GoogleFonts.poppins(
                                      color: Color(0xff000000),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Container(
                                    padding: const EdgeInsets.only(
                                      top: 10,
                                      left: 105,
                                    ),
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          //margin: new EdgeInsets.symmetric(horizontal: 19),
                                          padding: const EdgeInsets.only(
                                              top: 5, left: 10, right: 10),
                                          child: Image.asset(
                                            'assets/images/Group(14).png',
                                            height: 45,
                                            width: 45,
                                            // width: MediaQuery.of(context).size.width * 0.94,
                                            // height: MediaQuery.of(context).size.height * 0.14,
                                          ), // <-- SEE
                                        ),
                                        Container(
                                          //margin: new EdgeInsets.symmetric(horizontal: 19),
                                          padding: const EdgeInsets.only(
                                              top: 5, left: 10, right: 10),
                                          child: Text(
                                            "2",
                                            style: GoogleFonts.poppins(
                                              color: Color(0xff000000),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Container(
                                          //margin: new EdgeInsets.symmetric(horizontal: 19),
                                          padding: const EdgeInsets.only(
                                              top: 5, left: 10, right: 20),
                                          child: Image.asset(
                                            'assets/images/Group(15).png',
                                            height: 45,
                                            width: 45,
                                            // width: MediaQuery.of(context).size.width * 0.94,
                                            // height: MediaQuery.of(context).size.height * 0.14,
                                          ), // <-- SEE
                                        ),
                                      ],
                                    )),
                                Container(
                                    padding: const EdgeInsets.only(
                                        top: 20, left: 40),
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          //margin: new EdgeInsets.symmetric(horizontal: 19),
                                          padding: const EdgeInsets.only(
                                              top: 5, left: 10, right: 10),
                                          child: Image.asset(
                                            'assets/images/Group 12.png',
                                            height: 118,
                                            width: 118,
                                            // width: MediaQuery.of(context).size.width * 0.94,
                                            // height: MediaQuery.of(context).size.height * 0.14,
                                          ), // <-- SEE
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Navigator.of(context)
                                                .push(MaterialPageRoute(
                                                    builder: (context) => MyApp
                                                        //CatalogPage
                                                        ()));
                                          },
                                          child: Container(
                                            //margin: new EdgeInsets.symmetric(horizontal: 19),
                                            padding: const EdgeInsets.only(
                                                top: 5, left: 30, right: 20),
                                            child: Image.asset(
                                              'assets/images/Auto Layout Horizontal(2).png',
                                              height: 123,
                                              width: 123,
                                              // width: MediaQuery.of(context).size.width * 0.94,
                                              // height: MediaQuery.of(context).size.height * 0.14,
                                            ), // <-- SEE
                                          ),
                                        )
                                      ],
                                    )),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 165,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: (context) => AcronymPage1
                                                //CatalogPage
                                                ()));
                                  },
                                  child: Container(
                                    margin: new EdgeInsets.symmetric(
                                        horizontal: 30.0, vertical: 0),
                                    width: 309,
                                    height: 53,
                                    decoration: BoxDecoration(
                                      color: Color(0xff0093ED),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Start random game',
                                        style: GoogleFonts.poppins(
                                          color: Color(0xffffffffff),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                        ConstrainedBox(
                            constraints: const BoxConstraints.expand(),
                            child: ListView(
                              children: <Widget>[
                                Container(
                                    padding: const EdgeInsets.only(
                                        top: 20, left: 40),
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          //margin: new EdgeInsets.symmetric(horizontal: 19),
                                          padding: const EdgeInsets.only(
                                              top: 5, left: 10, right: 10),
                                          child: Image.asset(
                                            'assets/images/Group 12.png',
                                            height: 118,
                                            width: 118,
                                            // width: MediaQuery.of(context).size.width * 0.94,
                                            // height: MediaQuery.of(context).size.height * 0.14,
                                          ), // <-- SEE
                                        ),
                                        Container(
                                          //margin: new EdgeInsets.symmetric(horizontal: 19),
                                          padding: const EdgeInsets.only(
                                              top: 5, left: 30, right: 20),
                                          child: Image.asset(
                                            'assets/images/Auto Layout Horizontal(2).png',
                                            height: 123,
                                            width: 123,
                                            // width: MediaQuery.of(context).size.width * 0.94,
                                            // height: MediaQuery.of(context).size.height * 0.14,
                                          ), // <-- SEE
                                        ),
                                      ],
                                    )),
                                Container(
                                  //margin: new EdgeInsets.symmetric(horizontal: 19),
                                  padding: const EdgeInsets.only(
                                      top: 25, left: 10, right: 10),
                                  child: Text(
                                    "vs",
                                    style: GoogleFonts.poppins(
                                      color: Color(0xff000000),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Container(
                                    padding: const EdgeInsets.only(
                                        top: 20, left: 10),
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          //margin: new EdgeInsets.symmetric(horizontal: 19),
                                          padding: const EdgeInsets.only(
                                              top: 5, left: 30, right: 20),
                                          child: Image.asset(
                                            'assets/images/Auto Layout Horizontal(2).png',
                                            height: 123,
                                            width: 123,
                                            // width: MediaQuery.of(context).size.width * 0.94,
                                            // height: MediaQuery.of(context).size.height * 0.14,
                                          ), // <-- SEE
                                        ),
                                        Container(
                                          //margin: new EdgeInsets.symmetric(horizontal: 19),
                                          padding: const EdgeInsets.only(
                                              top: 5, left: 20, right: 20),
                                          child: Image.asset(
                                            'assets/images/Auto Layout Horizontal(2).png',
                                            height: 123,
                                            width: 123,
                                            // width: MediaQuery.of(context).size.width * 0.94,
                                            // height: MediaQuery.of(context).size.height * 0.14,
                                          ), // <-- SEE
                                        ),
                                      ],
                                    )),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 65,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    // Navigator.of(context)
                                    //     .push(MaterialPageRoute(
                                    //         builder: (context) => MyApp
                                    //             //CatalogPage
                                    //             ()));
                                  },
                                  child: Container(
                                    margin: new EdgeInsets.symmetric(
                                        horizontal: 30.0, vertical: 0),
                                    width: 309,
                                    height: 53,
                                    decoration: BoxDecoration(
                                      color: Color(0xff0093ED),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Start random game',
                                        style: GoogleFonts.poppins(
                                          color: Color(0xffffffffff),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Widget _menuBar(BuildContext context) {
    return Container(
      width: 230.0,
      height: 49.0,
      decoration: const BoxDecoration(
        color: Color(0XFFE0E0E0),
        borderRadius: BorderRadius.all(Radius.circular(36.0)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: InkWell(
              //  borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
              onTap: _onPlaceBidButtonPress,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 15),
                alignment: Alignment.center,
                decoration: (activePageIndex == 0)
                    ? const BoxDecoration(
                        color: Color(0xff0093ED),
                        borderRadius: BorderRadius.all(Radius.circular(36.0)),
                      )
                    : const BoxDecoration(
                        color: Color(0xffE5E5E5),
                        borderRadius: BorderRadius.all(Radius.circular(36.0)),
                      ),
                child: Text(
                  "Single",
                  //  style: GoogleFonts.poppins(
                  // color: Color(0xff0093ED),
                  // fontSize: 18,
                  // fontWeight: FontWeight.w600),
                  style: (activePageIndex == 0)
                      ? TextStyle(
                          color: Color(0xffFFFFFFF),
                          fontSize: 16,
                          fontWeight: FontWeight.w600)
                      : TextStyle(
                          color: Color(0xff0093ED),
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              // borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
              onTap: _onBuyNowButtonPress,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 15),
                alignment: Alignment.center,
                decoration: (activePageIndex == 1)
                    ? const BoxDecoration(
                        color: Color(0xff0093ED),
                        borderRadius: BorderRadius.all(Radius.circular(36.0)),
                      )
                    : const BoxDecoration(
                        color: Color(0xffE5E5E5),
                        borderRadius: BorderRadius.all(Radius.circular(36.0)),
                      ),
                child: Text(
                  "2x2",
                  style: (activePageIndex == 1)
                      ? TextStyle(
                          color: Color(0xffFFFFFFF),
                          fontSize: 16,
                          fontWeight: FontWeight.w600)
                      : TextStyle(
                          color: Color(0xff0093ED),
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onPlaceBidButtonPress() {
    _pageController.animateToPage(0,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  void _onBuyNowButtonPress() {
    _pageController.animateToPage(1,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }
}

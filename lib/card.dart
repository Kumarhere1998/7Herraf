import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:herraf_app/api_servivce.dart';
import 'package:herraf_app/procedcard.dart';
import 'package:herraf_app/thankucheckout.dart';

class Cardcreen extends StatefulWidget {
  @override
  _CardcreenState createState() => _CardcreenState();
}

class _CardcreenState extends State<Cardcreen> {
  int _selection = 0;

  selectTime(dynamic timeSelected) {
    setState(() {
      _selection = timeSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    var imageFile;
    var radio5;
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      appBar: AppBar(
        backgroundColor: Color(0xffDADADA),
        //  backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: InkWell(
          onTap: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => CartOnePage()),
            // );
          },
          child: Container(
            child: Text("Checkout",
                style: GoogleFonts.poppins(
                    color: const Color(0xff212121),
                    fontSize: 16,
                    fontWeight: FontWeight.w500)),
          ),
        ),
        leading: InkWell(
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
      ),
      // appBar: AppBar(
      //   title: Container(
      //     padding: const EdgeInsets.only(top: 0, left: 90),
      //     child: Text(
      //       "Profile",
      //       style: TextStyle(
      //         color: Color(0xcc343434),
      //         fontSize: 20,
      //       ),
      //     ),
      //   ),
      //   leading: IconButton(
      //     onPressed: () {
      //       // Navigator.of(context).pushReplacement(
      //       //     MaterialPageRoute(builder: (context) => Fuzzy()));
      //     },
      //     icon: const Icon(Icons.arrow_back),
      //     color: Colors.grey[800],
      //   ),
      //   backgroundColor: Colors.transparent,
      //   elevation: 0.0,
      // ),
      body: SingleChildScrollView(
          child: Container(
        child: Container(
          margin: new EdgeInsets.symmetric(horizontal: 20),
          padding: EdgeInsets.only(top: 20),
          width: double.infinity,

          //  height: 350.0,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(top: 10),
                child: Image.asset(
                  'assets/images/checkout3.png',
                  height: 75,
                  width: 330,
                ),
              ),
              Center(
                  child: Column(children: <Widget>[
                Container(
                  width: 350,
                  height: 130,
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(5),
                  child: Column(
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: radio5,
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 20),
                            child: Image.asset(
                              'assets/images/visa.png',
                              height: 40,
                              width: 65,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 100, top: 10),
                            child: Text(
                              "03/25",
                              style: GoogleFonts.poppins(
                                  color: Color(0xff212121),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (ctx) => Container(
                                        height: 50,
                                        width: 250,
                                        child: AlertDialog(
                                            backgroundColor:
                                                const Color(0xffFAFAFA),
                                            content: SizedBox(
                                              height: 100,
                                              child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: <Widget>[
                                                        Container(
                                                          child: Text(
                                                            "Delete card?",
                                                            style: GoogleFonts.poppins(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: 20,
                                                                color: const Color(
                                                                    0xff212121)),
                                                          ),
                                                        ),
                                                        Container(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 65),
                                                          child: Image.asset(
                                                            'assets/images/delete.png',
                                                            height: 15,
                                                            width: 40,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Container(
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  const BorderRadius
                                                                          .all(
                                                                      Radius.circular(
                                                                          8)),
                                                              border: Border.all(
                                                                  width: 1,
                                                                  color: const Color(
                                                                      0xffB0A9A9),
                                                                  style: BorderStyle
                                                                      .solid)),
                                                          width: 110,
                                                          height: 53,
                                                          child: TextButton(
                                                              onPressed: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              },
                                                              child: Text(
                                                                "Cancel",
                                                                style: GoogleFonts.poppins(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontSize:
                                                                        14,
                                                                    color: const Color(
                                                                        0xffB0A9A9)),
                                                              )),
                                                        ),
                                                        Container(
                                                          decoration: const BoxDecoration(
                                                              color: Color(
                                                                  0xffCE8C8C),
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          8))),
                                                          width: 110,
                                                          height: 53,
                                                          child: TextButton(
                                                              onPressed: () {},
                                                              child: Text(
                                                                "Delete",
                                                                style: GoogleFonts.poppins(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontSize:
                                                                        14,
                                                                    color: const Color(
                                                                        0xffFFFFFF)),
                                                              )),
                                                        ),
                                                      ],
                                                    )
                                                  ]),
                                            )),
                                      ));
                            },
                            child: Container(
                                padding:
                                    const EdgeInsets.only(left: 30, top: 5),
                                child: Icon(
                                  Icons.delete,
                                  color: Color(0xffE9361C),
                                )),
                          )
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 10, left: 100),
                        child: Image.asset(
                          'assets/images/card number.png',
                          height: 40,
                          width: 216,
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: Color(0xfffffffff),
                      border: Border.all(
                        color: Color(0xffF7F2F4).withOpacity(0.9),
                        width: 2,
                      )),
                ),
              ])),
              Padding(
                padding: const EdgeInsets.only(top: 20),
              ),
              InkWell(
                onTap: () {
                  // Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (context) => HelpPage3
                  //         //CatalogPage
                  //         ()));
                },
                child: Container(
                    padding: const EdgeInsets.only(left: 100),
                    width: 330,
                    height: 56,
                    decoration: BoxDecoration(
                      color: Color(0xffDADADA),
                      border: Border.all(
                        width: 1,
                        color: Color(0xffB0A9A9),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Text(
                            "Add card",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                color: Color(0xffB0A9A9),
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                        ),
                        Icon(
                          Icons.add,
                          color: Color(0xffB0A9A9),
                        ),
                      ],
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 170, right: 20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    child: Text(
                      "Amount:",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          color: Color(0xffB0A9A9),
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                  ),
                  Container(
                    child: Text(
                      "12€",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          color: Color(0xff212121),
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(left: 7, top: 50),
                child: RichText(
                  text: TextSpan(
                      text:
                          "By proceeding with a checkout process you agree with our ",
                      style: GoogleFonts.poppins(
                          color: Color(0xFF786E6E),
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                      children: [
                        TextSpan(
                          text: "refund policy",
                          style: GoogleFonts.poppins(
                              color: Color(0xFFCE8C8C),
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        )
                      ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Thankucheckout
                          //CatalogPage
                          ("")));
                },
                child: Container(
                    padding: const EdgeInsets.only(left: 60),
                    width: 330,
                    height: 56,
                    decoration: BoxDecoration(
                      color: Color(0xffCE8C8C),
                      // border: Border.all(
                      //   width: 1,
                      //   //  color: Color(0xffB0A9A9),
                      // ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Text(
                            "Proceed with debit card",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                color: Color(0xfffffffff),
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: Color(0xffffffff),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      )),
    );
  }
}

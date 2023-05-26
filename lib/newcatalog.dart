// TODO Implement this library.// ignore_for_file: prefer_const_constructors, unnecessary_new, implementation_imports

// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:herraf_app/addcheckout.dart';

import 'package:herraf_app/api_servivce.dart';
import 'package:herraf_app/catalog2.dart';
import 'package:herraf_app/catalog3.dart';

import 'package:herraf_app/testfile.dart';
import 'package:herraf_app/textshowmore.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CatalogScreen1 extends StatefulWidget {
  // final addtocart _data = addtocart();
  ////const CatalogPage({Key? key}) : super(key: key);

  @override
  State<CatalogScreen1> createState() => _CatalogScreen1State();
}

class AddtoCart {
  String user_id = "";
  String pack_id = '';
  String price = '';
  String discount = '';
  String quantity = '';
}

class _CatalogScreen1State extends State<CatalogScreen1> {
  AddtoCart _addtocart = new AddtoCart();
  final GlobalKey webViewKey = GlobalKey();

  //final GlobalKey<ScaffoldState> _key = GlobalKey();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  // void register(){
  //   ApiService.login(_data).then((value)  {

  //   });

  int totalCartItems = 10;

  List catalog = [];

  var user_id;
  @override
  void initState() {
    catalogdata();
    addtocartdata();
    _saveUserInfo();

    myflashcard();
    super.initState();
  }

  bool isLoading = true;

  Future<void> _saveUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      // id = prefs.getString("id");
      _addtocart.user_id = prefs.getString('user_id')!;
      print(_addtocart.user_id);
      print('hyy');
    });
  }

  catalogdata() {
    ApiService.catalogdata().then((value) {
      print("hoglllg");
      setState(() {
        print("rakhi${value}");
        catalog = value["data"];
      });
    });
  }

  var cart;

  addtocart(item) async {
    _addtocart.pack_id = item["id"].toString();
    _addtocart.price = item["pack_price"].toString();
    _addtocart.discount = item["pack_discount"].toString();
    _addtocart.quantity = "1";
    print(_addtocart.pack_id);
    ApiService.addtocart(_addtocart).then((value) {
      print("hjhjhh${value}");
      setState(() {
        cart = value;
        print("yhjjh");
        print("print addtocart${cart}");
        print("addtocart${cart.length}");
        addtocartdata();
      });
    });
  }

  var carttt = [];
  addtocartdata() {
    var id = ApiService.addtocartdata(_addtocart.user_id).then((value) {
      print("hoglllg");
      setState(() {
        print("rakhi${value}");
        //carttt = value;
        totalCartItems = value?.length;
        print("print addtocartdata${totalCartItems}");
      });
    });
  }

  var flashcard;

  Future<void> myflashcard() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    ApiService.myflashcard(pref.getString('user_id')).then((value) {
      // ApiService.class_data("3,4", pref.getString("token"),date).then((value) {

      setState(() {
        flashcard = value["data"];
        print("myflashcard");
        print("classdata$flashcard");
        print("classlength${flashcard.flashcard}");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var imageFile;
    return Scaffold(
        backgroundColor: Color(0xffDADADA),
        body: SingleChildScrollView(
            padding: const EdgeInsets.only(
              top: 10,
            ),
            child: Container(
                // height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: const DecorationImage(
                      image: AssetImage("assets/images/background-top(2).png"),
                      fit: BoxFit.cover),
                ),
                // padding: new EdgeInsets.all(20.0),
                child: Column(children: [
                  Container(
                    padding: const EdgeInsets.only(top: 35),
                    margin: new EdgeInsets.symmetric(
                      horizontal: 20.0,
                    ),
                    alignment: Alignment.centerLeft,
                    child: Row(children: <Widget>[
                      Icon(
                        Icons.arrow_back,
                        size: 30,
                        color: Color(0xff212121),
                      ),
                      Padding(padding: const EdgeInsets.only(left: 12)),
                      Text(
                        "Cards catalogs",
                        style: GoogleFonts.poppins(
                            color: Color(0xff212121),
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      Padding(padding: const EdgeInsets.only(right: 120)),
                      Text(
                        "cart (0)",
                        style: GoogleFonts.poppins(
                            color: Color(0xffB0A9A9),
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ]),
                  ),
                  Container(
                    // color: Color(0xffDADADA),
                    margin: new EdgeInsets.symmetric(
                      horizontal: 22.0,
                    ),
                    padding: const EdgeInsets.only(top: 30),
                    height: MediaQuery.of(context).size.height * 0.9,
                    child: DefaultTabController(
                        length: 2,
                        child: Scaffold(
                            appBar: PreferredSize(
                              preferredSize: Size.fromHeight(kToolbarHeight),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 3.0, left: 3.0, right: 3.0, bottom: 3),
                                child: Container(
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Color(0xFFffffffff), width: 2.0),
                                    borderRadius: BorderRadius.circular(8),
                                    color: Color(0xFFffffffff),
                                  ),
                                  child: TabBar(
                                    labelColor: Color(0xFFffffff),
                                    indicator: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color: Color(0xFFCE8C8C),
                                    ),
                                    unselectedLabelColor: Color(0xFFCE8C8C),
                                    tabs: [
                                      Tab(
                                        text: "All",
                                      ),
                                      Tab(
                                        text: "My flashcards",
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            body: TabBarView(children: [
                              Container(
                                  padding: const EdgeInsets.only(
                                    top: 40.0,
                                  ),
                                  color: Color(0xffF3F1F1),
                                  margin: new EdgeInsets.symmetric(
                                    horizontal: 0.0,
                                  ),
                                  child: ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      itemCount: catalog.length,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Catalogdescription(
                                                          catalog[index]
                                                              ['pack_name'],
                                                          catalog[index][
                                                              'pack_description'],
                                                          catalog[index]
                                                              ['image1'],
                                                          catalog[index]
                                                              ['pack_category'],
                                                          catalog[index]
                                                              ['pack_price'],
                                                          catalog[index]
                                                              ['pack_discount'],
                                                        )),
                                              );
                                            },
                                            child: Container(
                                                margin:
                                                    new EdgeInsets.symmetric(
                                                        horizontal: 0.0,
                                                        vertical: 10),
                                                //   height: 210.0,

                                                child: Column(children: [
                                                  Row(children: [
                                                    Container(
                                                        width: 340,
                                                        height: 700,
                                                        child: Card(
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                            side: BorderSide(
                                                                color: Color(
                                                                    0xffDADADA),
                                                                width: 0),
                                                          ),
                                                          // shadowColor: Colors.grey,
                                                          //  elevation: 2,
                                                          child: Column(
                                                            children: <Widget>[
                                                              InkWell(
                                                                onTap: (() {
                                                                  Navigator.push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                          builder: (context) => Catalogdescription(
                                                                                catalog[index]['pack_name'],
                                                                                catalog[index]['pack_description'],
                                                                                catalog[index]['image1'],
                                                                                catalog[index]['pack_category'],
                                                                                catalog[index]['pack_price'],
                                                                                catalog[index]['pack_discount'],
                                                                              )));
                                                                }),
                                                                child:
                                                                    Container(
                                                                  width: 300,
                                                                  height: 363,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    // color: Colors.white,
                                                                    image: DecorationImage(
                                                                        image: NetworkImage(
                                                                            'http://165.22.215.103:4000/uploads/${catalog[index]["image1"]}'),
                                                                        fit: BoxFit
                                                                            .cover),

                                                                    borderRadius:
                                                                        BorderRadius.all(
                                                                            Radius.circular(0.0)),
                                                                  ),
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      left: 5,
                                                                      right: 5,
                                                                      top: 5),
                                                                  margin: const EdgeInsets
                                                                          .only(
                                                                      left: 5,
                                                                      right: 5,
                                                                      top: 15),

                                                                  // color: Colors.orang
                                                                ),
                                                              ),
                                                              InkWell(
                                                                  onTap: () {
                                                                    // Navigator.push(
                                                                    //   context,
                                                                    //   MaterialPageRoute(
                                                                    // builder: (context) => Ourmembers()
                                                                    //),
                                                                    // );
                                                                  },
                                                                  child: Row(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: <
                                                                        Widget>[
                                                                      Container(
                                                                        padding:
                                                                            EdgeInsets.only(
                                                                          top:
                                                                              9,
                                                                          left:
                                                                              35,
                                                                        ),
                                                                        // padding:
                                                                        //     EdgeInsets.only(top: 9, left: 8, bottom: 9),
                                                                        child:
                                                                            Text(
                                                                          catalog[index]
                                                                              [
                                                                              "pack_name"],
                                                                          style: GoogleFonts.poppins(
                                                                              color: Color(0xFF212121),
                                                                              fontSize: 18,
                                                                              fontWeight: FontWeight.w500),
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  )),
                                                              Container(
                                                                margin: new EdgeInsets
                                                                    .symmetric(),
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        35,
                                                                    vertical:
                                                                        5),
                                                                child: Text(
                                                                  catalog[index]
                                                                      [
                                                                      "pack_description"],
                                                                  style: GoogleFonts
                                                                      .poppins(
                                                                    color: Color(
                                                                        0x806B6665),
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                                  //textAlign: TextAlign.left,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .justify,
                                                                ),
                                                              ),
                                                              Row(
                                                                // mainAxisAlignment:
                                                                //     MainAxisAlignment
                                                                //         .spaceBetween,
                                                                children: <
                                                                    Widget>[
                                                                  Padding(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .only(
                                                                      left: 35,
                                                                    ),
                                                                  ),
                                                                  Row(
                                                                    children: <
                                                                        Widget>[
                                                                      RichText(
                                                                        text: TextSpan(
                                                                            text:
                                                                                "€",
                                                                            style: GoogleFonts.poppins(
                                                                                color: Color(0xFF786E6E),
                                                                                fontSize: 18,
                                                                                fontWeight: FontWeight.w500),
                                                                            children: [
                                                                              TextSpan(
                                                                                text: catalog[index]["pack_price"],
                                                                                style: GoogleFonts.poppins(color: Color(0xff786E6E), fontSize: 18, fontWeight: FontWeight.w500),
                                                                              )
                                                                            ]),
                                                                      ),
                                                                      Padding(
                                                                        padding:
                                                                            const EdgeInsets.only(
                                                                          left:
                                                                              15,
                                                                        ),
                                                                      ),
                                                                      RichText(
                                                                        text: TextSpan(
                                                                            text:
                                                                                "€",
                                                                            style: GoogleFonts.poppins(
                                                                                color: Color(0xFF212121),
                                                                                fontSize: 32,
                                                                                fontWeight: FontWeight.w500),
                                                                            children: [
                                                                              TextSpan(
                                                                                text: catalog[index]["pack_discount"],
                                                                                style: GoogleFonts.poppins(color: Color(0xFF212121), fontSize: 32, fontWeight: FontWeight.w500),
                                                                              )
                                                                            ]),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        right:
                                                                            35),
                                                                  ),
                                                                  Row(
                                                                    children: <
                                                                        Widget>[
                                                                      InkWell(
                                                                          onTap:
                                                                              () {
                                                                            () async {
                                                                              addtocart(catalog[index]);
                                                                            };
                                                                          },
                                                                          child: Container(
                                                                              alignment: Alignment.center,
                                                                              height: 56,
                                                                              decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(8),
                                                                                color: Color(0xfffffffff),
                                                                              ),

                                                                              //  color: Color(0xff267693),
                                                                              child: Row(
                                                                                children: <Widget>[
                                                                                  Icon(
                                                                                    Icons.add,
                                                                                    color: Color(0xffCE8C8C),
                                                                                  ),
                                                                                  Text(
                                                                                    "Add to cart",
                                                                                    textAlign: TextAlign.center,
                                                                                    style: GoogleFonts.poppins(color: Color(0xffCE8C8C), fontSize: 14, fontWeight: FontWeight.w500),
                                                                                  ),
                                                                                ],
                                                                              ))),
                                                                    ],
                                                                  )
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                          // margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0),
                                                        ))
                                                  ])
                                                ])));
                                      })),
                              Container(
                                margin: new EdgeInsets.symmetric(
                                  horizontal: 0.0,
                                ),
                                // child: Padding(
                                //  padding: const EdgeInsets.all(8.0),
                                child: ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    itemCount: flashcard.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                          margin: new EdgeInsets.symmetric(
                                              horizontal: 0.0, vertical: 10),
                                          //   height: 210.0,

                                          child: Column(children: [
                                            Row(children: [
                                              Container(
                                                  width: 340,
                                                  height: 400,
                                                  child: Card(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.0),
                                                      side: BorderSide(
                                                          color:
                                                              Color(0xffDADADA),
                                                          width: 0),
                                                    ),
                                                    // shadowColor: Colors.grey,
                                                    //  elevation: 2,
                                                    child: Column(
                                                      children: <Widget>[
                                                        InkWell(
                                                          onTap: (() {
                                                            // Navigator.push(
                                                            //     context,
                                                            //     MaterialPageRoute(
                                                            //         builder: (context) => Catalogdescription(
                                                            //               catalog[index]['pack_name'],
                                                            //               catalog[index]['pack_description'],
                                                            //               catalog[index]['image1'],
                                                            //               catalog[index]['pack_category'],
                                                            //               catalog[index]['pack_price'],
                                                            //               catalog[index]['pack_discount'],
                                                            //             )));
                                                          }),
                                                          child: Container(
                                                            width: 300,
                                                            height: 163,
                                                            decoration:
                                                                BoxDecoration(
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: Color(
                                                                          0xffDADADA),
                                                                    ),
                                                                    image: DecorationImage(
                                                                        image: AssetImage(
                                                                            "assets/images/cardd.png"),
                                                                        fit: BoxFit
                                                                            .cover),
                                                                    borderRadius:
                                                                        BorderRadius.all(
                                                                            Radius.circular(2))),
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 5,
                                                                    right: 5,
                                                                    top: 5),
                                                            margin:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 5,
                                                                    right: 5,
                                                                    top: 15),

                                                            // color: Colors.orang
                                                          ),
                                                        ),
                                                        InkWell(
                                                            onTap: () {
                                                              // Navigator.push(
                                                              //   context,
                                                              //   MaterialPageRoute(
                                                              // builder: (context) => Ourmembers()
                                                              //),
                                                              // );
                                                            },
                                                            child: Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: <
                                                                  Widget>[
                                                                Container(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .only(
                                                                    top: 9,
                                                                    left: 15,
                                                                  ),
                                                                  // padding:
                                                                  //     EdgeInsets.only(top: 9, left: 8, bottom: 9),
                                                                  child: Text(
                                                                    'Pneumo',
                                                                    style: GoogleFonts.poppins(
                                                                        color: Color(
                                                                            0xFF212121),
                                                                        fontSize:
                                                                            18,
                                                                        fontWeight:
                                                                            FontWeight.w500),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                  ),
                                                                ),
                                                              ],
                                                            )),
                                                        InkWell(
                                                            onTap: () {
                                                              // Navigator.push(
                                                              //   context,
                                                              //   MaterialPageRoute(
                                                              // builder: (context) => Ourmembers()
                                                              //),
                                                              // );
                                                            },
                                                            child: Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: <
                                                                  Widget>[
                                                                Container(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .only(
                                                                    top: 0,
                                                                    left: 15,
                                                                  ),
                                                                  child: Text(
                                                                    flashcard[
                                                                            index]
                                                                        [
                                                                        "pack_name"],
                                                                    style: GoogleFonts.poppins(
                                                                        color: Color(
                                                                            0xFF786E6E),
                                                                        fontSize:
                                                                            14,
                                                                        fontWeight:
                                                                            FontWeight.w400),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                  ),
                                                                ),
                                                              ],
                                                            )),
                                                        Row(
                                                          // mainAxisAlignment:
                                                          //     MainAxisAlignment
                                                          //         .spaceBetween,
                                                          children: <Widget>[
                                                            Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .only(
                                                                left: 15,
                                                              ),
                                                            ),
                                                            Row(
                                                              children: <
                                                                  Widget>[
                                                                RichText(
                                                                  text: TextSpan(
                                                                      text: "€",
                                                                      style: GoogleFonts.poppins(
                                                                          color: Color(
                                                                              0xFF786E6E),
                                                                          fontSize:
                                                                              18,
                                                                          fontWeight:
                                                                              FontWeight.w500),
                                                                      children: [
                                                                        TextSpan(
                                                                          text: flashcard[index]
                                                                              [
                                                                              "price"],
                                                                          style: GoogleFonts.poppins(
                                                                              color: Color(0xff786E6E),
                                                                              fontSize: 18,
                                                                              fontWeight: FontWeight.w500),
                                                                        )
                                                                      ]),
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .only(
                                                                    left: 15,
                                                                  ),
                                                                ),
                                                                RichText(
                                                                  text: TextSpan(
                                                                      text: "€",
                                                                      style: GoogleFonts.poppins(
                                                                          color: Color(
                                                                              0xFF212121),
                                                                          fontSize:
                                                                              32,
                                                                          fontWeight:
                                                                              FontWeight.w500),
                                                                      children: [
                                                                        TextSpan(
                                                                          text: flashcard[index]
                                                                              [
                                                                              "discount"],
                                                                          style: GoogleFonts.poppins(
                                                                              color: Color(0xFF212121),
                                                                              fontSize: 32,
                                                                              fontWeight: FontWeight.w500),
                                                                        )
                                                                      ]),
                                                                ),
                                                              ],
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      right:
                                                                          60),
                                                            ),
                                                            Row(
                                                              children: <
                                                                  Widget>[
                                                                InkWell(
                                                                    onTap: () {
                                                                      () async {
                                                                        addtocart(
                                                                            catalog[index]);
                                                                      };
                                                                    },
                                                                    child: Container(
                                                                        alignment: Alignment.center,
                                                                        height: 56,
                                                                        decoration: BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8),
                                                                          color:
                                                                              Color(0xfffffffff),
                                                                        ),

                                                                        //  color: Color(0xff267693),
                                                                        child: Row(
                                                                          children: <
                                                                              Widget>[
                                                                            Icon(
                                                                              Icons.add,
                                                                              color: Color(0xffCE8C8C),
                                                                            ),
                                                                            Text(
                                                                              "Add to cart",
                                                                              textAlign: TextAlign.center,
                                                                              style: GoogleFonts.poppins(color: Color(0xffCE8C8C), fontSize: 14, fontWeight: FontWeight.w500),
                                                                            ),
                                                                          ],
                                                                        ))),
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    // margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0),
                                                  ))
                                              //Container(
                                              //     height: 700,
                                              //     width: 670,
                                              //     child: Card(
                                              //         color: Color(0xffE5E5E5),
                                              //         elevation: 0,
                                              //         shape: RoundedRectangleBorder(
                                              //           borderRadius: BorderRadius.all(
                                              //               Radius.circular(0)),
                                              //         ),
                                              //         child: Column(children: <Widget>[
                                              //           Stack(
                                              //             children: [
                                              //               Container(
                                              //                 width: 440.0,
                                              //                 height: 520.0,
                                              //                 decoration: BoxDecoration(
                                              //                   // color: Colors.white,
                                              //                   image: DecorationImage(
                                              //                       image: NetworkImage(
                                              //                           'http://165.22.215.103:4000/uploads/${flashcard[index]["pack_image"]}'),
                                              //                       fit: BoxFit.cover),
                                              //                   borderRadius:
                                              //                       BorderRadius.all(
                                              //                           Radius.circular(
                                              //                               0.0)),
                                              //                   // ignore: prefer_const_literals_to_create_immutables
                                              //                   // boxShadow: [
                                              //                   //   BoxShadow(blurRadius: 7.0, color: Colors.black)
                                              //                   // ]
                                              //                 ),
                                              //               ),
                                              //             ],
                                              //           ),
                                              //           Padding(
                                              //             padding:
                                              //                 const EdgeInsets.only(
                                              //               top: 15,
                                              //             ),
                                              //           ),
                                              //           Row(
                                              //             mainAxisAlignment:
                                              //                 MainAxisAlignment
                                              //                     .spaceBetween,
                                              //             children: <Widget>[
                                              //               Flexible(
                                              //                   //newly added
                                              //                   child: Container(
                                              //                 padding:
                                              //                     EdgeInsets.fromLTRB(
                                              //                         0.0,
                                              //                         0.0,
                                              //                         0.0,
                                              //                         15.0),
                                              //                 child: Text(
                                              //                     flashcard[index]
                                              //                         ["pack_name"],
                                              //                     style: GoogleFonts
                                              //                         .poppins(
                                              //                             //color: Colors.red,
                                              //                             color: Color(
                                              //                                 0xff00253A),
                                              //                             fontSize: 18,
                                              //                             fontWeight:
                                              //                                 FontWeight
                                              //                                     .w700)),
                                              //               )),
                                              //               Row(
                                              //                 children: <Widget>[
                                              //                   RichText(
                                              //                     text: TextSpan(
                                              //                         text: "€",
                                              //                         style: GoogleFonts.poppins(
                                              //                             color: Color(
                                              //                                 0xff333333),
                                              //                             fontSize: 14,
                                              //                             fontWeight:
                                              //                                 FontWeight
                                              //                                     .w500),
                                              //                         children: [
                                              //                           TextSpan(
                                              //                             text: flashcard[
                                              //                                         index]
                                              //                                     [
                                              //                                     "price"]
                                              //                                 .toString(),
                                              //                             style: GoogleFonts.poppins(
                                              //                                 color: Color(
                                              //                                     0xff333333),
                                              //                                 fontSize:
                                              //                                     14,
                                              //                                 fontWeight:
                                              //                                     FontWeight
                                              //                                         .w500),
                                              //                           )
                                              //                         ]),
                                              //                   ),
                                              //                   Padding(
                                              //                     padding:
                                              //                         const EdgeInsets
                                              //                                 .only(
                                              //                             left: 0,
                                              //                             right: 20),
                                              //                   ),
                                              //                   RichText(
                                              //                     text: TextSpan(
                                              //                         text: "€",
                                              //                         style: GoogleFonts.poppins(
                                              //                             color: Color(
                                              //                                 0xff0093ED),
                                              //                             fontSize: 24,
                                              //                             fontWeight:
                                              //                                 FontWeight
                                              //                                     .w700),
                                              //                         children: [
                                              //                           TextSpan(
                                              //                             text: flashcard[
                                              //                                         index]
                                              //                                     [
                                              //                                     "discount"]
                                              //                                 .toString(),
                                              //                             style: GoogleFonts.poppins(
                                              //                                 color: Color(
                                              //                                     0xff0093ED),
                                              //                                 fontSize:
                                              //                                     24,
                                              //                                 fontWeight:
                                              //                                     FontWeight
                                              //                                         .w700),
                                              //                           )
                                              //                         ]),
                                              //                   ),
                                              //                 ],
                                              //               )
                                              //             ],
                                              //           ),
                                              //           Container(
                                              //             padding:
                                              //                 const EdgeInsets.only(
                                              //                     top: 20.0,
                                              //                     bottom: 20),
                                              //             child: Container(
                                              //               color: Color(0xff0093ED),
                                              //               child: FlatButton(
                                              //                 minWidth: 370.0,
                                              //                 height: 50,
                                              //                 onPressed: () {
                                              //                   //addtocart();
                                              //                 },
                                              //                 child: Text(
                                              //                   'Buy for a friend',
                                              //                   // ignore: prefer_const_constructors, unnecessary_new
                                              //                   style:
                                              //                       GoogleFonts.poppins(
                                              //                           color: Color(
                                              //                               0xfffffffff),
                                              //                           fontSize: 14,
                                              //                           fontWeight:
                                              //                               FontWeight
                                              //                                   .w600),
                                              //                 ),
                                              //                 textColor:
                                            ])
                                          ]));
                                    }),
                              ),
                            ]))),
                  )
                ]))));
  }
}

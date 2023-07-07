// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:herraf_app/addcheckout.dart';

import 'package:herraf_app/api_servivce.dart';

import 'package:shared_preferences/shared_preferences.dart';

class CatalogPage extends StatefulWidget {
  // final product_price = catalog[index]["pack_price"];
  // final discount_price = catalog[index]["pack_discount"];
  // double percent = (product_price) / (discount_price) * 100;

  // CatalogPage({this.product_price, this.discount_price});

  // final addtocart _data = addtocart();
  ////const CatalogPage({Key? key}) : super(key: key);

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class AddtoCart {
  String user_id = "";
  String pack_id = '';
  String price = '';
  String discount = '';
  String quantity = '';
}

class _CatalogPageState extends State<CatalogPage>
    with SingleTickerProviderStateMixin {
  AddtoCart _addtocart = new AddtoCart();
  final GlobalKey webViewKey = GlobalKey();

  //final GlobalKey<ScaffoldState> _key = GlobalKey();
  bool isLoading1 = true;
  late TabController _controller;
  // void register(){
  //   ApiService.login(_data).then((value)  {

  //   });

  // int totalCartItems = 0;

  List catalog = [];
  List totalCartItems = [];

  var user_id;

  @override
  void initState() {
    setState(() {
      _saveUserInfo();
      catalogdata();
      _controller = TabController(length: 2, vsync: this);

      _controller.addListener(() {
        setState(() {
          myflashcard();
        });
      });

      // myflashcard();
    });

    super.initState();
  }

  Future<void> _saveUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _addtocart.user_id = prefs.getString('user_id')!;
      addtocartdata();
    });
  }

  List<dynamic> carttt = [];

  bool isLoading = true;

  catalogdata() {
    ApiService.catalogdata().then((value) {
      setState(() {
        catalog = value["data"];
        isLoading1 = false;
      });
    });
  }

  var cart;

  addtocart(item) async {
    _addtocart.pack_id = item["id"].toString();
    _addtocart.price = item["pack_price"].toString();
    _addtocart.discount = item["pack_discount"].toString();
    _addtocart.quantity = "1";
    ApiService.addtocart(_addtocart).then((value) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(value['message'])));

      setState(() {
        cart = value;
        addtocartdata();
      });
    });
  }

  addtocartdata() {
    ApiService.addtocartdata(_addtocart.user_id).then((value) {
      setState(() {
        totalCartItems = [];
        totalCartItems = value['data'];
      });
    });
  }

  List flashcard = [];

  Future<void> myflashcard() async {
    ApiService.myflashcard().then((value) {
      print(value);
      flashcard = value["data"];
    });
  }

  @override
  Widget build(BuildContext context) {
    var Cart = totalCartItems;
    var cartItem = Cart.length;

    return Scaffold(
        backgroundColor: Color(0xffE5E5E5),
        body: Column(children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .250,
                child: Image.asset(
                  "assets/images/background-top(1).png",
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 50,
                left: 30,
                child: Container(
                  child: Row(children: <Widget>[
                    Padding(padding: const EdgeInsets.only(left: 8)),
                    Text(
                      "Cards catalog",
                      style: GoogleFonts.poppins(
                          color: Color(0xff212121),
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    Padding(padding: const EdgeInsets.only(right: 140)),
                    InkWell(
                      onTap: () async {
                        var nav = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CartOnePage()),
                        );
                        if (nav == true || nav == null) {
                          addtocartdata();
                        }
                      },
                      child: Container(
                        child: Text(
                          // 'Cart( ${cartItem}, €${_addtocart.price.toString()})',
                          'Cart ( $cartItem )',

                          style: GoogleFonts.poppins(
                              color: Color(0xFFB0A9A9),
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    )
                  ]),
                ),
              ),
              Positioned(
                top: 100,
                left: 40,
                child: Container(
                  width: MediaQuery.of(context).size.width * .8,
                  height: 50.0,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFffffffff), width: 2.0),
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0xFFffffffff),
                  ),
                  child: TabBar(
                    onTap: (index) {
                      myflashcard();

                      // Should not used it as it only called when tab options are clicked,
                      // not when user swapped
                    },
                    controller: _controller,
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
              )
            ],
          ),
          SingleChildScrollView(
            child: Container(
                height: MediaQuery.of(context).size.height * 0.630,
                width: MediaQuery.of(context).size.width,
                child: DefaultTabController(
                    length: 2,
                    child: Scaffold(
                        body: TabBarView(controller: _controller, children: [
                      Container(
                          color: Color(0xffE5E5E5),
                          //  padding: const EdgeInsets.only(bottom: 35, left: 25),
                          child: isLoading1
                              ? Center(
                                  child: CircularProgressIndicator(
                                      color: Color(0xffCE8C8C)))
                              : ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: catalog.length,
                                  itemBuilder: (context, index) {
                                    var total = catalog[index]["pack_price"];
                                    var discount =
                                        catalog[index]["pack_discount"];
                                    var priceall = int.parse(total) -
                                        (int.parse(total) *
                                            int.parse(discount) /
                                            100);

                                    return Column(children: [
                                      Container(
                                          width: 340,
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                              side: BorderSide(
                                                  color: Color(0xffDADADA),
                                                  width: 0),
                                            ),

                                            child: Column(
                                              children: <Widget>[
                                                Container(
                                                  width: 300,
                                                  height: 200,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                            'http://165.22.215.103:4000/uploads/${catalog[index]["image1"]}'),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                0.0)),
                                                  ),
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 5,
                                                          right: 5,
                                                          top: 5),
                                                  margin: const EdgeInsets.only(
                                                      left: 5,
                                                      right: 5,
                                                      top: 15),

                                                  // color: Colors.orang
                                                ),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                        top: 9,
                                                        left: 35,
                                                      ),
                                                      child: Text(
                                                        catalog[index]
                                                            ["pack_name"],
                                                        style:
                                                            GoogleFonts.poppins(
                                                                color: Color(
                                                                    0xFF212121),
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                        textAlign:
                                                            TextAlign.start,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                        left: 35,
                                                      ),
                                                    ),
                                                    Row(
                                                      children: <Widget>[
                                                        RichText(
                                                          text: TextSpan(
                                                              children: [
                                                                TextSpan(
                                                                  text:
                                                                      "€${catalog[index]["pack_price"]}",
                                                                  style: GoogleFonts.poppins(
                                                                      decoration:
                                                                          TextDecoration
                                                                              .lineThrough,
                                                                      color: Color(
                                                                          0xff786E6E),
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
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
                                                        Text(
                                                          '$priceall€',
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  color: Color(
                                                                      0xFF212121),
                                                                  fontSize: 20,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                        )
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 35),
                                                    ),
                                                    Row(
                                                      children: <Widget>[
                                                        InkWell(
                                                            onTap: () async {
                                                              addtocart(catalog[
                                                                  index]);
                                                            },
                                                            child: Container(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                height: 56,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8),
                                                                  color: Color(
                                                                      0xfffffffff),
                                                                ),

                                                                //  color: Color(0xff267693),
                                                                child: Row(
                                                                  children: <
                                                                      Widget>[
                                                                    Icon(
                                                                      Icons.add,
                                                                      color: Color(
                                                                          0xffCE8C8C),
                                                                    ),
                                                                    Text(
                                                                      "Add to cart",
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: GoogleFonts.poppins(
                                                                          color: Color(
                                                                              0xffCE8C8C),
                                                                          fontSize:
                                                                              14,
                                                                          fontWeight:
                                                                              FontWeight.w500),
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
                                    ]);
                                  })),
                      Container(
                          color: Color(0xffE5E5E5),
                          margin: new EdgeInsets.symmetric(
                            horizontal: 0.0,
                          ),
                          child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: flashcard.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                    onTap: () {},
                                    child: Column(children: [
                                      Row(children: [
                                        Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(
                                                    15.0),
                                            side: BorderSide(
                                                color:
                                                    Color(0xffDADADA),
                                                width: 0),
                                          ),
                            child: Center(child: Text('Flash Card')),
                                           )
                                      ])
                                    ]));
                              })),
                    ])))),
          ),
        ]));
  }
}
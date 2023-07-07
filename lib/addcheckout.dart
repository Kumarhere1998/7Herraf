import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:herraf_app/api_servivce.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';

import 'package:herraf_app/checkoutstep1.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartOnePage extends StatefulWidget {
  @override
  State<CartOnePage> createState() => _CartOnePageState();
}

class _CartOnePageState extends State<CartOnePage> {
  final List checkedCartItem = [];
  final GlobalKey<ExpansionTileCardState> cardA = new GlobalKey();
  List<String> list = <String>[
    '1',
    '2',
    '3',
  ];
  String dropdownValue = "1";
  List<String> litems = [];
  final TextEditingController eCtrl = TextEditingController();

  List<dynamic> carttt = [];

  @override
  void initState() {
    getCartdata();
    paymentdata();

    super.initState();
  }

  bool isLoading = true;
  bool isPressed = false;
  bool loading = true;

  Map pay = {};

  Future<void> paymentdata() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    ApiService.paymentdata(pref.getString('user_id')).then((value) {
      setState(() {
        pay = value["data"];
     
      });
    });
  }

  String? selectedString;
  List<String>? selectedDataString;

  getCartdata() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    ApiService.addtocartdata(pref.getString('user_id')).then((value) {

      setState(() {
        carttt = value['data'];
        isLoading = false;
      });
    });
  }

  var delete;

  Future<void> deletedata() async {
    ApiService.deletedata(checkedCartItem).then((value) {
      Future.delayed(const Duration(seconds: 1), () {
        getCartdata();
      });

      // paymentdata();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: <Widget>[
      Container(
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              child: Image.asset("assets/images/background-top(1).png"),
            ),
            Positioned(
              top: 50,
              left: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                      left: 20,
                    ),
                    child: checkedCartItem.length > 0
                        ? InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            // onTap: () async {
                            //   var nav =
                            //       await Navigator.of(context).push(newRoute);
                            //   if (nav == true || nav == null) {
                            //     Navigator.pop(context, true);
                            //   }
                            // },
                            child: Icon(
                              Icons.clear,
                              color: Color(0xff212121),
                            ))
                        : InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back,
                              size: 24,
                              color: Color(0xff212121),
                            ),
                          ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Cart (${carttt.length})",
                        style: GoogleFonts.poppins(
                            color: Color(0xFF212121),
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.53,
                  ),
                  checkedCartItem.length > 0
                      ? InkWell(
                          onTap: () {
                            setState(() {
                              deletedata();
                            });
                          },
                          child: Icon(
                            Icons.delete,
                            color: Color(0xff212121),
                            size: 26.0,
                          ))
                      : Container(),
                ],
              ),
            ),
          ],
        ),
      ),
      Expanded(
          child: isLoading
              ? Center(child: CircularProgressIndicator())
              : carttt.length == 0
                  ? Center(
                      child: Text(
                        "Your cart is emprty",
                        style: GoogleFonts.poppins(
                            color: Color(0xffB0A9A9), fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    )
                  : ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: carttt.length,
                      itemBuilder: (BuildContext context, int index) {

                        return Column(children: [
                          Container(
                              width: 340,
                              height: 310,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Stack(
                                      children: <Widget>[
                                        Container(
                                          height: 200,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    'http://165.22.215.103:4000/uploads/${carttt[index]["pack_image"]}'),
                                                fit: BoxFit.cover),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(0.0)),
                                          ),
                                          margin: const EdgeInsets.only(
                                              left: 10, right: 10, top: 15),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 20),
                                          padding: EdgeInsets.all(5),
                                          child: Checkbox(
                                              checkColor: Colors.red,
                                              activeColor: Color(0xffCE8C8C),
                                              splashRadius: 90,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              15.0))),
                                              value: checkedCartItem.contains(
                                                  carttt[index]["id"]),
                                              onChanged: (bool? value) {
                                                setState(() {
                                                  if (checkedCartItem.contains(
                                                      carttt[index]["id"])) {
                                                    checkedCartItem.remove(
                                                        carttt[index]["id"]);
                                                  } else {
                                                    checkedCartItem.add(
                                                        carttt[index]["id"]);
                                                    isPressed = true;
                                                  }
                                                });
                                              }),
                                        ),
                                      ],
                                    ),
                                    InkWell(
                                        onTap: () {},
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              padding: EdgeInsets.only(
                                                top: 9,
                                                left: 35,
                                              ),
                                              child: Text(
                                                carttt[index]["pack_name"],
                                                style: GoogleFonts.poppins(
                                                    color: Color(0xFF212121),
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                textAlign: TextAlign.start,
                                              ),
                                            ),
                                          ],
                                        )),
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
                                                  text: "€",
                                                  style: GoogleFonts.poppins(
                                                      color: Color(0xFF786E6E),
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                  children: [
                                                    TextSpan(
                                                      text: carttt[index]
                                                              ["price"]
                                                          .toString(),
                                                      style:
                                                          GoogleFonts.poppins(
                                                              color: Color(
                                                                  0xff786E6E),
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                    )
                                                  ]),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 15,
                                              ),
                                            ),
                                            RichText(
                                              text: TextSpan(
                                                  text: "€",
                                                  style: GoogleFonts.poppins(
                                                      color: Color(0xFF212121),
                                                      fontSize: 32,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                  children: [
                                                    TextSpan(
                                                      text: carttt[index]
                                                              ["discount"]
                                                          .toString(),
                                                      style:
                                                          GoogleFonts.poppins(
                                                              color: Color(
                                                                  0xFF212121),
                                                              fontSize: 32,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                    )
                                                  ]),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ))
                        ]);
                      })),
      carttt.length > 0
          ? Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: const BoxDecoration(
                  color: Color(0xffCE8C8C),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              width: 312,
              child: TextButton(
                onPressed: () {
                  paymentdata();
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => CheckOutStep()));
                },
                child: Container(
                  child: RichText(
                    text: TextSpan(
                        text: "Proceed to checkout",
                        style: GoogleFonts.poppins(
                            color: Color(0xFFfffffff),
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                        children: [
                          TextSpan(
                            text: "(",
                            style: GoogleFonts.poppins(
                                color: Color(0xFFfffffff),
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                          TextSpan(
                            text: "€",
                            style: GoogleFonts.poppins(
                                color: Color(0xFFfffffff),
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                          TextSpan(
                            text:
                                // ",",
                                pay["grandTotal"].toString(),
                            style: GoogleFonts.poppins(
                                color: Color(0xFFfffffff),
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                          TextSpan(
                            text: ")",
                            style: GoogleFonts.poppins(
                                color: Color(0xFFfffffff),
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          )
                        ]),
                  ),
                ),
              ))
          : Container(),
    ]));
  }
}

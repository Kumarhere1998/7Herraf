// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:herraf_app/api_servivce.dart';
import 'package:herraf_app/thankucheckout.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckOutStep2 extends StatefulWidget {
  int addressID;
  CheckOutStep2({required this.addressID});

  @override
  State<CheckOutStep2> createState() => _CheckOutStep2State();
}

class Cashdata {
  String user_id = '';
  String pack_id = '';
  String sub_total = '';
  String total = '';
  String amount = '';
  String status = '';
  String discount_price = '';
  String payment_method = '';
}

class _CheckOutStep2State extends State<CheckOutStep2> {
  TextEditingController Ccontroller = TextEditingController();

  var cashdata;
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    _saveUserInfo();
    print('AddressID==>${widget.addressID}');
    super.initState();
  }

  Cashdata _cashAddress = new Cashdata();

  Future<void> _saveUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _cashAddress.user_id = prefs.getString('user_id')!;
      getOrderDetails();
    });
  }

  Future<void> getOrderDetails() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    ApiService.paymentdata(pref.getString('user_id')).then((value) {
      setState(() {
        _cashAddress.sub_total = value["data"]["sub_total"].toString();
        _cashAddress.amount = value["data"]["subtotal"].toString();
        _cashAddress.total = value["data"]["grandTotal"].toString();
        _cashAddress.status = "In Progress";
        _cashAddress.discount_price = value["data"]["discount"].toString();
      });

      ;
    });
  }

  Map cash = {};
  makeOrder(method) async {
    _cashAddress.payment_method = method;
    if (method == 'Cash') {
      ApiService.casdeliveryhdata(_cashAddress, widget.addressID).then((value) {
        print('VALUE==>$value');
        if (value['status']) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => Thankucheckout(_cashAddress.total)));
        }
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("We are working on it !!")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          top: 10,
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 30),
              margin: new EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              alignment: Alignment.centerLeft,
              child: Row(children: <Widget>[
                Icon(
                  Icons.arrow_back,
                  size: 24,
                  color: Color(0xff212121),
                ),
                Padding(padding: const EdgeInsets.only(left: 8)),
                Text(
                  "Checkout",
                  style: GoogleFonts.poppins(
                      color: Color(0xff212121),
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                Padding(padding: const EdgeInsets.only(right: 210)),
                InkWell(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => CartOnePage()),
                    // );
                  },
                  child: Container(
                    child: Icon(
                      Icons.clear,
                      size: 24,
                      color: Color(0xff212121),
                    ),
                  ),
                )

                // Container(
                //   child: Image.asset(
                //     'assets/images/addcart.png',
                //     height: 32,
                //     width: 32,
                //     // width: MediaQuery.of(context).size.width * 0.94,
                //     // height: MediaQuery.of(context).size.height * 0.14,
                //   ), // <-- SEE HERE
                // ),
              ]),
            ),
            //  const SizedBox(height: 15),
            //   padding: const EdgeInsets.only(top: 30),

            // Padding(
            //     padding: const EdgeInsets.only(top: 3),
            //     child: Container(
            //       padding: const EdgeInsets.only(top: 30),
            //       margin: new EdgeInsets.symmetric(
            //         horizontal: 20.0,
            //       ),
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           Container(
            //             alignment: Alignment.center,
            //             height: 30,
            //             width: 30,
            //             decoration: const BoxDecoration(
            //               borderRadius: BorderRadius.all(Radius.circular(30)),
            //               color: Color(0xffCE8C8C),
            //             ),
            //             child: Text("1",
            //                 style: GoogleFonts.poppins(
            //                     color: const Color(0xffFFFFFF),
            //                     fontSize: 14,
            //                     fontWeight: FontWeight.w600)),
            //           ),
            //           Container(
            //             height: 3,
            //             width: 60,
            //             decoration: const BoxDecoration(
            //               borderRadius: BorderRadius.all(Radius.circular(24)),
            //               color: Color(0xffB0A9A9),
            //             ),
            //           ),
            //           Container(
            //             alignment: Alignment.center,
            //             height: 30,
            //             width: 30,
            //             decoration: const BoxDecoration(
            //               borderRadius: BorderRadius.all(Radius.circular(30)),
            //               color: Color(0xfffffffff),
            //             ),
            //             child: Text("2",
            //                 style: GoogleFonts.poppins(
            //                     color: const Color(0xffB0A9A9),
            //                     fontSize: 14,
            //                     fontWeight: FontWeight.w600)),
            //           ),
            //           Container(
            //             height: 3,
            //             width: 60,
            //             decoration: const BoxDecoration(
            //               borderRadius: BorderRadius.all(Radius.circular(24)),
            //               color: Color(0xffB0A9A9),
            //             ),
            //           ),
            //           Container(
            //             alignment: Alignment.center,
            //             height: 30,
            //             width: 30,
            //             decoration: const BoxDecoration(
            //               borderRadius: BorderRadius.all(Radius.circular(30)),
            //               color: Color(0xffffffff),
            //             ),
            //             child: Text("3",
            //                 style: GoogleFonts.poppins(
            //                     color: const Color(0xffB0A9A9),
            //                     fontSize: 14,
            //                     fontWeight: FontWeight.w600)),
            //           ),
            //         ],
            //       ),
            //     )),
            // const SizedBox(height: 10),
            // Container(
            //   padding: const EdgeInsets.only(top: 0),
            //   margin: new EdgeInsets.symmetric(
            //     horizontal: 20.0,
            //   ),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Text(
            //         "Address",
            //         style: GoogleFonts.poppins(
            //             fontWeight: FontWeight.w500,
            //             fontSize: 14,
            //             color: const Color(0xff212121)),
            //       ),
            //       Text(
            //         "Method",
            //         style: GoogleFonts.poppins(
            //             fontWeight: FontWeight.w500,
            //             fontSize: 14,
            //             color: const Color(0xff786E6E)),
            //       ),
            //       Text(
            //         "Payment",
            //         style: GoogleFonts.poppins(
            //             fontWeight: FontWeight.w500,
            //             fontSize: 14,
            //             color: const Color(0xff786E6E)),
            //       ),
            //     ],
            //   ),
            // ),
            Container(
              padding: const EdgeInsets.only(top: 40),
              child: Image.asset(
                'assets/images/checkout2.png',
                height: 75,
                width: 450,
              ),
            ),
            const SizedBox(height: 15),
            //   padding: const EdgeInsets.only(top: 30),

            Container(
              padding: const EdgeInsets.only(top: 60),
              margin: new EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: InkWell(
                onTap: () {
                  setState(() {
                    makeOrder("Cash");
                  });
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        border: Border.all(
                          color: const Color(0xff7E7E7E),
                          width: 1,
                        )),
                    height: 70,
                    width: MediaQuery.of(context).size.width * 0.88,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Cash",
                              style: GoogleFonts.poppins(
                                  color:
                                      // Colors.white
                                      const Color(0xff212121),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),

                            const Icon(
                              Icons.arrow_forward_ios,
                              color:
                                  // Colors.white
                                  const Color(0xff7E7E7E),
                            )
                            // const Icon(Icons.arrow_forward_ios)
                          ]),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 15),
              margin: new EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: InkWell(
                onTap: () {
                  makeOrder("Card");
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        border: Border.all(
                          color: const Color(0xff7E7E7E),
                          width: 1,

                          //        //color: isPayPalSelected
                        )),
                    height: 70,
                    width: MediaQuery.of(context).size.width * 0.88,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Card",
                              style: GoogleFonts.poppins(
                                  color:
                                      // Colors.white
                                      const Color(0xff212121),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),

                            const Icon(
                              Icons.arrow_forward_ios,
                              color:
                                  // Colors.white
                                  const Color(0xff7E7E7E),
                            )
                            // const Icon(Icons.arrow_forward_ios)
                          ]),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 15),
              margin: new EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: InkWell(
                onTap: () {
                  makeOrder("PayPal");
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        border: Border.all(
                          color: const Color(0xff7E7E7E),
                          width: 1,

                          //        //color: isPayPalSelected
                        )),
                    height: 70,
                    width: MediaQuery.of(context).size.width * 0.88,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "PayPal",
                              style: GoogleFonts.poppins(
                                  color:
                                      // Colors.white
                                      const Color(0xff212121),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),

                            const Icon(
                              Icons.arrow_forward_ios,
                              color:
                                  // Colors.white
                                  const Color(0xff7E7E7E),
                            )
                            // const Icon(Icons.arrow_forward_ios)
                          ]),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 20, top: 250),
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
          ],
        ),
      ),
    );
    //             Form(
    //               key: _formKey,
    //               child: Column(children: [
    //                 Column(
    //                   children: [
    //                     Padding(
    //                       padding: const EdgeInsets.symmetric(
    //                           horizontal: 25, vertical: 20),
    //                       child: Container(
    //                         alignment: Alignment.topLeft,
    //                         child: Text(
    //                           "Name",
    //                           style: GoogleFonts.poppins(
    //                               color: const Color(0xff333333),
    //                               fontSize: 14,
    //                               fontWeight: FontWeight.w600),
    //                         ),
    //                       ),
    //                     ),
    //                     SizedBox(
    //                       height: 60,
    //                       width: 331,
    //                       child: TextFormField(
    //                         validator: (value) {
    //                           if (value!.isEmpty ||
    //                               !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
    //                             //allow upper and lower case alphabets and space
    //                             return "Enter Correct Name";
    //                           } else {
    //                             return null;
    //                           }
    //                         },

    //                         // validator: (value) {
    //                         //   if (value!.isNotEmpty ||
    //                         //       !RegExp(r'^[a-z A-Z]+$').hasMatch(value!)) {
    //                         //     return "Enter Correct Name";
    //                         //   } else {
    //                         //     return null;
    //                         //   }
    //                         // },
    //                         controller: nameController,
    //                         keyboardType: TextInputType.text,
    //                         style: const TextStyle(),
    //                         decoration: InputDecoration(
    //                           filled: true,
    //                           fillColor: Colors.white,
    //                           enabledBorder: OutlineInputBorder(
    //                             borderSide: const BorderSide(
    //                                 color: Colors.grey, width: 0),
    //                             borderRadius: BorderRadius.circular(32.7),
    //                           ),
    //                           focusedBorder: OutlineInputBorder(
    //                             borderSide: const BorderSide(
    //                                 color: Color(0xffB0A9A9), width: 0),
    //                             borderRadius: BorderRadius.circular(32.7),
    //                           ),
    //                           border: OutlineInputBorder(
    //                             borderRadius: BorderRadius.circular(10),
    //                           ),
    //                           // hintText: 'Username',
    //                           hintStyle: GoogleFonts.poppins(
    //                               color: Color(0x80343434),
    //                               fontSize: 14,
    //                               fontWeight: FontWeight.w500),
    //                           // hintStyle: const TextStyle(
    //                           //     color: Color(0x80343434),
    //                           //     fontWeight: FontWeight.bold)
    //                         ),
    //                       ),
    //                     )
    //                   ],
    //                 ),
    //
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:herraf_app/api_servivce.dart';
import 'package:herraf_app/checkoutstep2.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckOutOne extends StatefulWidget {
  const CheckOutOne({Key? key}) : super(key: key);

  @override
  State<CheckOutOne> createState() => _CheckOutOneState();
}

class PostAddress {
  String name = 'name';
  String user_id = '';
  String email = '';
  String phone_no = '';
  String address = '';
  String city = '';
  String state = '';
  String zipcode = '';
}

class _CheckOutOneState extends State<CheckOutOne> {
  @override
  List<String> list = <String>['Morocco', 'Shanghai', 'Delhi', 'Tokyo'];
  String dropdownValue = "Morocco";
  TextEditingController Ccontroller = TextEditingController();
  //PostAddress _postAddress;

  final nameController = TextEditingController();

  final emailController = TextEditingController();

  final phoneController = TextEditingController();

  final addressController = TextEditingController();

  final zipController = TextEditingController();

  final cityController = TextEditingController();

  final stateController = TextEditingController();

  final countryController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
    zipController.dispose();
    cityController.dispose();
    stateController.dispose();
    super.dispose();
  }

  PostAddress postAddress = new PostAddress();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.arrow_back_ios_outlined,
                                  color: Color(0xff0093ED), size: 18)),
                          const SizedBox(
                            height: 30,
                            width: 15,
                          ),
                          Text(
                            "Checkout",
                            style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xff0093ED)),
                          )
                        ],
                      ),
                      const SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: 30,
                              width: 30,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                color: Color(0xff0093ED),
                              ),
                              child: Text("1",
                                  style: GoogleFonts.poppins(
                                      color: const Color(0xffFFFFFF),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600)),
                            ),
                            Container(
                              height: 3,
                              width: 60,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(24)),
                                color: Color(0xff686565),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 30,
                              width: 30,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                color: Color(0xffF1F6FF),
                              ),
                              child: Text("2",
                                  style: GoogleFonts.poppins(
                                      color: const Color(0xff686565),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600)),
                            ),
                            Container(
                              height: 3,
                              width: 60,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(24)),
                                color: Color(0xff686565),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 30,
                              width: 30,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                color: Color(0xffF1F6FF),
                              ),
                              child: Text("3",
                                  style: GoogleFonts.poppins(
                                      color: const Color(0xff686565),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600)),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Address",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                                color: const Color(0xff0093ED)),
                          ),
                          Text(
                            "Payment",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color:
                                    const Color(0xff00253A).withOpacity(0.3)),
                          ),
                          Text(
                            "Confirm",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color:
                                    const Color(0xff00253A).withOpacity(0.3)),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Column(children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 10),
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Name",
                              style: GoogleFonts.poppins(
                                  color: const Color(0xff333333),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 56,
                          width: 331,
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            // validator: (value) {
                            //   if (value!.isNotEmpty ||
                            //       !RegExp(r'^[a-z A-Z]+$').hasMatch(value!)) {
                            //     return "Enter Correct Name";
                            //   } else {
                            //     return null;
                            //   }
                            // },
                            controller: nameController,
                            keyboardType: TextInputType.text,
                            style: const TextStyle(),
                            decoration: const InputDecoration(
                                // errorText:
                                //     _validate ? 'Value Can\'t Be Empty' : null,
                                // hintText: "Name",
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xffE0E0E0), width: 2)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xffE0E0E0), width: 2))),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 10),
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Email",
                              style: GoogleFonts.poppins(
                                  color: const Color(0xff333333),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 56,
                          width: 331,
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            // validator: (value) {
                            //   if (value == null || value.isEmpty) {
                            //     return 'Please enter some text';
                            //   }
                            //   return null;
                            // },
                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                            style: const TextStyle(),
                            decoration: const InputDecoration(
                                // hintText: "Email",
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xffE0E0E0), width: 2)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xffE0E0E0), width: 2))),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 10),
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Phone no.",
                              style: GoogleFonts.poppins(
                                  color: const Color(0xff333333),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 56,
                          width: 331,
                          child: TextFormField(
                            // validator: (String value) {
                            //   if (value.isEmpty) {
                            //     return 'Phone number is Required';
                            //   }

                            //   return null;
                            // },
                            // validator: (value) {
                            //   if (value == null || value.isEmpty) {
                            //     return 'Please enter some text';
                            //   }
                            //   return null;
                            // },
                            keyboardType: TextInputType.number,
                            controller: phoneController,
                            style: const TextStyle(),
                            decoration: const InputDecoration(
                                // hintText: "Phone no.",
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xffE0E0E0), width: 2)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xffE0E0E0), width: 2))),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 10),
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Address",
                              style: GoogleFonts.poppins(
                                  color: const Color(0xff333333),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 56,
                          width: 331,
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            // validator: (value) {
                            //   if (value == null || value.isEmpty) {
                            //     return 'Please enter some text';
                            //   }
                            //   return null;
                            // },
                            keyboardType: TextInputType.text,
                            controller: addressController,
                            style: const TextStyle(),
                            decoration: const InputDecoration(
                                // hintText: "Address",
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xffE0E0E0), width: 2)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xffE0E0E0), width: 2))),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 10),
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Zipcode",
                              style: GoogleFonts.poppins(
                                  color: const Color(0xff333333),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 56,
                          width: 331,
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            // validator: (value) {
                            //   if (value == null || value.isEmpty) {
                            //     return 'Please enter some text';
                            //   }
                            //   return null;
                            // },
                            keyboardType: TextInputType.number,
                            controller: zipController,
                            style: const TextStyle(),
                            decoration: const InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xffE0E0E0), width: 2)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xffE0E0E0), width: 2))),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 10),
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "City",
                              style: GoogleFonts.poppins(
                                  color: const Color(0xff333333),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 56,
                          width: 331,
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            // validator: (value) {
                            //   if (value == null || value.isEmpty) {
                            //     return 'Please enter some text';
                            //   }
                            //   return null;
                            // },
                            controller: cityController,
                            keyboardType: TextInputType.text,
                            style: const TextStyle(),
                            decoration: const InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xffE0E0E0), width: 2)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xffE0E0E0), width: 2))),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 10),
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "State",
                              style: GoogleFonts.poppins(
                                  color: const Color(0xff333333),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 56,
                          width: 331,
                          child: TextField(
                            // validator: (value) {
                            //   if (value == null || value.isEmpty) {
                            //     return 'Please enter some text';
                            //   }
                            //   return null;
                            // },
                            keyboardType: TextInputType.text,
                            controller: stateController,
                            style: const TextStyle(),
                            decoration: const InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xffE0E0E0), width: 2)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xffE0E0E0), width: 2))),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 10),
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Country",
                              style: GoogleFonts.poppins(
                                  color: const Color(0xff333333),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 56,
                          width: 331,
                          child: DropdownButtonFormField<String>(
                            value: dropdownValue,
                            icon: const Icon(
                              Icons.keyboard_arrow_down_rounded,
                              size: 35,
                            ),
                            elevation: 2,
                            style: TextStyle(
                                color:
                                    const Color(0xff333333).withOpacity(0.6)),
                            decoration: const InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xffE0E0E0), width: 2)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xffE0E0E0), width: 2))),
                            onChanged: (String? value) {
                              // This is called when the user selects an item.
                              setState(() {
                                dropdownValue = value!;
                              });
                            },
                            items: list.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                          // Container(
                          //   height: 48,
                          //   width: 331,
                          //   decoration: BoxDecoration(
                          //       border: Border.all(
                          //           width: 2, color: const Color(0xffE0E0E0))),
                          //   child: Padding(
                          //     padding: const EdgeInsets.symmetric(horizontal: 10),
                          //     child: Row(
                          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //       children: [
                          //         Text("Morocco",
                          //             style: GoogleFonts.poppins(
                          //                 fontWeight: FontWeight.w500,
                          //                 fontSize: 15,
                          //                 color: const Color(0xff333333)
                          //                     .withOpacity(0.6))),
                          //         IconButton(
                          //           onPressed: () {
                          //             Navigator.push(context,
                          //                 MaterialPageRoute(builder: (_) => Example()));
                          //           },
                          //           icon: const Icon(Icons.keyboard_arrow_down_sharp,
                          //               size: 30),
                          //         )
                          //       ],
                          //     ),
                          //   ),
                          // )
                        )
                      ],
                    ),
                  ]),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20, top: 20),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.11,
                        width: MediaQuery.of(context).size.width * 0.88,
                        decoration: const BoxDecoration(),
                        child: Container(
                          decoration:
                              const BoxDecoration(color: Color(0xffF1F6FF)),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: const [
                                      Icon(
                                        Icons.error_outline_rounded,
                                        textDirection: TextDirection.rtl,
                                        color: Color(0xff0093ED),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 72,
                                    width: 271,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          textAlign: TextAlign.start,
                                          "By proceeding with a checkout process you agree with our",
                                          style: GoogleFonts.poppins(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0xff686565)),
                                        ),
                                        Text(
                                          textAlign: TextAlign.start,
                                          "refund policy",
                                          style: GoogleFonts.poppins(
                                              decoration:
                                                  TextDecoration.underline,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                              color: const Color(0xff0093ED)),
                                        ),
                                      ],
                                    ),
                                  )
                                ]),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width / 2.7,
                              height: MediaQuery.of(context).size.height / 15,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2,
                                      color: const Color(0xffBDBDBD))),
                              child: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Back",
                                    style: GoogleFonts.poppins(
                                        color: const Color(0xffBDBDBD),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ))),
                          Container(
                            decoration:
                                const BoxDecoration(color: Color(0xff2F80ED)),
                            child: ElevatedButton(
                                onPressed: () async {
                                  // Validate returns true if the form is valid, or false otherwise.
                                  if (_formKey.currentState!.validate()) {
                                    // If the form is valid, display a snackbar. In the real world,
                                    // you'd often call a server or save the information in a database.
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text('Processing Data')),
                                    );

                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    setState(() {
                                      postAddress.name = nameController.text;
                                      postAddress.address =
                                          addressController.text;
                                      postAddress.user_id =
                                          prefs.getString("user_id").toString();
                                      postAddress.email = emailController.text;
                                      postAddress.city = cityController.text;
                                      postAddress.phone_no =
                                          phoneController.text;
                                      postAddress.zipcode = zipController.text;
                                      postAddress.state = stateController.text;

                                      ApiService.postaddressData(postAddress)
                                          .then((value) {
                                        var res = value;
                                        print(res);

                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  CheckOutStep2(),
                                            ));

                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                                content: Text("submitted")));
                                      });
                                    });
                                  }
                                  // if (nameController.text.isEmpty ||
                                  //         emailController.text.isEmpty ||
                                  //         phoneController.text.isEmpty ||
                                  //         addressController.text.isEmpty ||
                                  //         zipController.text.isEmpty ||
                                  //         cityController.text.isEmpty ||
                                  //         stateController.text.isEmpty
                                  //     // countryController.text.isEmpty
                                  //     ) {
                                  //   showDialog(
                                  //     context: context,
                                  //     builder: (ctx) => AlertDialog(
                                  //       title: const Text("Alert"),
                                  //       content: const Text(
                                  //           "All fields are mendatory"),
                                  //       actions: <Widget>[
                                  //         TextButton(
                                  //           onPressed: () {
                                  //             Navigator.of(ctx).pop();
                                  //           },
                                  //           child: Container(
                                  //             color: const Color(0xff0093ED),
                                  //             padding: const EdgeInsets.all(14),
                                  //             child: const Text("okay",
                                  //                 style: TextStyle(
                                  //                     color:
                                  //                         Color(0xffFFFFFF))),
                                  //           ),
                                  //         ),
                                  //       ],
                                  //     ),
                                  //   );
                                  // }
                                  // else {
                                  //   setState(() {
                                  //     ApiService.postaddressData(context);
                                  //     // print("$Response");
                                  //     // print("${URLS.API_URL}");
                                  //     Navigator.push(
                                  //         context,
                                  //         MaterialPageRoute(
                                  //             builder: (context) =>
                                  //                 const CheckoutTwo()));
                                  //   });
                                  // }

                                  // ? _validate = true
                                  // : _validate = false;
                                }
                                //       checkTextFieldEmptyOrNot();
                                //   Navigator.push(
                                //       context,
                                //       MaterialPageRoute(
                                //           builder: (context) =>
                                //           const CheckoutTwo()));
                                // },
                                ,
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 2.7,
                                  height:
                                      MediaQuery.of(context).size.height / 15,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text("Submit",
                                          style: GoogleFonts.poppins(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w600)),
                                      const Icon(
                                        Icons.arrow_forward,
                                        size: 22,
                                      )
                                    ],
                                  ),
                                )),
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

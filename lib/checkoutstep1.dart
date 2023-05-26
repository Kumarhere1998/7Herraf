import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:herraf_app/api_servivce.dart';
import 'package:herraf_app/checkoutstep2.dart';
import 'package:herraf_app/checout2.dart';
import 'package:herraf_app/status.dart';
import 'package:herraf_app/status.dart';

import 'package:shared_preferences/shared_preferences.dart';

class CheckOutStep extends StatefulWidget {
  const CheckOutStep({Key? key}) : super(key: key);

  @override
  State<CheckOutStep> createState() => _CheckOutStepState();
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
  String country = '';
}

String addressid = '';

class _CheckOutStepState extends State<CheckOutStep> {
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
    countryController.dispose();

    super.dispose();
  }

  PostAddress postAddress = new PostAddress();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            padding: const EdgeInsets.only(
              top: 10,
            ),
            child: Column(children: [
              Container(
                padding: const EdgeInsets.only(top: 30),
                margin: new EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                alignment: Alignment.centerLeft,
                child: Row(children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: 24,
                      color: Color(0xff212121),
                    ),
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
              // const SizedBox(height: 15),
              Container(
                padding: const EdgeInsets.only(top: 30),
                child: Image.asset(
                  'assets/images/checkout1.png',
                  height: 75,
                  width: 450,
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 30, bottom: 10),
                      margin: new EdgeInsets.symmetric(
                        horizontal: 25.0,
                      ),
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Name",
                        style: GoogleFonts.poppins(
                            color: const Color(0xff212121),
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                      width: 331,
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty ||
                              !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                            //allow upper and lower case alphabets and space
                            return "Enter Correct Name";
                          } else {
                            return null;
                          }
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
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.grey, width: 0),
                            borderRadius: BorderRadius.circular(32.7),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color(0xffB0A9A9), width: 0),
                            borderRadius: BorderRadius.circular(32.7),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.7),
                          ),
                          // hintText: 'Username',
                          hintStyle: GoogleFonts.poppins(
                              color: Color(0x80343434),
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                          // hintStyle: const TextStyle(
                          //     color: Color(0x80343434),
                          //     fontWeight: FontWeight.bold)
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 30, bottom: 10),
                      margin: new EdgeInsets.symmetric(
                        horizontal: 25.0,
                      ),
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Email",
                        style: GoogleFonts.poppins(
                            color: const Color(0xff212121),
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                      width: 331,
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty ||
                              !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                  .hasMatch(value)) {
                            return "Enter Correct Email Address";
                          } else {
                            return null;
                          }
                        },

                        // validator: (value) {
                        //   if (value!.isNotEmpty ||
                        //       !RegExp(r'^[a-z A-Z]+$').hasMatch(value!)) {
                        //     return "Enter Correct Name";
                        //   } else {
                        //     return null;
                        //   }
                        // },
                        controller: emailController,
                        keyboardType: TextInputType.text,
                        style: const TextStyle(),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.grey, width: 0),
                            borderRadius: BorderRadius.circular(32.7),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color(0xffB0A9A9), width: 0),
                            borderRadius: BorderRadius.circular(32.7),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.7),
                          ),
                          // hintText: 'Username',
                          hintStyle: GoogleFonts.poppins(
                              color: Color(0x80343434),
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                          // hintStyle: const TextStyle(
                          //     color: Color(0x80343434),
                          //     fontWeight: FontWeight.bold)
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 30, bottom: 10),
                      margin: new EdgeInsets.symmetric(
                        horizontal: 25.0,
                      ),
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Country",
                        style: GoogleFonts.poppins(
                            color: const Color(0xff212121),
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                      width: 331,
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty ||
                              !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                            //allow upper and lower case alphabets and space
                            return "Enter Correct Country";
                          } else {
                            return null;
                          }
                        },

                        // validator: (value) {
                        //   if (value!.isNotEmpty ||
                        //       !RegExp(r'^[a-z A-Z]+$').hasMatch(value!)) {
                        //     return "Enter Correct Name";
                        //   } else {
                        //     return null;
                        //   }
                        // },
                        controller: countryController,
                        keyboardType: TextInputType.text,
                        style: const TextStyle(),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.grey, width: 0),
                            borderRadius: BorderRadius.circular(32.7),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color(0xffB0A9A9), width: 0),
                            borderRadius: BorderRadius.circular(32.7),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.7),
                          ),
                          // hintText: 'Username',
                          hintStyle: GoogleFonts.poppins(
                              color: Color(0x80343434),
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                          // hintStyle: const TextStyle(
                          //     color: Color(0x80343434),
                          //     fontWeight: FontWeight.bold)
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 30, bottom: 10),
                      margin: new EdgeInsets.symmetric(
                        horizontal: 25.0,
                      ),
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Phone no.",
                        style: GoogleFonts.poppins(
                            color: const Color(0xff212121),
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                      width: 331,
                      child: TextFormField(
                        validator: (password) {
                          // confirmPass = value;
                          if (password!.isEmpty) {
                            return "Please Enter Phone no";
                          } else if (password.length < 10) {
                            return "Phone no must be atleast 10 digit";
                          } else {
                            return null;
                          }
                        },
                        // validator: (value) {
                        //   if (value!.isNotEmpty ||
                        //       !RegExp(r'^[a-z A-Z]+$').hasMatch(value!)) {
                        //     return "Enter Correct Name";
                        //   } else {
                        //     return null;
                        //   }
                        // },
                        controller: phoneController,
                        keyboardType: TextInputType.text,
                        style: const TextStyle(),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.grey, width: 0),
                            borderRadius: BorderRadius.circular(32.7),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color(0xffB0A9A9), width: 0),
                            borderRadius: BorderRadius.circular(32.7),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.7),
                          ),
                          // hintText: 'Username',
                          hintStyle: GoogleFonts.poppins(
                              color: Color(0x80343434),
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                          // hintStyle: const TextStyle(
                          //     color: Color(0x80343434),
                          //     fontWeight: FontWeight.bold)
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 30, bottom: 10),
                      margin: new EdgeInsets.symmetric(
                        horizontal: 25.0,
                      ),
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Address",
                        style: GoogleFonts.poppins(
                            color: const Color(0xff212121),
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(
                      height: 60,
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
                        controller: addressController,
                        keyboardType: TextInputType.text,
                        style: const TextStyle(),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.grey, width: 0),
                            borderRadius: BorderRadius.circular(32.7),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color(0xffB0A9A9), width: 0),
                            borderRadius: BorderRadius.circular(32.7),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.7),
                          ),
                          // hintText: 'Username',
                          hintStyle: GoogleFonts.poppins(
                              color: Color(0x80343434),
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                          // hintStyle: const TextStyle(
                          //     color: Color(0x80343434),
                          //     fontWeight: FontWeight.bold)
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 30, bottom: 10),
                      margin: new EdgeInsets.symmetric(
                        horizontal: 25.0,
                      ),
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Zipcode",
                        style: GoogleFonts.poppins(
                            color: const Color(0xff212121),
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                      width: 331,
                      child: TextFormField(
                        validator: (password) {
                          // confirmPass = value;
                          if (password!.isEmpty) {
                            return "Please Enter Zipcode";
                          } else if (password.length < 3) {
                            return "Zipcode must be atleast 3 characters long";
                          } else {
                            return null;
                          }
                        },

                        // validator: (value) {
                        //   if (value!.isNotEmpty ||
                        //       !RegExp(r'^[a-z A-Z]+$').hasMatch(value!)) {
                        //     return "Enter Correct Name";
                        //   } else {
                        //     return null;
                        //   }
                        // },
                        controller: zipController,
                        keyboardType: TextInputType.text,
                        style: const TextStyle(),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.grey, width: 0),
                            borderRadius: BorderRadius.circular(32.7),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color(0xffB0A9A9), width: 0),
                            borderRadius: BorderRadius.circular(32.7),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.7),
                          ),
                          // hintText: 'Username',
                          hintStyle: GoogleFonts.poppins(
                              color: Color(0x80343434),
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                          // hintStyle: const TextStyle(
                          //     color: Color(0x80343434),
                          //     fontWeight: FontWeight.bold)
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 30, bottom: 10),
                      margin: new EdgeInsets.symmetric(
                        horizontal: 25.0,
                      ),
                      alignment: Alignment.topLeft,
                      child: Text(
                        "City",
                        style: GoogleFonts.poppins(
                            color: const Color(0xff212121),
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                      width: 331,
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty ||
                              !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                            //allow upper and lower case alphabets and space
                            return "Enter Correct  City";
                          } else {
                            return null;
                          }
                        },

                        // validator: (value) {
                        //   if (value!.isNotEmpty ||
                        //       !RegExp(r'^[a-z A-Z]+$').hasMatch(value!)) {
                        //     return "Enter Correct Name";
                        //   } else {
                        //     return null;
                        //   }
                        // },
                        controller: cityController,
                        keyboardType: TextInputType.text,
                        style: const TextStyle(),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.grey, width: 0),
                            borderRadius: BorderRadius.circular(32.7),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color(0xffB0A9A9), width: 0),
                            borderRadius: BorderRadius.circular(32.7),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.7),
                          ),
                          // hintText: 'Username',
                          hintStyle: GoogleFonts.poppins(
                              color: Color(0x80343434),
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                          // hintStyle: const TextStyle(
                          //     color: Color(0x80343434),
                          //     fontWeight: FontWeight.bold)
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 30, bottom: 10),
                      margin: new EdgeInsets.symmetric(
                        horizontal: 25.0,
                      ),
                      alignment: Alignment.topLeft,
                      child: Text(
                        "State",
                        style: GoogleFonts.poppins(
                            color: const Color(0xff212121),
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                      width: 331,
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty ||
                              !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                            //allow upper and lower case alphabets and space
                            return "Enter Correct State";
                          } else {
                            return null;
                          }
                        },

                        // validator: (value) {
                        //   if (value!.isNotEmpty ||
                        //       !RegExp(r'^[a-z A-Z]+$').hasMatch(value!)) {
                        //     return "Enter Correct Name";
                        //   } else {
                        //     return null;
                        //   }
                        // },
                        controller: stateController,
                        keyboardType: TextInputType.text,
                        style: const TextStyle(),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.grey, width: 0),
                            borderRadius: BorderRadius.circular(32.7),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color(0xffB0A9A9), width: 0),
                            borderRadius: BorderRadius.circular(32.7),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.7),
                          ),
                          // hintText: 'Username',
                          hintStyle: GoogleFonts.poppins(
                              color: Color(0x80343434),
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                          // hintStyle: const TextStyle(
                          //     color: Color(0x80343434),
                          //     fontWeight: FontWeight.bold)
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, right: 30, left: 30),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 30, top: 50),
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
                      padding: const EdgeInsets.only(
                        top: 20,
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.

                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          setState(() {
                            postAddress.name = nameController.text;
                            postAddress.address = addressController.text;
                            postAddress.user_id =
                                prefs.getString("user_id").toString();
                            postAddress.email = emailController.text;
                            postAddress.city = cityController.text;
                            postAddress.phone_no = phoneController.text;
                            postAddress.zipcode = zipController.text;
                            postAddress.state = stateController.text;

                            ApiService.postaddressData(postAddress)
                                .then((value) {
                              //  var res = value;
                              var res = value["data"]["insertId"];
                              // print(res);

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CheckOutStep2(
                                        // res['pack_name'],
                                        ),
                                  ));

                              // ScaffoldMessenger.of(context).showSnackBar(
                              //     const SnackBar(content: Text("submitted")));
                            });
                          });
                        }
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
                                  "Select payment method",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                      color: Color(0xffFFFFFF),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: Color(0xffFFFFFF),
                                size: 20,
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
            ])));
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

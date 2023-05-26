import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:herraf_app/api_servivce.dart';
import 'package:herraf_app/card.dart';
import 'package:herraf_app/paypal.dart';
import 'package:herraf_app/thankucheckout.dart';

import 'package:shared_preferences/shared_preferences.dart';

// This widget is the root of your application.

class MyHomePage1 extends StatefulWidget {
  const MyHomePage1({Key? key}) : super(key: key);

  @override
  _MyHomePage1State createState() => _MyHomePage1State();
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

class _MyHomePage1State extends State<MyHomePage1> {
  int _activeCurrentStep = 0;
  int _selection = 0;

//   selectTime(int timeSelected) {
//     setState(() {
//       _selection = timeSelected;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     var radio = Radio(
//                                 focusColor: Colors.white,
//                                 groupValue: _selection,
//                                 onChanged: selectTime,
//                                 value: 1,
//                               );
//     var radio2 = Radio(
//                                 focusColor: Colors.white,
//                                 groupValue: _selection,
//                                 onChanged: selectTime,
//                                 value: 2,
//                               );
//     var radio6 = Radio(
//                                 focusColor: Colors.white,
//                                 groupValue: _selection,
//                                 onChanged: selectTime,
//                                 value: 3,
//                               );
//     var radio3 = radio6;
//     var radio4 = Radio(
//                                 focusColor: Colors.white,
//                                 groupValue: _selection,
//                                 onChanged: selectTime,
//                                 value: 4,
//                               );
//     var radio5 = Radio(
//                                 focusColor: Colors.white,
//                                 groupValue: _selection,
//                                 onChanged: selectTime,
//                                 value: 5,
//                               );

  TextEditingController Ccontroller = TextEditingController();

  final nameController = TextEditingController();

  final emailController = TextEditingController();

  final phoneController = TextEditingController();

  final addressController = TextEditingController();

  final zipController = TextEditingController();

  final cityController = TextEditingController();

  final stateController = TextEditingController();

  final countryController = TextEditingController();

  var list;

  var radio;
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

  List<Step> stepList() => [
        Step(
            state: _activeCurrentStep <= 0
                ? StepState.editing
                : StepState.complete,
            isActive: _activeCurrentStep >= 0,
            title: Text(
              'Address',
              style: GoogleFonts.poppins(
                  // color: const Color(0xff786E6E),
                  fontWeight: FontWeight.w500,
                  fontSize: 14),
            ),
            content: Form(
              key: _formKey,
              child: Container(
                  color: Color(0xffE5E5E5),
                  child: Column(children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 20),
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
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 0),
                                borderRadius: BorderRadius.circular(32.7),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color(0xffB0A9A9), width: 0),
                                borderRadius: BorderRadius.circular(32.7),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
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
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 30),
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
                              if (value!.isEmpty ||
                                  !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                      .hasMatch(value)) {
                                return "Enter Correct Email Address";
                              } else {
                                return null;
                              }
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
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 0),
                                borderRadius: BorderRadius.circular(32.7),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color(0xffB0A9A9), width: 0),
                                borderRadius: BorderRadius.circular(32.7),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
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
                            validator: (password) {
                              // confirmPass = value;
                              if (password!.isEmpty) {
                                return "Please Enter Phone no";
                              } else if (password.length < 10) {
                                return "Phone no must be atleast 10 characters long";
                              } else {
                                return null;
                              }
                            },

                            // validator: (value) {
                            //   if (value == null || value.isEmpty) {
                            //     return 'Please enter some text';
                            //   }
                            //   return null;
                            // },
                            keyboardType: TextInputType.number,
                            controller: phoneController,
                            style: const TextStyle(),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 0),
                                borderRadius: BorderRadius.circular(32.7),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color(0xffB0A9A9), width: 0),
                                borderRadius: BorderRadius.circular(32.7),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
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
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 0),
                                borderRadius: BorderRadius.circular(32.7),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color(0xffB0A9A9), width: 0),
                                borderRadius: BorderRadius.circular(32.7),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
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
                            validator: (password) {
                              // confirmPass = value;
                              if (password!.isEmpty) {
                                return "Please Enter Password";
                              } else if (password.length < 3) {
                                return "Zipcode must be atleast 3 characters long";
                              } else {
                                return null;
                              }
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
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 0),
                                borderRadius: BorderRadius.circular(32.7),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color(0xffB0A9A9), width: 0),
                                borderRadius: BorderRadius.circular(32.7),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
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
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 0),
                                borderRadius: BorderRadius.circular(32.7),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color(0xffB0A9A9), width: 0),
                                borderRadius: BorderRadius.circular(32.7),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
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
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 0),
                                borderRadius: BorderRadius.circular(32.7),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color(0xffB0A9A9), width: 0),
                                borderRadius: BorderRadius.circular(32.7),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
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
                        )
                      ],
                    ),
                    Column(children: [
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
                      Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                // Container(
                                //     width: MediaQuery.of(context).size.width / 2.7,
                                //     height: MediaQuery.of(context).size.height / 15,
                                //     decoration: BoxDecoration(
                                //         border: Border.all(
                                //             width: 2,
                                //             color: const Color(0xffBDBDBD))),
                                //     child: TextButton(
                                //         onPressed: () {},
                                //         child: Text(
                                //           "Back",
                                //           style: GoogleFonts.poppins(
                                //               color: const Color(0xffBDBDBD),
                                //               fontSize: 18,
                                //               fontWeight: FontWeight.w600),
                                //         ))),
                                InkWell(
                                    onTap: () async {
                                      if (_formKey.currentState!.validate()) {
                                        // If the form is valid, display a snackbar. In the real world,
                                        // you'd often call a server or save the information in a database.
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                              content: Text('Processing Data')),
                                        );

                                        SharedPreferences prefs =
                                            await SharedPreferences
                                                .getInstance();
                                        setState(() {
                                          postAddress.name =
                                              nameController.text;
                                          postAddress.address =
                                              addressController.text;
                                          postAddress.user_id = prefs
                                              .getString("user_id")
                                              .toString();
                                          postAddress.email =
                                              emailController.text;
                                          postAddress.city =
                                              cityController.text;
                                          postAddress.phone_no =
                                              phoneController.text;
                                          postAddress.zipcode =
                                              zipController.text;
                                          postAddress.state =
                                              stateController.text;

                                          ApiService.postaddressData(
                                                  postAddress)
                                              .then((value) {
                                            var res = value;
                                            print(res);

                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      MyHomePage1(),
                                                ));

                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                                    content:
                                                        Text("submitted")));
                                          });
                                        });
                                      }
                                    },
                                    child: Container(
                                      margin: new EdgeInsets.symmetric(
                                          horizontal: 4.0, vertical: 4),
                                      alignment: Alignment.center,
                                      height: 56,
                                      width: 330,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Color(0xffCE8C8C),
                                      ),
                                      //  color: Color(0xff267693),
                                      child: Text("Submit",
                                          style: GoogleFonts.poppins(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w600)),
                                    )),
                                //     Container(
                                //       decoration:
                                //           const BoxDecoration(color: Color(0xff2F80ED)),
                                //       child: ElevatedButton(
                                //           onPressed: () async {

                                //             if (_formKey.currentState!.validate()) {
                                //               // If the form is valid, display a snackbar. In the real world,
                                //               // you'd often call a server or save the information in a database.
                                //               ScaffoldMessenger.of(context).showSnackBar(
                                //                 const SnackBar(
                                //                     content: Text('Processing Data')),
                                //               );

                                //               SharedPreferences prefs =
                                //                   await SharedPreferences.getInstance();
                                //               setState(() {
                                //                 postAddress.name = nameController.text;
                                //                 postAddress.address =
                                //                     addressController.text;
                                //                 postAddress.user_id =
                                //                     prefs.getString("user_id").toString();
                                //                 postAddress.email = emailController.text;
                                //                 postAddress.city = cityController.text;
                                //                 postAddress.phone_no =
                                //                     phoneController.text;
                                //                 postAddress.zipcode = zipController.text;
                                //                 postAddress.state = stateController.text;

                                //                 ApiService.postaddressData(postAddress)
                                //                     .then((value) {
                                //                   var res = value;
                                //                   print(res);

                                //             Navigator.push(
                                //                 context,
                                //                 MaterialPageRoute(
                                //                   builder: (context) => MyHomePage1(),
                                //                 ));

                                //             //       ScaffoldMessenger.of(context)
                                //             //           .showSnackBar(const SnackBar(
                                //             //               content: Text("submitted")));
                                //             //     });
                                //             //   });
                                //             // }
                                //           },
                                //           child: SizedBox(
                                //             width: MediaQuery.of(context).size.width / 2.7,
                                //             height: MediaQuery.of(context).size.height / 15,
                                //             child: Row(
                                //               mainAxisAlignment:
                                //                   MainAxisAlignment.spaceAround,
                                //               children: [
                                //                 Text("Submit",
                                //                     style: GoogleFonts.poppins(
                                //                         fontSize: 17,
                                //                         fontWeight: FontWeight.w600)),
                                //                 const Icon(
                                //                   Icons.arrow_forward,
                                //                   size: 22,
                                //                 )
                                //               ],
                                //             ),

                                //     )
                                //   ],
                                // ),
                              ])
                          // SizedBox(
                          //   height: 56,
                          //   width: 331,
                          //   child: DropdownButtonFormField<String>(
                          //     value: dropdownValue,
                          //     icon: const Icon(
                          //       Icons.keyboard_arrow_down_rounded,
                          //       size: 35,
                          //     ),
                          //     elevation: 2,
                          //     style: TextStyle(
                          //         color:
                          //             const Color(0xff333333).withOpacity(0.6)),
                          //     decoration: InputDecoration(
                          //       filled: true,
                          //       fillColor: Colors.white,
                          //       enabledBorder: OutlineInputBorder(
                          //         borderSide: const BorderSide(
                          //             color: Colors.grey, width: 0),
                          //         borderRadius: BorderRadius.circular(32.7),
                          //       ),
                          //       focusedBorder: OutlineInputBorder(
                          //         borderSide: const BorderSide(
                          //             color: Color(0xffB0A9A9), width: 0),
                          //         borderRadius: BorderRadius.circular(32.7),
                          //       ),
                          //       border: OutlineInputBorder(
                          //         borderRadius: BorderRadius.circular(10),
                          //       ),
                          //       // hintText: 'Username',
                          //       hintStyle: GoogleFonts.poppins(
                          //           color: Color(0x80343434),
                          //           fontSize: 14,
                          //           fontWeight: FontWeight.w500),
                          //       // hintStyle: const TextStyle(
                          //       //     color: Color(0x80343434),
                          //       //     fontWeight: FontWeight.bold)
                          //     ),
                          //     onChanged: (String? value) {
                          //       // This is called when the user selects an item.
                          //       setState(() {
                          //         dropdownValue = value!;
                          //       });
                          //     },
                          //     items: list.map((String value) {
                          //       return DropdownMenuItem<String>(
                          //         value: value,
                          //         child: Text(value),
                          //       );
                          //     }).toList(),
                          //   ),
                          // )
                          ),
                    ]),
                  ])),
            )),
        Step(
            state: _activeCurrentStep <= 1
                ? StepState.editing
                : StepState.complete,
            isActive: _activeCurrentStep >= 1,
            title: Text(
              'Method',
              style: GoogleFonts.poppins(
                  // color: const Color(0xff786E6E),
                  fontWeight: FontWeight.w500,
                  fontSize: 14),
            ),
            content: Container(
              child: Column(
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  InkWell(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => Thankucheckout()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            border: Border.all(
                              width: 2,

                              //        //color: isPayPalSelected
                            )),
                        height: MediaQuery.of(context).size.height / 9.12,
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

                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Cardcreen()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            border: Border.all(
                              width: 2,
                              //        //color: isPayPalSelected
                            )),
                        height: MediaQuery.of(context).size.height / 9.12,
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
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            border: Border.all(
                              width: 2,
                              //        //color: isPayPalSelected
                            )),
                        height: MediaQuery.of(context).size.height / 9.12,
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
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Paypalscreen()));
                    },
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 7, top: 190),
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
                  // SizedBox(
                  //   height: 70,
                  //   width: 350,
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Text(
                  //         textAlign: TextAlign.start,
                  //         "By proceeding with a checkout process you agree with our",
                  //         style: GoogleFonts.poppins(
                  //             fontSize: 16,
                  //             fontWeight: FontWeight.w500,
                  //             color: const Color(0xff786E6E)),
                  //       ),
                  //       Text(
                  //         textAlign: TextAlign.start,
                  //         "refund policy",
                  //         style: GoogleFonts.poppins(
                  //             decoration: TextDecoration.underline,
                  //             fontSize: 16,
                  //             fontWeight: FontWeight.w700,
                  //             color: const Color(0xffCE8C8C)),
                  //       ),
                  //     ],
                  //   ),
                  // )
                ],
              ),
            )),
        Step(
            state: StepState.complete,
            isActive: _activeCurrentStep >= 2,
            title: Text(
              'Payment',
              style: GoogleFonts.poppins(
                  // color: const Color(0xff786E6E),
                  fontWeight: FontWeight.w500,
                  fontSize: 14),
            ),
            content: Container(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                child: Paypalscreen(),
              ),
            ))
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffE5E5E5),
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
      body: Stepper(
        type: StepperType.horizontal,
        currentStep: _activeCurrentStep,
        steps: stepList(),
        onStepContinue: () {
          if (_activeCurrentStep < (stepList().length - 1)) {
            setState(() {
              _activeCurrentStep += 1;
            });
          }
        },
        onStepCancel: () {
          if (_activeCurrentStep == 0) {
            return;
          }

          setState(() {
            _activeCurrentStep -= 1;
          });
        },
        onStepTapped: (int index) {
          setState(() {
            _activeCurrentStep = index;
          });
        },
      ),
    );
  }
}

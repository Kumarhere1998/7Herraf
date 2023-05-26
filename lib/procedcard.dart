import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:herraf_app/card.dart';
import 'package:herraf_app/thankucheckout.dart';

class CheckoutFour extends StatefulWidget {
  const CheckoutFour({Key? key}) : super(key: key);

  @override
  State<CheckoutFour> createState() => _CheckoutFourState();
}

class _CheckoutFourState extends State<CheckoutFour> {
  bool isSwitched = false;

  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
  }

  final nameController = TextEditingController();
  final firstcontroller = TextEditingController();
  final secondcontroller = TextEditingController();
  final thirdcontroller = TextEditingController();
  final fourthcontroller = TextEditingController();
  final sumcontroller = TextEditingController();

  bool isfilled = false;

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  final formKey = GlobalKey<FormState>();
  final cvvController = TextEditingController();
  final cardController = TextEditingController();
  final expController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(Icons.arrow_back,
                                      color: Color(0xff212121), size: 25)),
                              const SizedBox(
                                height: 30,
                                width: 15,
                              ),
                              Text(
                                "Checkout",
                                style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xff212121)),
                              ),
                            ],
                          ),
                          Transform.rotate(
                            angle: 10.2,
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.add,
                                    color: Color(0xff212121), size: 25)),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 30),
                  child: Image.asset(
                    'assets/images/wizard.png',
                    height: 75,
                    width: 330,
                  ),
                ),
                // Container(
                //   padding: const EdgeInsets.only(top: 30),
                //   margin: new EdgeInsets.symmetric(
                //     horizontal: 20.0,
                //   ),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Container(
                //         alignment: Alignment.center,
                //         height: 30,
                //         width: 30,
                //         decoration: const BoxDecoration(
                //           borderRadius: BorderRadius.all(Radius.circular(30)),
                //           color: Color(0xffCE8C8C),
                //         ),
                //         child: Text("1",
                //             style: GoogleFonts.poppins(
                //                 color: const Color(0xffFFFFFF),
                //                 fontSize: 14,
                //                 fontWeight: FontWeight.w600)),
                //       ),
                //       Container(
                //         height: 3,
                //         width: 60,
                //         decoration: const BoxDecoration(
                //           borderRadius: BorderRadius.all(Radius.circular(24)),
                //           color: Color(0xffB0A9A9),
                //         ),
                //       ),
                //       Container(
                //         alignment: Alignment.center,
                //         height: 30,
                //         width: 30,
                //         decoration: const BoxDecoration(
                //           borderRadius: BorderRadius.all(Radius.circular(30)),
                //           color: Color(0xfffffffff),
                //         ),
                //         child: Text("2",
                //             style: GoogleFonts.poppins(
                //                 color: const Color(0xffB0A9A9),
                //                 fontSize: 14,
                //                 fontWeight: FontWeight.w600)),
                //       ),
                //       Container(
                //         height: 3,
                //         width: 60,
                //         decoration: const BoxDecoration(
                //           borderRadius: BorderRadius.all(Radius.circular(24)),
                //           color: Color(0xffB0A9A9),
                //         ),
                //       ),
                //       Container(
                //         alignment: Alignment.center,
                //         height: 30,
                //         width: 30,
                //         decoration: const BoxDecoration(
                //           borderRadius: BorderRadius.all(Radius.circular(30)),
                //           color: Color(0xffffffff),
                //         ),
                //         child: Text("3",
                //             style: GoogleFonts.poppins(
                //                 color: const Color(0xffB0A9A9),
                //                 fontSize: 14,
                //                 fontWeight: FontWeight.w600)),
                //       ),
                //     ],
                //   ),
                // ),
                Form(
                  key: formKey,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 30),
                          child: Text(
                            "Card payment",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: const Color(0xff212121)),
                          ),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.508,
                            child: Image.asset("assets/images/visa.png")),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.060,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.117,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                padding: const EdgeInsets.only(left: 12),
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Card number",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff212121)
                                          .withOpacity(0.8),
                                      fontSize: 14),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width:
                                          MediaQuery.of(context).size.height *
                                              0.093,
                                      child: TextFormField(
                                          inputFormatters: [
                                            FilteringTextInputFormatter
                                                .digitsOnly,
                                            LengthLimitingTextInputFormatter(4),
                                          ],
                                          maxLength: 4,
                                          keyboardType: TextInputType.number,
                                          controller: firstcontroller,
                                          decoration: InputDecoration(
                                            counterText: "",
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                          ),
                                          textInputAction:
                                              TextInputAction.next),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      width: MediaQuery.of(context).size.width *
                                          0.0222,
                                      child: Text("-",
                                          style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xff212121))),
                                    ),
                                    SizedBox(
                                      width:
                                          MediaQuery.of(context).size.height *
                                              0.093,
                                      child: TextFormField(
                                          inputFormatters: [
                                            FilteringTextInputFormatter
                                                .digitsOnly,
                                            LengthLimitingTextInputFormatter(4),
                                          ],
                                          maxLength: 4,
                                          keyboardType: TextInputType.number,
                                          controller: secondcontroller,
                                          decoration: InputDecoration(
                                            counterText: "",
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                          ),
                                          textInputAction:
                                              TextInputAction.next),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      width: MediaQuery.of(context).size.width *
                                          0.0222,
                                      child: Text("-",
                                          style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xff212121))),
                                    ),
                                    SizedBox(
                                      width:
                                          MediaQuery.of(context).size.height *
                                              0.093,
                                      child: TextFormField(
                                          inputFormatters: [
                                            FilteringTextInputFormatter
                                                .digitsOnly,
                                            LengthLimitingTextInputFormatter(4),
                                          ],
                                          maxLength: 4,
                                          keyboardType: TextInputType.number,
                                          controller: thirdcontroller,
                                          decoration: InputDecoration(
                                            counterText: "",
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                          ),
                                          textInputAction:
                                              TextInputAction.next),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      width: MediaQuery.of(context).size.width *
                                          0.0222,
                                      child: Text("-",
                                          style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xff212121))),
                                    ),
                                    SizedBox(
                                      width:
                                          MediaQuery.of(context).size.height *
                                              0.093,
                                      child: TextFormField(
                                          inputFormatters: [
                                            FilteringTextInputFormatter
                                                .digitsOnly,
                                            LengthLimitingTextInputFormatter(4),
                                          ],
                                          maxLength: 4,
                                          keyboardType: TextInputType.number,
                                          controller: fourthcontroller,
                                          decoration: InputDecoration(
                                            counterText: "",
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                          ),
                                          textInputAction:
                                              TextInputAction.next),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.120,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text("Expiration date",
                                          style: GoogleFonts.poppins(
                                              color: const Color(0xff212121)
                                                  .withOpacity(0.8),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14)),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.400,
                                      child: TextFormField(
                                          inputFormatters: [
                                            FilteringTextInputFormatter
                                                .digitsOnly,
                                            LengthLimitingTextInputFormatter(4),
                                          ],
                                          maxLength: 4,
                                          keyboardType: TextInputType.number,
                                          controller: expController,
                                          decoration: InputDecoration(
                                              counterText: "",
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(32.0),
                                              ),
                                              labelText: "mm/yy"),
                                          textInputAction:
                                              TextInputAction.next),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text("CVV",
                                          style: GoogleFonts.poppins(
                                              color: const Color(0xff212121)
                                                  .withOpacity(0.8),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14)),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.400,
                                      child: TextFormField(
                                          inputFormatters: [
                                            FilteringTextInputFormatter
                                                .digitsOnly,
                                            LengthLimitingTextInputFormatter(3),
                                          ],
                                          maxLength: 3,
                                          keyboardType: TextInputType.number,
                                          controller: cvvController,
                                          decoration: InputDecoration(
                                            counterText: "",
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(32.0),
                                            ),
                                          )),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 35, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text("Save card",
                                      style: GoogleFonts.poppins(
                                          color: const Color(0xff212121),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14)),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.02,
                                  ),
                                  CupertinoSwitch(
                                    value: true,
                                    onChanged: (value) {
                                      var state = value;
                                      setState(
                                        () {},
                                      );
                                    },
                                    thumbColor: const Color(0xffCE8C8C),
                                    activeColor: const Color(0xff6B2E2E),
                                    trackColor: Color(0xff333333),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text("Amount",
                                      style: GoogleFonts.poppins(
                                          color: const Color(0xffB0A9A9),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16)),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.02,
                                  ),
                                  Text("12€",
                                      style: GoogleFonts.poppins(
                                          color: const Color(0xff212121),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20)),
                                ],
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 20),
                          child: Text.rich(
                            TextSpan(
                              text:
                                  'By proceeding with a checkout process you\nagree with our ',
                              style: GoogleFonts.mulish(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff786E6E),
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'refund policy',
                                    style: GoogleFonts.mulish(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      color: const Color(0xffCE8C8C),
                                      decoration: TextDecoration.underline,
                                    )),
                                // can add more TextSpans here...
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        InkWell(
                            child: Container(
                                width:
                                    MediaQuery.of(context).size.width * 0.866,
                                height: 70,
                                alignment: Alignment.centerLeft,
                                decoration: const BoxDecoration(
                                  color: Color(0xffD7D4D4),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text("Pay",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xff9A9191),
                                        )),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Icon(
                                      Icons.arrow_forward,
                                      color: Color(0xff9A9191),
                                    )
                                  ],
                                )),
                            onTap: () {
                              // if (cvvController.text.length == 3) {
                              //   if (expController.text.length == 4) {
                              //     if (firstcontroller.text.length == 4) {
                              //       if (secondcontroller.text.length == 4) {
                              //         if (thirdcontroller.text.length == 4) {
                              //           if (fourthcontroller.text.length == 4) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Cardcreen()));
                            })
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// import 'package:flutter_qr_reader_copy/flutter_qr_reader_copy.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:herraf_app/api_servivce.dart';
import 'package:herraf_app/bottomNavBar.dart';
import 'package:herraf_app/qrscanpack.dart';

import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QrCodeScannerOne extends StatefulWidget {
  const QrCodeScannerOne({Key? key}) : super(key: key);

  @override
  State<QrCodeScannerOne> createState() => _QrCodeScannerOneState();
}

// class __ActivatepackData {
//   String user_id = "";
//   String pack_id = '';
// }

class _QrCodeScannerOneState extends State<QrCodeScannerOne> {
  bool backBotton = false;

  @override
  void reassemble() async {
    super.reassemble();
    if (Platform.isAndroid) {
      await controller!.pauseCamera();
    }
    await controller!.resumeCamera();
  }

  activatepackData(pack_id, pack_name) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    ApiService.activatepackData(pref.getString('user_id'), pack_id)
        .then((value) {
      if (value["status"]) {
        Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.fade,
                child: QrPackActivated(pack_name)));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("${value['message']}")));
// print msg here
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState

    QRViewController;

    super.initState();
  }

  final GlobalKey _globalkey = GlobalKey();
  QRViewController? controller;
  Barcode? result;
  bool _showScanView = false;
  File? image;
  Map catalog = {};
  //var catalog;

  // List pack = [];

  void qr(QRViewController controller) {
    this.controller = controller;
    // controller!.pauseCamera();
    controller.resumeCamera();

    controller.scannedDataStream.listen((event) {
      setState(() async {
        // File imgFile = File(path);
        result = event;
        if (result != null) {
          controller.pauseCamera();
          SharedPreferences prefs = await SharedPreferences.getInstance();

          ApiService.postqrdata(prefs.getString('user_id'), result!.code)
              .then((value) {
            setState(() {
              catalog = value["data"];
              if (!value['status']) {
                backBotton = true;
              }

              showModalBottomSheet(
                  isDismissible: false,
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: value['status']
                          ? Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Match found",
                                          style: GoogleFonts.poppins(
                                              color: const Color(0xff2B1B1F),
                                              fontWeight: FontWeight.w700)),
                                      IconButton(
                                          onPressed: () {
                                            setState(() {
                                              controller.resumeCamera();
                                            });
                                            Navigator.pop(context);
                                          },
                                          icon: const Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            size: 30,
                                            color: Color(0xff2B1B1F),
                                          ))
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  8,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  4,
                                              decoration: const BoxDecoration(
                                                  color: Color(0xffFFFFFF)),
                                              child: Image.network(
                                                  'http://165.22.215.103:4000/uploads/${catalog["image1"]}')),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: Text(
                                                  "${catalog["pack_name"]}",
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w500,
                                                    color:
                                                        const Color(0xff212121),
                                                  ),
                                                  textAlign: TextAlign.left,
                                                ),
                                              ),
                                              Text(
                                                textAlign: TextAlign.center,
                                                "${catalog["pack_price"]}",
                                                style: GoogleFonts.poppins(
                                                    fontSize: 32,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 30),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        color: Color(0xffCE8C8C),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8))),
                                    height: 48,
                                    width: 309,
                                    child: TextButton(
                                        onPressed: () {
                                          setState(() {
                                            controller.pauseCamera();
                                            activatepackData(catalog["pack_id"],
                                                catalog["pack_name"]);

                                            //    activatepack(user_id, iscart_id, isis_activated);
                                          });
                                        },
                                        child: Text(
                                          "Activate pack  ",
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16,
                                              color: const Color(0xffFFFFFF)),
                                        )),
                                  ),
                                )
                              ],
                            )
                          : Container(
                              height: 200,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          'Match not found please \nscan valid QR code.',
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 20,
                                              color: Colors.black)),
                                      IconButton(
                                          onPressed: () {
                                            setState(() {
                                              controller.resumeCamera();
                                            });
                                            Navigator.pop(context);
                                          },
                                          icon: const Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            size: 30,
                                            color: Color(0xff2B1B1F),
                                          ))
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: const Color(0xffB0A9A9),
                                                width: 1),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(8))),
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.050,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.300,
                                        child: TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        BottomNav(0)),
                                              );
                                              // Navigator.pop(context);
                                            },
                                            child: Text("Buy new pack",
                                                style: GoogleFonts.poppins(
                                                    color:
                                                        const Color(0xffB0A9A9),
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w500))),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            controller.resumeCamera();
                                          });
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.050,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.300,
                                          decoration: const BoxDecoration(
                                              color: Color(0xffCE8C8C),
                                              borderRadius: BorderRadius.all(
                                                  (Radius.circular(10)))),
                                          child: InkWell(
                                            child: Text("Try again",
                                                style: GoogleFonts.poppins(
                                                    color:
                                                        const Color(0xffFFFFFF),
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                    );
                  });
            });
          });
        }
      });
    });
  }

  Future pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      controller!.resumeCamera();
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Match found",
                            style: GoogleFonts.poppins(
                                color: const Color(0xff847979),
                                fontWeight: FontWeight.w400,
                                fontSize: 12)),
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.keyboard_arrow_down_rounded,
                              size: 30,
                              color: Color(0xff2B1B1F),
                            ))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 0),
                              child: Container(
                                height: MediaQuery.of(context).size.height / 8,
                                width: MediaQuery.of(context).size.width / 4,
                                decoration: const BoxDecoration(
                                    color: Color(0xffFFFFFF)),
                                child:
                                    Image.asset("assets/images/packcard.png"),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 30),
                                ),
                                Text(
                                  textAlign: TextAlign.start,
                                  "[Pack name]",
                                  style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xff212121)),
                                ),
                                Text(
                                  "Price",
                                  style: GoogleFonts.poppins(
                                      fontSize: 32,
                                      fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.justify,
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 30),
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //         color: Color(0xffCE8C8C),
                  //         borderRadius: BorderRadius.all(Radius.circular(8))),
                  //     height: 48,
                  //     width: 309,
                  //     child: TextButton(
                  //         onPressed: () {
                  //           // Navigator.push(
                  //           //     context,
                  //           //     PageTransition(
                  //           //         type: PageTransitionType.fade,
                  //           //         child: const CartPage()));
                  //         },
                  //         child: Text(
                  //           "Activate pack",
                  //           style: GoogleFonts.poppins(
                  //               fontWeight: FontWeight.w600,
                  //               fontSize: 16,
                  //               color: const Color(0xffFFFFFF)),
                  //         )),
                  //   ),
                  // )
                ],
              ),
            );
          });
    }
    if (image == null) return;
    // final rest = await FlutterQrReader.imgScan(image.path);
    controller!.resumeCamera();
    const Text("Qr code can't be scanned from selected area");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () {
          if (backBotton) {
            setState(() {
              controller!.resumeCamera();
              backBotton = false;
            });
          } else {
            Navigator.pop(context);
          }

          var confirm;
          return confirm;
        },
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(),
                  child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1, color: const Color(0xffB6E1F4)),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20))),
                        child: QRView(
                          overlayMargin: EdgeInsets.symmetric(
                              vertical:
                                  MediaQuery.of(context).size.height / 3.2,
                              horizontal: 28),
                          overlay: QrScannerOverlayShape(
                            cutOutSize:
                                MediaQuery.of(context).size.height / 2.61,
                            borderColor: Colors.blueAccent,
                            // borderRadius: 10,
                            borderLength: 20,
                            borderWidth: 5,
                            overlayColor: const Color(0xff010040),
                          ),
                          key: _globalkey,
                          onQRViewCreated: qr,
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: (result != null)
                      ? Text('Result: ${result!.code}')
                      : const Text('Scan a code'),
                ),
              ]),
        ),
      ),
    );
  }
}

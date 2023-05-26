import 'dart:io';

import 'package:flutter/material.dart';

// import 'package:flutter_qr_reader_copy/flutter_qr_reader_copy.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrCodeScannerOne extends StatefulWidget {
  const QrCodeScannerOne({Key? key}) : super(key: key);

  @override
  State<QrCodeScannerOne> createState() => _QrCodeScannerOneState();
}

class _QrCodeScannerOneState extends State<QrCodeScannerOne> {
  @override
  void reassemble() async {
    super.reassemble();
    if (Platform.isAndroid) {
      await controller!.pauseCamera();
    }
    await controller!.resumeCamera();
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

  void qr(QRViewController controller) {
    this.controller = controller;
    // controller!.pauseCamera();
    controller.resumeCamera();

    controller.scannedDataStream.listen((event) {
      setState(() {
        // File imgFile = File(path);
        // print(imgFile.path);
        result = event;
        if (result != null) {
          controller.pauseCamera();
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
                            // const Icon(
                            //   Icons.keyboard_arrow_down_rounded,
                            //   size: 30,
                            //   color: Color(0xff2B1B1F),
                            // )
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
                                    height:
                                        MediaQuery.of(context).size.height / 8,
                                    width:
                                        MediaQuery.of(context).size.width / 4,
                                    decoration: const BoxDecoration(
                                        color: Color(0xffFFFFFF)),
                                    child:
                                        Image.asset("assets/img/packcard.png"),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      textAlign: TextAlign.start,
                                      "[Pack name]",
                                      style: GoogleFonts.poppins(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xff212121)),
                                    ),
                                    Text(
                                      textAlign: TextAlign.center,
                                      "Price",
                                      style: GoogleFonts.poppins(
                                          fontSize: 32,
                                          fontWeight: FontWeight.w500),
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
                          decoration: BoxDecoration(
                              color: Color(0xffCE8C8C),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          height: 48,
                          width: 309,
                          child: TextButton(
                              onPressed: () {
                                // Navigator.push(
                                //     context,
                                //     PageTransition(
                                //         type: PageTransitionType.fade,
                                //         child: const QrPackActivated()));
                              },
                              child: Text(
                                "Activate pack",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: const Color(0xffFFFFFF)),
                              )),
                        ),
                      )
                    ],
                  ),
                );
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
                        // const Icon(
                        //   Icons.keyboard_arrow_down_rounded,
                        //   size: 30,
                        //   color: Color(0xff2B1B1F),
                        // )
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
                                child: Image.asset("assets/img/packcard.png"),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  textAlign: TextAlign.start,
                                  "[Pack name]",
                                  style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xff212121)),
                                ),
                                Text(
                                  textAlign: TextAlign.center,
                                  "Price",
                                  style: GoogleFonts.poppins(
                                      fontSize: 32,
                                      fontWeight: FontWeight.w500),
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
    Text("Qr code can't be scanned from selected area");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          // Row(
          //   children: [
          //     const SizedBox(height: 19, width: 10),
          //     InkWell(
          //       child: const Icon(Icons.arrow_back_ios_outlined,
          //           color: Color(0xff0093ED), size: 20),
          //       onTap: () {
          //         Navigator.pop(context);
          //       },
          //     ),
          //     const SizedBox(
          //       height: 19,
          //       width: 20,
          //     ),
          //     const Text(
          //       "Scan QR Code",
          //       style: TextStyle(
          //           color: Color(
          //             0xff0093ED,
          //           ),
          //           fontSize: 18,
          //           fontWeight: FontWeight.w600),
          //     )
          //   ],
          // ),

          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      border:
                          Border.all(width: 1, color: const Color(0xffB6E1F4)),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                  child: QRView(
                    overlay: QrScannerOverlayShape(
                      cutOutSize: MediaQuery.of(context).size.height / 2.61,
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
          Container(
            width: MediaQuery.of(context).size.width * 0.2,
            height: MediaQuery.of(context).size.height * 0.05,
            decoration: BoxDecoration(
                border: Border.all(color: const Color(0xff0093ED), width: 2),
                borderRadius: const BorderRadius.all(Radius.circular(12))),
            child: TextButton(
                onPressed: () {
                  controller!.resumeCamera();
                },
                child: const Text("Retake")),
          ),
          // Center(
          //   child: (result != null)
          //       ? Text('Result: ${result!.code}')
          //       : const Text('Scan a code'),
          // ),
          // Text("$result"),
          // Container(
          //   height: 48,
          //   width: 309,
          //   decoration: const BoxDecoration(
          //       color: Color(0xff0093ED),
          //       borderRadius: BorderRadius.all(Radius.circular(5))),
          //   child: InkWell(
          //     child: SizedBox(
          //       width: MediaQuery.of(context).size.width * 0.824,
          //       height: MediaQuery.of(context).size.height * 0.059,
          //       child: InkWell(
          //         child: Row(
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             children: [
          //               const Image(
          //                   image: AssetImage("assets/img/photo_icon.png"),
          //                   height: 25),
          //               const SizedBox(width: 10, height: 48),
          //               Text(
          //                 "Select photo from a device",
          //                 style: GoogleFonts.poppins(
          //                     color: const Color(0xffFFFFFF),
          //                     fontWeight: FontWeight.w600,
          //                     fontSize: 16),
          //               )
          //             ]),
          //         onTap: () => pickImage(),
          //       ),
          //     ),
          //     onTap: () {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //             builder: (context) => const QrCodeScannerTwo()),
          //       );
          //       controller!.resumeCamera();
          //     },
          //   ),
          // )
        ]),
      ),
    );
  }
}

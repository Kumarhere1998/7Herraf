import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:herraf_app/newqrscan2.dart';

import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrCodeScannerOne extends StatefulWidget {
  const QrCodeScannerOne({Key? key}) : super(key: key);

  @override
  State<QrCodeScannerOne> createState() => _QrCodeScannerOneState();
}

class _QrCodeScannerOneState extends State<QrCodeScannerOne> {
  final GlobalKey _globalkey = GlobalKey();
  QRViewController? controller;
  Barcode? result;

  File? image;

  void qr(QRViewController controller) {
    this.controller = controller;
    controller.pauseCamera();
    controller.resumeCamera();

    controller.scannedDataStream.listen((event) {
      setState(() {
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height / 8,
                              width: MediaQuery.of(context).size.width / 4,
                              decoration:
                                  const BoxDecoration(color: Color(0xffB6E1F3)),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  textAlign: TextAlign.start,
                                  "Pack name",
                                  style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xff2B1B1F)),
                                ),
                                Container(
                                  width: 75,
                                  height: 26,
                                  color: const Color(0xffF7F2F4),
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    "pack id",
                                    style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "€12",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 24,
                                      color: const Color(0xff0093ED)),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: SizedBox(
                          height: 48,
                          width: 309,
                          child: ElevatedButton(
                              onPressed: () {
                                // Navigator.push(
                                //     context,
                                //     PageTransition(
                                //         type: PageTransitionType.fade,
                                //         child: const CartPage()));
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
                                color: const Color(0xff2B1B1F),
                                fontWeight: FontWeight.w700)),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height / 8,
                          width: MediaQuery.of(context).size.width / 4,
                          decoration:
                              const BoxDecoration(color: Color(0xffB6E1F3)),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              textAlign: TextAlign.start,
                              "Pack name",
                              style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xff2B1B1F)),
                            ),
                            Container(
                              width: 75,
                              height: 26,
                              color: const Color(0xffF7F2F4),
                              child: Text(
                                textAlign: TextAlign.center,
                                "pack id",
                                style: GoogleFonts.poppins(
                                    fontSize: 12, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "€12",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 24,
                                  color: const Color(0xff0093ED)),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: SizedBox(
                      height: 48,
                      width: 309,
                      child: ElevatedButton(
                          onPressed: () {
                            // Navigator.push(
                            //     context,
                            //     PageTransition(
                            //         type: PageTransitionType.fade,
                            //         child: const CartPage()));
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
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Row(
          children: [
            const SizedBox(height: 19, width: 10),
            InkWell(
              child: const Icon(Icons.arrow_back_ios_outlined,
                  color: Color(0xff0093ED), size: 20),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(
              height: 19,
              width: 20,
            ),
            const Text(
              "Scan QR Code",
              style: TextStyle(
                  color: Color(
                    0xff0093ED,
                  ),
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 2.61,
                width: MediaQuery.of(context).size.width / 1.20,
                decoration: BoxDecoration(
                    border:
                        Border.all(width: 1, color: const Color(0xffB6E1F4)),
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
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
        // Text("$result"),
        Container(
          height: 48,
          width: 309,
          decoration: const BoxDecoration(
              color: Color(0xff0093ED),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: InkWell(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.824,
              height: MediaQuery.of(context).size.height * 0.059,
              child: InkWell(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Image(
                      image: AssetImage("assets/images/Frame(8).png"),
                      height: 25),
                  const SizedBox(width: 10, height: 48),
                  Text(
                    "Select photo from a device",
                    style: GoogleFonts.poppins(
                        color: const Color(0xffFFFFFF),
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  )
                ]),
                onTap: () => pickImage(),
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => QrCodeScannerTwo()),
              );
            },
          ),
        )
      ]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QrCodeScannerthree extends StatefulWidget {
  const QrCodeScannerthree({Key? key}) : super(key: key);

  @override
  State<QrCodeScannerthree> createState() => _QrCodeScannerthreeState();
}

class _QrCodeScannerthreeState extends State<QrCodeScannerthree> {
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
            Text(
              "Scan QR code",
              style: GoogleFonts.poppins(
                  color: const Color(
                    0xff0093ED,
                  ),
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: Container(
            height: MediaQuery.of(context).size.height / 2.61,
            width: MediaQuery.of(context).size.width / 1.20,
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: const Color(0xffB6E1F4))),
            child: AlertDialog(
              backgroundColor: Color(0xffF1F6FF),
              content: const Icon(
                Icons.error_outline,
                color: Color(0xffEB5757),
                size: 25,
              ),
              actions: <Widget>[
                Text(
                  "QR code can’t be scanned\nfrom the selected image",
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff0093ED)),
                )
              ],
              elevation: 0,
            ),
          ),
        ),
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
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Image(
                    image: AssetImage("assets/img/photo_icon.png"), height: 25),
                const SizedBox(width: 10, height: 48),
                Text(
                  "Select photo from a device",
                  style: GoogleFonts.poppins(
                      color: const Color(0xffFFFFFF),
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                )
              ]),
            ),
            onTap: () {
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
                                Text("Match found1",
                                    style: GoogleFonts.poppins(
                                        color: const Color(0xff2B1B1F),
                                        fontWeight: FontWeight.w700)),
                                IconButton(
                                    onPressed: () {},
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
                                  height:
                                      MediaQuery.of(context).size.height / 8,
                                  width: MediaQuery.of(context).size.width / 4,
                                  decoration: const BoxDecoration(
                                      color: Color(0xffB6E1F3)),
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
                                      color: Color(0xffF7F2F4),
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
                                  onPressed: () {},
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
            },
          ),
        )
      ]),
    );
  }
}

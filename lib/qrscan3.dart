// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:herraf_app/qrscan4.dart';
//
// class QrCodeScannerTwo extends StatefulWidget {
//   const QrCodeScannerTwo({Key? key}) : super(key: key);
//
//   @override
//   State<QrCodeScannerTwo> createState() => _QrCodeScannerTwoState();
// }
//
// class _QrCodeScannerTwoState extends State<QrCodeScannerTwo> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
//         Row(
//           children: [
//             const SizedBox(height: 19, width: 10),
//             InkWell(
//               child: const Icon(Icons.arrow_back_ios_outlined,
//                   color: Color(0xff0093ED), size: 20),
//               onTap: () {
//                 Navigator.pop(context);
//               },Api
//             ),
//             const SizedBox(
//               height: 19,
//               width: 20,
//             ),
//             const Text(
//               "Scan QR Code",
//               style: TextStyle(
//                   color: Color(
//                     0xff0093ED,
//                   ),
//                   fontSize: 18,
//                   fontWeight: FontWeight.w600),
//             )
//           ],
//         ),
//         Padding(
//           padding: const EdgeInsets.only(bottom: 50),
//           child: Container(
//             height: MediaQuery.of(context).size.height / 2.61,
//             width: MediaQuery.of(context).size.width / 1.20,
//             decoration: BoxDecoration(
//                 border: Border.all(width: 1, color: const Color(0xffB6E1F4))),
//             child: Image.asset("assets/images/Group(3).png"),
//           ),
//         ),
//         Container(
//           height: 48,
//           width: 309,
//           decoration: const BoxDecoration(
//               color: Color(0xff0093ED),
//               borderRadius: BorderRadius.all(Radius.circular(5))),
//           child: InkWell(
//             child: SizedBox(
//               width: MediaQuery.of(context).size.width * 0.824,
//               height: MediaQuery.of(context).size.height * 0.059,
//               child:
//                   Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//                 const Image(
//                     image: AssetImage("assets/images/Frame(8).png"),
//                     height: 25),
//                 const SizedBox(width: 10, height: 48),
//                 Text(
//                   "Select photo from a device",
//                   style: GoogleFonts.poppins(
//                       color: const Color(0xffFFFFFF),
//                       fontWeight: FontWeight.w600,
//                       fontSize: 16),
//                 )
//               ]),
//             ),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => QrCodeScannerthree()),
//               );
//             },
//           ),
//         )
//       ]),
//     );
//   }
// }

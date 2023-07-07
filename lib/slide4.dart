// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:herraf_app/mainscreen.dart';

// class SlideFour extends StatefulWidget {
//   const SlideFour({Key? key}) : super(key: key);

//   @override
//   State<SlideFour> createState() => _SlideFourState();
// }

// class _SlideFourState extends State<SlideFour> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//           Column(
//             children: [
//               Text("Now as you learned what the",
//                   style: GoogleFonts.poppins(
//                       fontWeight: FontWeight.w700, fontSize: 18)),
//               Text("flashcards are, do you want to",
//                   style: GoogleFonts.poppins(
//                       fontWeight: FontWeight.w700, fontSize: 18)),
//               Text("check our catalog?",
//                   style: GoogleFonts.poppins(
//                       fontWeight: FontWeight.w700, fontSize: 18)),
//             ],
//           ),
//           const SizedBox(width: double.infinity, height: 40),
//           Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
//             Container(
//                 alignment: Alignment.center,
//                 height: 30,
//                 width: 34,
//                 child: const Text("No",
//                     style: TextStyle(
//                         color: Colors.red,
//                         fontSize: 24,
//                         fontWeight: FontWeight.w700))),
//             InkWell(
//               onTap: () {
//                 Navigator.of(context).push(
//                     MaterialPageRoute(builder: (context) => MainScreen()));
//               },
//               child: Container(
//                   alignment: Alignment.center,
//                   height: 30,
//                   width: 45,
//                   child: const Text("Yes",
//                       style: TextStyle(
//                           color: Colors.green,
//                           fontSize: 24,
//                           fontWeight: FontWeight.w700))),
//             ),
//           ]),
//         ]),
//       ),
//     );
//   }
// }

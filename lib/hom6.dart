import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.396,
      width: MediaQuery.of(context).size.width * 0.65,
      decoration: BoxDecoration(
          color: const Color(0xffF1F6FF),
          border: Border.all(width: 2.68, color: const Color(0xffB6E1F4)),
          borderRadius: const BorderRadius.all(Radius.circular(21.46))),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Text(
          "Classic",
          style: GoogleFonts.poppins(
              color: const Color(0xff0093ED),
              fontSize: 32.2,
              fontWeight: FontWeight.w600),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(
              Icons.circle,
              size: 20,
              color: Color(0xff0093ED),
            ),
            Text("Play randomly or with\na teammate",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500, fontSize: 14))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(
              Icons.circle,
              size: 20,
              color: Color(0xff0093ED),
            ),
            Text(
              "Limited playing time\n(3 minutes)",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500, fontSize: 14),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(
              Icons.circle,
              size: 20,
              color: Color(0xff0093ED),
            ),
            Text(
              "Receive game\nexperience and\nincrease your league",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            )
          ],
        ),
      ]),
    );
  }
}

class SliderTwo extends StatelessWidget {
  const SliderTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.396,
      width: MediaQuery.of(context).size.width * 0.65,
      decoration: BoxDecoration(
          color: const Color(0xffF1F6FF),
          border: Border.all(width: 2.68, color: const Color(0xffB6E1F4)),
          borderRadius: const BorderRadius.all(Radius.circular(21.46))),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Text(
          "Adventure",
          style: GoogleFonts.poppins(
              color: const Color(0xff0093ED),
              fontSize: 32.2,
              fontWeight: FontWeight.w600),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(
              Icons.circle,
              size: 20,
              color: Color(0xff0093ED),
            ),
            Text("Play randomly or with\na teammate",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500, fontSize: 14))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(
              Icons.circle,
              size: 20,
              color: Color(0xff0093ED),
            ),
            Text(
              "Limited playing time\n(3 minutes)",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500, fontSize: 14),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(
              Icons.circle,
              size: 20,
              color: Color(0xff0093ED),
            ),
            Text(
              "Receive game\nexperience and\nincrease your league",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            )
          ],
        ),
      ]),
    );
  }
}

class SlideThree extends StatelessWidget {
  const SlideThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.396,
      width: MediaQuery.of(context).size.width * 0.65,
      decoration: BoxDecoration(
          color: const Color(0xffF1F6FF),
          border: Border.all(width: 2.68, color: const Color(0xffB6E1F4)),
          borderRadius: const BorderRadius.all(Radius.circular(21.46))),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Text(
          "Practice",
          style: GoogleFonts.poppins(
              color: const Color(0xff0093ED),
              fontSize: 32.2,
              fontWeight: FontWeight.w600),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(
              Icons.circle,
              size: 20,
              color: Color(0xff0093ED),
            ),
            Text("Computer based game",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500, fontSize: 14))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(
              Icons.circle,
              size: 20,
              color: Color(0xff0093ED),
            ),
            Text(
              "Limited playing time\n(3 minutes)",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500, fontSize: 14),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(
              Icons.circle,
              size: 20,
              color: Color(0xff0093ED),
            ),
            Text(
              "Receive game\nexperience and\nincrease your league",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            )
          ],
        ),
      ]),
    );
  }
}

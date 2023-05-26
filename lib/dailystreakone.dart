import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:herraf_app/dailystreak2.dart';

class DailyStreakOne extends StatefulWidget {
  const DailyStreakOne({Key? key}) : super(key: key);

  @override
  State<DailyStreakOne> createState() => _DailyStreakOneState();
}

class _DailyStreakOneState extends State<DailyStreakOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Color(0xff0093ED),
                      size: 18,
                    )),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Daily streak",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: const Color(0xff0093ED)),
                    )),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.086,
                    child: Image.asset("assets/images/flames 1.png")),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.059,
                    width: MediaQuery.of(context).size.width * 0.818,
                    child: Text("Daily streak",
                        style: GoogleFonts.poppins(
                            color: const Color(0xff00253A),
                            fontSize: 32,
                            fontWeight: FontWeight.w700),
                        textAlign: TextAlign.center),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.059,
                      width: MediaQuery.of(context).size.width * 0.784,
                      child: Text(
                        "Choose the combination of parameters you want to meet by the end of a day",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: const Color(0xff828282)),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.821,
                    height: MediaQuery.of(context).size.height * 0.056,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DailyStreakTwo()));
                        },
                        child: Text(
                          "Set up daily goal",
                          style: GoogleFonts.poppins(
                              color: const Color(0xffFFFFFF),
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        )),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 100,
            )
          ],
        )),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:herraf_app/catalog.dart';

class CheckoutSix extends StatefulWidget {
  const CheckoutSix({Key? key}) : super(key: key);

  @override
  State<CheckoutSix> createState() => _CheckoutSixState();
}

class _CheckoutSixState extends State<CheckoutSix> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            decoration: const BoxDecoration(
                color: Color(0xff8CFD90),
                borderRadius: BorderRadius.all(Radius.circular(8))),
            width: 67,
            height: 67,
            child: const Icon(Icons.check, size: 30),
          ),
          SizedBox(height: 10),
          Text("Thank you",
              style: GoogleFonts.poppins(
                  color: const Color(0xff333333),
                  fontSize: 24,
                  fontWeight: FontWeight.w700)),
          SizedBox(height: 25),
          Text(
            "Your order was successfully placed",
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: const Color(0xff4F4F4F)),
          ),
          SizedBox(height: 35),
          Container(
            width: 309,
            height: 48,
            decoration: const BoxDecoration(
                color: Color(0xff0093ED),
                borderRadius: BorderRadius.all(Radius.circular(4))),
            child: ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.334,
                            child: SizedBox(
                              height: MediaQuery.of(context).size.width * 0.837,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                // mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      InkWell(
                                        child: Container(
                                          height: 20,
                                          width: 20,
                                          alignment: Alignment.center,
                                          decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20)),
                                              color: Color(0xff7DD8FF)),
                                          child: const Center(
                                              child: Icon(
                                            Icons.cancel_outlined,
                                            color: Color(0xff0093ED),
                                          )),
                                        ),
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ],
                                  ),
                                  Text("Sure you want to leave?",
                                      style: GoogleFonts.poppins(
                                          color: const Color(0xff00253A),
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18)),
                                  Text("The data you entered will\nbe unsaved.",
                                      style: GoogleFonts.poppins(
                                          color: const Color(0xff333333)
                                              .withOpacity(0.7),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15),
                                      textAlign: TextAlign.center),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.of(context)
                                                  .pushReplacement(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              CatalogPage()));
                                            },
                                            child: Text(
                                              "Leave",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  color:
                                                      const Color(0xff2F80ED)),
                                            )),
                                        SizedBox(
                                          height: 48,
                                          width: 141,
                                          child: ElevatedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                "Stay",
                                                style: GoogleFonts.poppins(
                                                    color:
                                                        const Color(0xffFFFFFF),
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16),
                                              )),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                },
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width / 1.5,
                  height: MediaQuery.of(context).size.height / 15,
                  child: Text("Go to a home screen",
                      style: GoogleFonts.poppins(
                          fontSize: 16, fontWeight: FontWeight.w600)),
                )),
          )
        ]),
      ),
    );
  }
}

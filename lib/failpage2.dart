import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// stateful Widget

class FailPage extends StatefulWidget {
  @override
  _FailPageState createState() => _FailPageState();
}

class _FailPageState extends State<FailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            'assets/images/pattern.png',
            fit: BoxFit.cover,
            color: Colors.black54,
            colorBlendMode: BlendMode.darken,
          ),
          Padding(
            padding: new EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
          ),
          Column(
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(
                left: 40,
              )),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(children: <Widget>[
                  Icon(
                    Icons.arrow_back,
                    size: 24,
                    color: Color(0xffffffff),
                  ),
                  Padding(padding: const EdgeInsets.only(right: 40, top: 100)),

                  // Container(
                  //   child: Image.asset(
                  //     'assets/images/addcart.png',
                  //     height: 32,
                  //     width: 32,
                  //     // width: MediaQuery.of(context).size.width * 0.94,
                  //     // height: MediaQuery.of(context).size.height * 0.14,
                  //   ), // <-- SEE HERE
                  // ),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  padding: const EdgeInsets.only(top: 20),
                  height: 314,
                  width: 198,
                  // padding: const EdgeInsets.all(20.0),
                  child: new Image.asset(
                    "assets/images/Endocarditis_Heart.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                //  padding: const EdgeInsets.only(top: 0, right: 200),
                // margin: new EdgeInsets.symmetric(
                //   horizontal: 20.0,
                //),

                child: Text(
                  "Failure",
                  style: GoogleFonts.poppins(
                      color: Color(0xffffffff),
                      fontSize: 32,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),

                // Container(
                //   child: Image.asset(
                //     'assets/images/addcart.png',
                //     height: 32,
                //     width: 32,
                //     // width: MediaQuery.of(context).size.width * 0.94,
                //     // height: MediaQuery.of(context).size.height * 0.14,
                //   ), // <-- SEE HERE
                // ),
              ),
              Container(
                //  padding: const EdgeInsets.only(top: 0, right: 200),
                // margin: new EdgeInsets.symmetric(
                //   horizontal: 20.0,
                //),

                child: Text(
                  "exp -50",
                  style: GoogleFonts.poppins(
                      color: Color(0xffffffff),
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),

                // Container(
                //   child: Image.asset(
                //     'assets/images/addcart.png',
                //     height: 32,
                //     width: 32,
                //     // width: MediaQuery.of(context).size.width * 0.94,
                //     // height: MediaQuery.of(context).size.height * 0.14,
                //   ), // <-- SEE HERE
                // ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

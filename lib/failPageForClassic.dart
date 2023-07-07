// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FailPageForClassic extends StatefulWidget {
  String message = '';
  FailPageForClassic(
    this.message,
  );

  @override
  State<FailPageForClassic> createState() => _FailPageForClassicState();
}

class _FailPageForClassicState extends State<FailPageForClassic> {
  _playAgain() {
    Navigator.pop(context, {'message': widget.message});
    Navigator.pop(context, {'message': widget.message});
  }

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
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 50,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 50, right: 30),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.close,
                          size: 24,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                height: 314,
                width: 198,
                child: new Image.asset(
                  "assets/images/Endocarditis_Heart.png",
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                // child: Text(
                //   widget.status,
                //   style: GoogleFonts.poppins(
                //       color: Color(0xffffffff),
                //       fontSize: 32,
                //       fontWeight: FontWeight.w500),
                //   textAlign: TextAlign.center,
                // ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),

                child: Text(
                  widget.message,
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
              Padding(
                padding: const EdgeInsets.only(
                  top: 170,
                ),
              ),
              InkWell(
                  onTap: () {
                    _playAgain();
                  },
                  child: Container(
                    margin:
                        new EdgeInsets.symmetric(horizontal: 4.0, vertical: 4),
                    alignment: Alignment.center,
                    height: 56,
                    width: 330,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xffCE8C8C),
                    ),
                    child: Text(
                      "Play again",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          color: Color(0xffffffff),
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}

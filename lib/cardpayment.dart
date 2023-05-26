import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Cardcreen extends StatefulWidget {
  @override
  _CardcreenState createState() => _CardcreenState();
}

class _CardcreenState extends State<Cardcreen> {
  int _selection = 0;

  selectTime(dynamic timeSelected) {
    setState(() {
      _selection = timeSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    var radio5 = Radio(
      focusColor: Colors.red,
      groupValue: _selection,
      onChanged: selectTime,
      value: 5,
    );
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xffDADADA),
      appBar: AppBar(
        backgroundColor: Color(0xffDADADA),
        //  backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: InkWell(
          onTap: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => CartOnePage()),
            // );
          },
          child: Container(
            child: Text("Checkout",
                style: GoogleFonts.poppins(
                    color: const Color(0xff212121),
                    fontSize: 16,
                    fontWeight: FontWeight.w500)),
          ),
        ),
        leading: InkWell(
          onTap: (() {
            Navigator.of(context).pop();
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => profilePage2()),
            // );
          }),
          child: Container(
            padding: const EdgeInsets.only(
              left: 20,
            ),
            child: Icon(
              Icons.arrow_back,
              size: 24,
              color: Color(0xff212121),
            ),
          ),
        ),
      ),
      body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 20),
              ),
              Row(
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      setState(() {
                        _selection = 5;
                      });
                    },
                    child: Stack(
                      children: <Widget>[
                        Container(
                          height: 110,
                          width: 340,
                          color: _selection == 5
                              ? Color(0xffF1F6FF)
                              : Color(0xffffffff),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: radio5,
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 20),
                              child: Image.asset(
                                'assets/images/visa.png',
                                height: 40,
                                width: 65,
                              ),
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.only(left: 100, top: 10),
                              child: Text(
                                "03/25",
                                style: GoogleFonts.poppins(
                                    color: Color(0xff212121),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                                padding:
                                    const EdgeInsets.only(left: 30, top: 5),
                                child: Icon(
                                  Icons.delete,
                                  color: Color(0xffE9361C),
                                )),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                              padding:
                                  const EdgeInsets.only(top: 50, left: 100),
                              child: Image.asset(
                                'assets/images/card number.png',
                                height: 40,
                                width: 216,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          )),
    ));
  }
}

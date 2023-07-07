import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:herraf_app/api_servivce.dart';

class Paypalscreen extends StatefulWidget {
  @override
  _PaypalscreenState createState() => _PaypalscreenState();
}

class _PaypalscreenState extends State<Paypalscreen> {
  int _index = 0;
  @override
  void initState() {
    membership();
    super.initState();
  }

  List data = [];

  membership() {
    ApiService.membership().then((value) {
      setState(() {
        data = value["data"];
        // isLoading1 = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SizedBox(
          height: 320, // card height
          child: PageView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: data.length,
            controller: PageController(viewportFraction: 0.7),
            onPageChanged: (int index) => setState(() => _index = index),
            itemBuilder: (_, i) {
              return Transform.scale(
                scale: i == _index ? 1 : 0.9,
                // child: Card(
                //   elevation: 6,
                //   shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(20)),
                child: Stack(
                    alignment: Alignment.topCenter,
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: 230,
                        height: 290,
                        decoration: BoxDecoration(
                          // color: Colors.white,
                          image: DecorationImage(
                              image: NetworkImage(
                                  'http://165.22.215.103:4000/uploads/${data[i]["membership_image"]}'),
                              fit: BoxFit.cover),

                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),

                        // color: Colors.orang
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.height * 0.05,
                        child: Text(
                          '${data[i]["membership_name"]}',
                          style: GoogleFonts.roboto(
                            color: const Color(0xff212121),
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ]),
              );
            },
          ),
        ),
      ),
    );
  }
}

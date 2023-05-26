import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:herraf_app/api_servivce.dart';
import 'package:herraf_app/invite.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Playingcreen2 extends StatefulWidget {
  @override
  _Playingcreen2State createState() => _Playingcreen2State();
}

class _Playingcreen2State extends State<Playingcreen2> {
  int _selection = 0;

  selectTime(dynamic timeSelected) {
    setState(() {
      _selection = timeSelected;
    });
  }

  @override
  void initState() {
    selectpack();
    super.initState();
  }

  Map mypack = {};
  selectpack() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    ApiService.selectpack(pref.getString('user_id')).then((value) {
      print("selectpack");
      setState(() {
        var mypack = value["data"];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: GridView.builder(
        //shrinkWrap: true,
        itemCount: mypack.length,
        itemBuilder: (BuildContext _context, int index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Card(
                clipBehavior: Clip.antiAlias, //
                elevation: 0.5,
                color: Colors.white,
                child: Container(
                  width: 300.0,
                  child: Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        new Stack(
                          children: <Widget>[
                            // AspectRatio(
                            //   child: new Image.network(
                            //     mypack [index].image,
                            //     fit: BoxFit.cover,
                            //   ),
                            //   aspectRatio: 1.5 / 1,
                            // ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              left: 15.0, top: 15.0, right: 15.0),
                          //width: 300.0,
                          child: Column(
                            children: [
                              ListTile(
                                title: Text(
                                  mypack[index]["pack_name"],
                                  style: GoogleFonts.poppins(
                                      color: Color(0xFF212121),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.start,
                                ),
                              ),

                              // Container(
                              //   child: Text(
                              //     slpProduct[index].price,
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Container(
              //   width: 300.0, //todo
              //   padding: EdgeInsets.only(left: 10.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: <Widget>[
              //       ClipRRect(
              //         borderRadius: BorderRadius.circular(40),
              //         child: Image(
              //           image: NetworkImage(slpProduct[index].image),
              //           width: 25,
              //           height: 25,
              //           fit: BoxFit.cover,
              //         ),
              //       ),
              //       SizedBox(
              //         width: 10,
              //       ),
              //       Text(slpProduct[index].providerName),
              //       Spacer(),
              //       Row(
              //         children: [
              //           IconButton(
              //             onPressed: () {},
              //             icon: Icon(
              //               CupertinoIcons.bookmark,
              //               color: kTextColor,
              //               size: 18.0,
              //             ),
              //           ),
              //         ],
              //       ),
              //     ],
              //   ),
              // ),
            ],
          );
        },
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300.0,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
      ),
    ));
  }
}

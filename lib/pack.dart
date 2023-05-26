import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:herraf_app/api_servivce.dart';
import 'package:herraf_app/invite.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyPack extends StatefulWidget {
  @override
  _MyPackState createState() => _MyPackState();
}

bool isLoading = true;

class _MyPackState extends State<MyPack> {
  List<dynamic> mypack = [];

  @override
  void initState() {
    selectpack;
    super.initState();
  }

  get selectpack async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    print(pref.get('user_id'));
    ApiService.selectpack(pref.get('user_id')).then((value) {
      // print(value);
      setState(() {
        // print("Playing Cart ==>${value}");
        isLoading = false;
        if (value['data'].length > 0) {
          mypack = value['data'];
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var numberOfCard = mypack.length;
    return Scaffold(
      // backgroundColor: Color(0xffDADADA),
      backgroundColor: Color.fromARGB(234, 253, 252, 252),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                // color: Colors.amber,
                child: Stack(
              alignment: Alignment.topCenter,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Image.asset("assets/images/background-top(1).png"),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          size: 24,
                          color: Color(0xff212121),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Select playing pack',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff212121),
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 30,
                  child: Row(
                    children: [
                      Text(
                        "My Packs",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        '($numberOfCard)',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ],
            )),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Container(
                  height: 180,
                  child: isLoading
                      ? Center(
                          child: CircularProgressIndicator(
                              color: Color(0xffCE8C8C)))
                      : mypack.length == 0
                          ? Center(
                              child: Text(
                              "Playing pack is not available",
                              style: GoogleFonts.poppins(
                                  color: Color(0xffB0A9A9), fontSize: 20),
                              textAlign: TextAlign.center,
                            ))
                          : GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2, crossAxisSpacing: 10),
                              itemCount: mypack.length,
                              itemBuilder: (context, position) {
                                return InkWell(
                                  onTap: (() {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                InvitefriendPage(
                                                    packname: mypack[position]
                                                        ["pack_name"],
                                                    packid: mypack[position]
                                                        ["id"])));
                                  }),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            width: 175,
                                            height: 122,
                                            decoration: BoxDecoration(
                                              color: Colors.grey,
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      'http://165.22.215.103:4000/uploads/${mypack[position]["image1"]}'),
                                                  fit: BoxFit.cover),
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(5),
                                                  topRight: Radius.circular(5)),
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(5),
                                                    bottomRight:
                                                        Radius.circular(5))),
                                            child: Expanded(
                                              child: Row(
                                                children: [
                                                  Radio(
                                                      fillColor:
                                                          MaterialStateColor
                                                              .resolveWith(
                                                        (states) =>
                                                            Color((0xffCE8C8C)),
                                                      ),
                                                      value: 0,
                                                      groupValue: 'user_id',
                                                      onChanged: (index) {
                                                        setState(() {
                                                          // print("${mypack}");
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (context) => InvitefriendPage(
                                                                      packname:
                                                                          mypack[position]
                                                                              [
                                                                              "pack_name"],
                                                                      packid: mypack[
                                                                              position]
                                                                          [
                                                                          "id"])));
                                                        });
                                                      }),
                                                  Expanded(
                                                    child: Text(
                                                      mypack[position]
                                                          ["pack_name"],
                                                      style: GoogleFonts.poppins(
                                                          color: const Color(
                                                              (0xff544D4D)),
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 14),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              flex: 1,
                                            ),
                                          ),
                                        ]),
                                  ),
                                );
                              },
                            )),
            )
          ],
        )),
      ),
    );
  }
}

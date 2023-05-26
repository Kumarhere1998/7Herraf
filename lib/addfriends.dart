// import 'dart:html';
// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:herraf_app/api_servivce.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddFriendsPage extends StatefulWidget {
  AddFriendsPage({Key? key}) : super(key: key);

  State<AddFriendsPage> createState() => _AddFriendsPageState();
}

class _AddFriendsPageState extends State<AddFriendsPage> {
  String search_string = '';
  String user_id = '';

  // File? get imageFile => null;
  List<dynamic> friendlist = [];
  List<dynamic> searchlist = [];

  @override
  void initState() {
    friendslist();
    _searchlist();

    super.initState();
  }

  bool loading = true;

  _searchlist() {
    ApiService.searchlist(search_string).then((value) {
      print("hgdh");
      setState(() {
        print("ranjan${value}");
        friendlist = value["data"];
        loading = false;
      });
    });
  }

  _sendRequest(index) async {
    // print('user_to_id ${friendlist[index]["id"]}');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      user_id = prefs.getString('user_id')!;
      print(user_id);
    });
    ApiService.send_request(prefs.getString('user_id'), friendlist[index]["id"])
        .then((value) {
      print(value);
    });
  }

  friendslist() {
    ApiService.friendslist().then((value) {
      print("hoglllg");
      setState(() {
        print("ranjanFriend${value}");
        friendlist = value["data"];
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  // height: MediaQuery.of(context).size.height * 0.30,
                  width: double.infinity,
                  child: Image.asset("assets/images/background-top(1).png"),
                ),
                Positioned(
                  top: 10,
                  left: 5,
                  child: Container(
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
                          'Add Friends',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff212121),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  // top: 10,
                  bottom: 70,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(33),
                    ),
                    margin: EdgeInsets.only(
                        left: 15, right: 15, bottom: 5, top: 150),
                    height: 59,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: TextFormField(
                      onFieldSubmitted: _searchlist(),
                      onChanged: (value) {
                        setState(() {
                          search_string = value;
                        });
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(33.0),
                          ),
                          labelText: '',
                          suffixIcon: IconButton(
                            icon: Icon(Icons.search),
                            onPressed: () {
                              _searchlist();
                            },
                          )),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 1,
                  left: 30,
                  child: Text(
                    'Search result',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                )
              ],
            ),

            SingleChildScrollView(
              child: Container(
                child: loading
                    ? Center(child: CircularProgressIndicator())
                    : friendlist.length == 0
                        ? Center(
                            child: Text(
                              "No Result Found",
                              style: GoogleFonts.poppins(
                                  color: Color(0xff3D4F5E), fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                          )
                        : ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: friendlist.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                margin: EdgeInsets.only(left: 10, right: 10),
                                child: Card(
                                  child: ListTile(
                                    leading: friendlist[index]["user_image"] ==
                                            null
                                        ? CircleAvatar(
                                            backgroundColor:
                                                const Color(0xffffffff),
                                            radius: 25,
                                            backgroundImage: const AssetImage(
                                                'assets/images/ronald.png'))
                                        : CircleAvatar(
                                            radius: 30,
                                            child: ClipOval(
                                              child: Image.network(
                                                  friendlist[index]
                                                          ["user_image"]
                                                      .toString()),
                                            ),
                                          ),
                                    title: Row(
                                      children: <Widget>[
                                        Text(
                                          '${friendlist[index]["first_name"]} ${friendlist[index]["last_name"]}',
                                          style: GoogleFonts.poppins(
                                              color: Color(0xff000000),
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: 50,
                                          ),
                                        ),
                                      ],
                                    ),
                                    subtitle: InkWell(
                                      onTap: () {},
                                      child: InkWell(
                                        onTap: () {
                                          // print('Clicked');
                                          _sendRequest(index);
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                Future.delayed(
                                                    Duration(seconds: 3), () {
                                                  Navigator.of(context)
                                                      .pop(true);
                                                });
                                                return Stack(
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          color: Colors.black,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          10))),
                                                      padding: EdgeInsets.only(
                                                          left: 20, right: 10),
                                                      height: 50,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.9,
                                                      child: Center(
                                                        child: Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                                'You have sent Friend Request',
                                                                style: GoogleFonts.roboto(
                                                                    color: const Color(
                                                                        0xffffffff),
                                                                    fontSize:
                                                                        13)),
                                                            TextButton(
                                                                onPressed: () {
                                                                  print(
                                                                      'Clicked');
                                                                },
                                                                child: Text(
                                                                    'Undo',
                                                                    style: GoogleFonts.roboto(
                                                                        color: Color(
                                                                            0xffCE8C8C),
                                                                        fontSize:
                                                                            13)))
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              });
                                        },
                                        child: Container(
                                            padding: EdgeInsets.only(top: 5),
                                            child: Row(
                                              children: [
                                                Image.asset(
                                                    "assets/images/Add_friends.png"),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Send request',
                                                  style: GoogleFonts.poppins(
                                                      color: Color(0xffCE8C8C),
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ],
                                            )),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
              ),
            ),

            // /////////////////////////////
          ],
        ),
      )),
    );
  }
  // void showAlert(BuildContext context) {}
}

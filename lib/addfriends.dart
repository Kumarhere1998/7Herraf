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
  String user_image = '';
  List<dynamic> allUsers = [];
  bool urlImage = false;

  @override
  void initState() {
    _allUsers();
    super.initState();
  }

  bool loading = true;

  _searchlist() {
    ApiService.searchlist(search_string).then((value) {
      allUsers = value["data"];
      loading = false;
    });
  }

  _sendRequest(index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      user_id = prefs.getString('user_id')!;
    });
    ApiService.send_request(prefs.getString('user_id'), allUsers[index]["id"])
        .then((value) {
      if (value['status']) {
        showDialog(
            context: context,
            builder: (context) {
              Future.delayed(Duration(seconds: 5), () {
                Navigator.of(context).pop(true);
              });
              return Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    padding: EdgeInsets.only(left: 20, right: 10),
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(value['message'],
                              style: GoogleFonts.roboto(
                                  decoration: TextDecoration.none,
                                  color: const Color(0xffffffff),
                                  fontSize: 13)),
                          TextButton(
                              onPressed: () {},
                              child: Text('Undo',
                                  style: GoogleFonts.roboto(
                                      color: Color(0xffCE8C8C), fontSize: 13)))
                        ],
                      ),
                    ),
                  ),
                ],
              );
            });
      }
    });
  }

  _allUsers() {
    ApiService.allUser().then((value) {
      allUsers = value["data"];
      setState(() {
        loading = false;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .250,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    // top: 10,
                    child: SizedBox(
                      // height: MediaQuery.of(context).size.height * 0.30,
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(
                        "assets/images/background-top(1).png",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
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
                    bottom: 75,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(33),
                      ),
                      margin: EdgeInsets.only(
                          left: 15, right: 15, bottom: 5, top: 150),
                      height: 50,
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
                    bottom: 15,
                    left: 30,
                    child: Text(
                      'Search result',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  )
                ],
              ),
            ),

            Container(
              height: MediaQuery.of(context).size.height * .710,
              child: SingleChildScrollView(
                physics: ScrollPhysics(),
                child: loading
                    ? Center(child: CircularProgressIndicator())
                    : allUsers.isEmpty
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
                            itemCount: allUsers.length,
                            itemBuilder: (BuildContext context, int index) {
                              if (allUsers[index]["user_image"]
                                      .contains("http") ||
                                  allUsers[index]["user_image"]
                                      .toString()
                                      .contains("https")) {
                                urlImage = true;
                              } else {
                                print(
                                    'here==>${URLS.IMAGE_URL}/${allUsers[index]['user_image']}');
                              }
                              return Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Card(
                                  child: ListTile(
                                    leading: urlImage
                                        ? CircleAvatar(
                                            backgroundColor:
                                                const Color(0xffffffff),
                                            radius: 30,
                                            backgroundImage: NetworkImage(
                                                allUsers[index]["user_image"]))
                                        : CircleAvatar(
                                            backgroundColor: Colors.grey[200],
                                            radius: 30,
                                            backgroundImage: NetworkImage(
                                                '${URLS.IMAGE_URL}/${allUsers[index]['user_image']}')),
                                    title: Row(
                                      children: <Widget>[
                                        Text(
                                          '${allUsers[index]["first_name"]}',
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
                                          _sendRequest(index);
                                        },
                                        child: Container(
                                            padding: EdgeInsets.only(top: 5),
                                            child: Row(
                                              children: [
                                                Container(
                                                  height: 20,
                                                  width: 20,
                                                  child: Image.asset(
                                                      "assets/images/Add_friends.png"),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Send request',
                                                  style: GoogleFonts.poppins(
                                                      color: Color(0xffCE8C8C),
                                                      fontSize: 13,
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

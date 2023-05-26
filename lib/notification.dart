import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:herraf_app/api_servivce.dart';
import 'package:herraf_app/invite.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationPage1 extends StatefulWidget {
  const NotificationPage1({Key? key}) : super(key: key);

  @override
  State<NotificationPage1> createState() => _NotificationPage1State();
}

class _NotificationPage1State extends State<NotificationPage1> {
  var storage;

  List<dynamic> notification = [];
  List<dynamic> gameFriend = [];
  final List checkedNotificationItem = [];

  void initState() {
    _notification();
    deletenotification(checkedNotificationItem);
    super.initState();
  }

  bool loading = true;
  bool isPressed = false;

  _notification() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    ApiService.notification(
      prefs.getString('user_id'),
    ).then((value) {
      print(value);
      setState(() {
        notification = [];
        notification = value["data"];
        print(notification);
        loading = false;
      });
    });
  }

  Future<void> deletenotification(checkedNotificationItem) async {
    ApiService.deletenotification(checkedNotificationItem).then((value) {
      print(value);
      setState(() {
        notification.clear();
      });
    });
  }

  // late Timer mytimer;

  _inviteAccept(index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    ApiService.accept_invite(
      prefs.getString('user_id'),
      notification[index]['id'],
      notification[index]['ugg_id'],
      notification[index]['user_from_id'],
    ).then((value) {
      print('HERE==>$value');

      if (value["status"] == true) {
        setState(() {
          gameFriend.add({
            "id": value["data"][0]["id"],
            "image": value["data"][0]["user_image"],
            "group_id": value["game_group_id"],
            "pack_id": value["packInfo"][0]["id"]
          });
        });
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => InvitefriendPage(
                    gameFriend: gameFriend[0],
                  )),
        );
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("${value['Here==>']}")));
      }

      // print(gameFriend);
    });
  }

  @override
  Widget build(BuildContext context) {
    // print("UGG ID on notification Page ==>${notification[index]['ugg_id']}");

    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  // height: MediaQuery.of(context).size.height * 0.30,
                  width: double.infinity,
                  child: Image.asset("assets/images/background-top(1).png"),
                ),
                Positioned(
                  top: 50,
                  child: Row(
                    children: [
                      Text('Notifications',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff212121),
                          )),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.35,
                      ),
                      InkWell(
                        onTap: () async {
                          print('Clicked');

                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          print(
                              "MYNOTIFICATION=${prefs.getBool('notification_effect')!}");
                          if (prefs.getBool('notification_effect') == true) {
                            AudioPlayer()
                                .play(AssetSource('sound/buttonClicked.wav'));
                          }
                        },
                        child: Text('Mark all as read',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffCE8C8C),
                            )),
                      ),
                    ],
                  ),
                ),
                notification.length > 0
                    ? Positioned(
                        left: 30,
                        child: Radio(
                            value: "Selected All",
                            groupValue: "group value",
                            onChanged: (value) {
                              print(value); //selected value
                            }),
                      )
                    : Container(),
                checkedNotificationItem.length > 0
                    ? Positioned(
                        right: 30,
                        child: InkWell(
                            onTap: () {
                              setState(() {
                                deletenotification(checkedNotificationItem);
                                print(checkedNotificationItem.length);
                                // Navigator.pushReplacement(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) =>
                                //             NotificationPage1()));

                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text("deleted")));
                              });
                            },
                            child: Icon(
                              Icons.delete,
                              color: Color(0xff212121),
                              size: 26.0,
                            )),
                      )
                    : Container(),
              ],
            ),
          ),
          loading
              ? Center(
                  child: CircularProgressIndicator(
                    color: Color(0xffCE8C8C),
                  ),
                )
              : notification.length == 0
                  ? Center(
                      child: Text('No Notification'),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: notification.length,
                      itemBuilder: (BuildContext context, int index) {
                        // print(
                        //     'ID PASSED TO API ==>${notification[index]["id"]}');
                        return SingleChildScrollView(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  height: 115,
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                      child: Checkbox(
                                          checkColor: Colors.red,
                                          activeColor: Color(0xffCE8C8C),
                                          splashRadius: 90,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15.0))),
                                          value:
                                              checkedNotificationItem.contains(
                                                  notification[index]["id"]),
                                          onChanged: (bool? value) {
                                            print(
                                                'SLECTED ID==>${notification[index]["id"]}');
                                            // print(
                                            //     'ITEMS CHECKED==>$checkedNotificationItem.length');
                                            setState(() {
                                              if (checkedNotificationItem
                                                  .contains(notification[index]
                                                      ["id"])) {
                                                print(
                                                    'SELECTED==>$notification[index]["id"]');
                                                checkedNotificationItem.remove(
                                                    notification[index]["id"]);
                                              } else {
                                                checkedNotificationItem.add(
                                                    notification[index]["id"]);
                                                isPressed = true;
                                              }
                                            });
                                          }),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 20),
                                  // color: Colors.amber,
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  child: Card(
                                    child: Column(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(
                                            left: 20,
                                            top: 10,
                                            right: 10,
                                          ),
                                          child: Text(
                                            '${notification[index]["description"]}',
                                            style: GoogleFonts.poppins(
                                                color: Color(0xff544D4D),
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                            right: 30,
                                          ),
                                          height: 50,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  print('Reject Invitation');
                                                },
                                                child: Text('Reject Invitation',
                                                    style: GoogleFonts.poppins(
                                                        color:
                                                            Color(0xff544D4D),
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w500)),
                                              ),
                                              SizedBox(
                                                width: 40,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  _inviteAccept(index);
                                                },
                                                child: Text('Play',
                                                    style: GoogleFonts.poppins(
                                                        color:
                                                            Color(0xffCE8C8C),
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w500)),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ]),
                        );
                      },
                    )
        ],
      ),
    ));
  }
}

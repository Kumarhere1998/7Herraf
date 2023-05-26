import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:herraf_app/catalog.dart';

import 'package:herraf_app/myfriend.dart';
import 'package:herraf_app/newhome.dart';

import 'package:herraf_app/notification.dart';
import 'package:herraf_app/profile3.dart';
import 'package:herraf_app/scan.dart';

class Home extends StatefulWidget {
  int index;
  Home(this.index);

  @override
  _HomeState createState() => _HomeState();
}

bool isPressed = false;

class _HomeState extends State<Home> {
  int currentTab = 4; // to keep track of active tab index
  int _currentIndex = 4;
  final List<Widget> screens = [
    Onboarding(),
    CatalogPage(),
    FriendPage(),
    NotificationPage1(),
  ]; // to store nested tabs
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = HomepageOne();

  @override
  void initState() {
    if (widget.index == 2) {
      setState(() {
        currentScreen = CatalogPage();
      });
    }

    super.initState();
  }

  // Properties & Variables needed
  int _selectedIndex = 0;
  void onTabbed(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<bool> _willPopCallback() async {
    if (_selectedIndex != 0) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home(0)));
    } else {
      SystemNavigator.pop();
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _willPopCallback,
      child: Scaffold(
        body: PageStorage(
          child: currentScreen,
          bucket: bucket,
        ),
        // floatingActionButton: Padding(
        //   padding: EdgeInsets.only(top: 23),
        //   child: SizedBox(
        //     height: 60,
        //     width: 70,
        //     child: FloatingActionButton(
        //         backgroundColor: currentScreen != HomepageOne()
        //             ? Color(0xff212121)
        //             : Color(0xffF1F6FF),
        //         elevation: 0,
        // onPressed: () => setState(() {
        //       currentTab = -1;
        //       currentScreen = HomepageOne();
        //       currentScreen != HomepageOne()
        //           ? Color(0xff212121)
        //           : Color(0xffF1F6FF);
        //     }),
        //         child: Container(child: Image.asset('assets/images/home.png'))),
        //   ),
        // ),
        floatingActionButton: InkWell(
          onTap: () => setState(() {
            currentTab = -1;
            currentScreen = HomepageOne();
            currentScreen != HomepageOne()
                ? Color(0xff212121)
                : Color(0xffF1F6FF);
          }),
          child: Container(
            margin: EdgeInsets.only(top: 30),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image.asset('assets/images/Bg.png'),
                SizedBox(
                    height: 70,
                    width: 60,
                    child: Image.asset('assets/images/home.png'))
              ],
            ),
          ),
        ),

        // floatingActionButton: FloatingActionButton(
        //   backgroundColor:
        //       currentTab == 4 ? Color(0xff212121) : Color(0xffF1F6FF),
        //   child: Icon(
        //     Icons.home,
        //     size: 35,
        //     color: Colors.white,
        //   ),
        //   // Container(
        //   //   height: 290,
        //   //   width: 40,
        //   //   child: Image.asset("assets/images/home.png"),
        //   // ),
        //   //ImageIcon(
        //   //   AssetImage('assets/images/home.png'),
        //   //   size: 90,
        //   // ),
        //   onPressed: () {},
        // ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          // shape: CircularNotchedRectangle(),
          notchMargin: 0,
          child: Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    MaterialButton(
                      minWidth: 30,
                      onPressed: () {
                        setState(() {
                          currentScreen =
                              Onboarding(); // if user taps on this dashboard tab will be active
                          currentTab = 0;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 50,
                            child: ImageIcon(
                              AssetImage('assets/images/bottom.png'),
                              color: currentTab == 0
                                  ? Color(0xff212121)
                                  : Color.fromARGB(255, 192, 191, 191),

                              // : Color(0xffF1F6FF),
                            ),
                          )

                          // Icon(
                          //   Icons.dashboard,
                          //   color: currentTab == 0 ? Colors.blue : Colors.grey,
                          // ),
                          // Text(
                          //   'Dashboard',
                          //   style: TextStyle(
                          //     color: currentTab == 0 ? Colors.blue : Colors.grey,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen =
                              CatalogPage(); // if user taps on this dashboard tab will be active
                          currentTab = 1;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: ImageIcon(
                              AssetImage('assets/images/bottom2.png'),
                              color: currentTab == 1
                                  ? Color(0xff212121)
                                  : Color.fromARGB(255, 192, 191, 191),

                              // : Color(0xffF1F6FF),
                            ),
                          )

                          // Icon(
                          //   Icons.chat,
                          //   color: currentTab == 1 ? Colors.blue : Colors.grey,
                          // ),
                          // Text(
                          //   'Chats',
                          //   style: TextStyle(
                          //     color: currentTab == 1 ? Colors.blue : Colors.grey,
                          //   ),
                          // ),
                        ],
                      ),
                    )
                  ],
                ),

                // Right Tab bar icons

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    MaterialButton(
                      minWidth: 50,
                      onPressed: () {
                        setState(() {
                          currentScreen =
                              Profile(); // if user taps on this dashboard tab will be active
                          currentTab = 2;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 50,
                            child: ImageIcon(
                              AssetImage('assets/images/bottom4.png'),
                              color: currentTab == 2
                                  ? Color(0xff212121)
                                  // : Color(0xD7D4D4)
                                  : Color.fromARGB(255, 192, 191, 191),
                            ),
                          )

                          // Icon(
                          //   Icons.dashboard,
                          //   color: currentTab == 2 ? Colors.blue : Colors.grey,
                          // ),
                          // Text(
                          //   'Profile',
                          //   style: TextStyle(
                          //     color: currentTab == 2 ? Colors.blue : Colors.grey,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen =
                              NotificationPage1(); // if user taps on this dashboard tab will be active
                          currentTab = 3;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 30,
                            child: ImageIcon(
                              AssetImage('assets/images/bottom3.png'),
                              color: currentTab == 3
                                  ? Color(0xff212121)
                                  : Color.fromARGB(255, 192, 191, 191),

                              // : Color(0xffF1F6FF),
                            ),
                          )

                          // Icon(
                          //   Icons.chat,
                          //   color: currentTab == 3 ? Colors.blue : Colors.grey,
                          // ),
                          // Text(
                          //   'Settings',
                          //   style: TextStyle(
                          //     color: currentTab == 3 ? Colors.blue : Colors.grey,
                          //   ),
                          // ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

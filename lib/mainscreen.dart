// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:herraf_app/catalog.dart';
// import 'package:herraf_app/dailystreakone.dart';
// import 'package:herraf_app/eitprofile.dart';

// import 'package:herraf_app/home_pag.dart';

// import 'package:herraf_app/invite.dart';
// import 'package:herraf_app/newprofile.dart';
// import 'package:herraf_app/notification.dart';

// class MainScreen extends StatefulWidget {
//   @override
//   _MainScreenState createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
//   int _selectedIndex = 1;

//   List<Widget> _widgetOptions = <Widget>[
//     //DailyStreakOne
//     CatalogPage(),
//     CatalogPage(),
//     HomepageOne(),
//     EditProfilePage(),
//     NotificationPage1(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xffffffff),
//       bottomNavigationBar: Container(
//           // padding: EdgeInsets.only(left right: 71),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.only(
//                 topRight: Radius.circular(45), topLeft: Radius.circular(45)),
//           ),
//           child: ClipRRect(
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(00.0),
//               topRight: Radius.circular(00.0),
//             ),
//             child: Container(
//                 child: BottomNavigationBar(
//               type: BottomNavigationBarType.fixed,
//               currentIndex: _selectedIndex,
//               selectedItemColor: Color(0xff0093ED),
//               selectedFontSize: 12,
//               unselectedItemColor: Color(0xFF333333),
//               unselectedFontSize: 12,
//               backgroundColor: Color(0xffF1F6FF),
//               items: [
//                 BottomNavigationBarItem(
//                   icon: ImageIcon(
//                     AssetImage('assets/images/unsplash_eggs.jpg'),
//                   ),
//                   label: 'Scan',
//                 ),
//                 BottomNavigationBarItem(
//                   icon: ImageIcon(
//                     AssetImage('assets/images/shopping-bag.png'),
//                   ),
//                   label: 'Buy cards',
//                 ),
//                 BottomNavigationBarItem(
//                   icon: ImageIcon(
//                     AssetImage('assets/images/home(1).png'),
//                   ),
//                   label: 'Home',
//                 ),
//                 BottomNavigationBarItem(
//                   icon: ImageIcon(
//                     AssetImage('assets/images/Frame.png'),
//                   ),
//                   label: 'Profile',
//                 ),
//                 BottomNavigationBarItem(
//                   icon: ImageIcon(
//                     AssetImage('assets/images/Vector(47).png'),
//                   ),
//                   label: 'Notifications',
//                 ),
//               ],
//               onTap: (index) {
//                 setState(() {
//                   _selectedIndex = index;
//                 });
//               },
//             )),
//           )),
//       body: _widgetOptions.elementAt(_selectedIndex),
//     );
//   }
// }

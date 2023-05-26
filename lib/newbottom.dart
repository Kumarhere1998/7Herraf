import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:herraf_app/scan.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;
  List<Widget> listWidgets = [
    Onboarding(),
    Onboarding(),
    Onboarding(),
    Onboarding(),
    Onboarding()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
      ),
      body: listWidgets[selectedIndex],
      bottomNavigationBar: ConvexAppBar.badge(
        {3: '21+'},
        items: [
          TabItem(icon: Icons.home, title: 'Home'),
        ],
        onTap: onItemTapped,
        activeColor: Colors.amber,
        backgroundColor: Colors.teal,
      ),
    );
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}

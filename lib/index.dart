import 'package:flutter/material.dart';

class AppbarChange extends StatefulWidget {
  const AppbarChange({Key? key}) : super(key: key);

  @override
  State<AppbarChange> createState() => _AppbarChangeState();
}

bool isPressed = false;

class _AppbarChangeState extends State<AppbarChange> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            IconButton(
                onPressed: () {},
                icon: isPressed ? Icon(Icons.add) : Icon(Icons.arrow_back)),
            IconButton(
                onPressed: () {
                  setState(() {
                    isPressed = false;
                  });
                },
                icon: Icon(Icons.delete))
          ]),
          IconButton(
              onPressed: () {
                setState(() {
                  isPressed = true;
                });
              },
              icon: Icon(Icons.add))
        ],
      )),
    );
  }
}

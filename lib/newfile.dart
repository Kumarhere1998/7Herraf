import 'package:flutter/material.dart';

void main() {
  runApp(HomeApp());
}

class HomeApp extends StatefulWidget {
  HomeApp({Key? key}) : super(key: key);

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            body: const FirstScreen()));
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
          height: 80,
          width: 80,
          child: FloatingActionButton(
              backgroundColor: Color(0xffCE8C8C),
              foregroundColor: Colors.white,
              splashColor: Colors.yellow,
              hoverColor: Colors.red,
              elevation: 10,
              heroTag: 'GFG Tag',
              // autofocus: true,
              // focusElevation: 5,
              // disabledElevation: 0,
              // higlightElevation: 50,
              // hoverElevation: 50,
              onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const NewScreen())),
              child: Container(
                height: 30,
                child: Image(
                  image: AssetImage('assets/images/herraf.png'),
                ),
              ))),
    );
  }
}

class NewScreen extends StatefulWidget {
  const NewScreen({Key? key}) : super(key: key);

  @override
  State<NewScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  TextEditingController textEditingController = TextEditingController();

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('New Screen'),
      ),
      body: Center(
        child: Hero(tag: 'GFG Tag', child: Icon(Icons.save)),
      ),
    );
  }
}

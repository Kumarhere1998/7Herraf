import 'dart:async';

// import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import 'package:herraf_app/api_servivce.dart';
import 'package:herraf_app/bottomNavBar.dart';
// import 'package:herraf_app/invite.dart';
import 'package:herraf_app/quitquiz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class Game extends StatefulWidget {
  Game(
    this.partnerdata,
    this.packid,
    this.playerCount,
  );
  Map? partnerdata = {};
  final int? packid;
  final int? playerCount;

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  String user_photo = "";
  List<dynamic> mycard = [];
  List<dynamic> partnerCard = [];
  bool isLoading1 = true;
  bool isTimeStart = false;

  List<dynamic> remainingMyCards = [];

  List<dynamic> totalCard = [];
  List<dynamic> playerCount = [];

  List<dynamic> deckCards = [];
  List<dynamic> penaltycard = [];
  List<dynamic> quickChat = [
    'I Knew it!',
    'Hi!',
    'Thanks!',
    'Well Played!',
    'No way!',
    'Best wishes'
  ];
  List<dynamic> emoji = [
    '😍',
    '😀',
    '🥰',
    '😃',
    '😇',
    '😄',
    '😁',
    '😆',
    '😅',
    '😂',
    '🤣',
    '😊',
    '🙂',
    '🙃',
    '😉',
    '😌',
  ];

  var index;
  late IO.Socket socket;
  final currentUserToolTipController = JustTheController();
  final partnerTooltipController = JustTheController();
  String chatMessage = "";
  String user_id = "";

  @override
  void initState() {
    // _gameSound();
    // _soundStop();
    initSocket();
    _getUserInfo();
    // if (widget.playerCount == 2) {

    //   _totalCardDistribution();
    // }
    _totalCardDistribution();

    getDeckCards(widget.partnerdata!["group_id"]);
    super.initState();
  }

  initSocket() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    socket = IO.io("http://165.22.215.103:4000", <String, dynamic>{
      'autoConnect': false,
      'transports': ['websocket'],
    });
    socket.connect();
    socket.onConnect((_) {
      print(
          'Connection established_${"herraf-${widget.partnerdata!["group_id"].toString()}"}');
    });
    socket.onDisconnect((_) => print('Connection Disconnection'));
    socket.onConnectError((err) => print(err));
    socket.onError((err) => print(err));

    socket.on("update-chat-${widget.partnerdata!["group_id"]}", (newMessage) {
      setState(() {
        if (prefs.get('user_id').toString() ==
            newMessage["user_id"].toString()) {
          currentUserToolTipController.showTooltip();
        } else {
          partnerTooltipController.showTooltip();
        }

        chatMessage = newMessage["message"];
      });
    });
  }

  _getUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      user_photo = prefs.getString("photo")!;
      user_id = prefs.getString("user_id")!;
    });
  }

  // _gameSound() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   if (prefs.getBool('music') == true) {
  //     AudioPlayer().play(AssetSource('sound/GameSound.mp3'));
  //   }
  // }

  // void _soundStop() {
  //   Navigator.pop(context, true);
  //   AudioPlayer().stop();
  // }

  _totalCardDistribution() {
    ApiService.card_distribution(widget.packid, widget.partnerdata!["group_id"])
        .then((value) {
      setState(() {
        totalCard = value['data'];
        if (value['status']) {
          _firstDeckcard();
        }
      });
    });
  }

  _firstDeckcard() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    ApiService.first_get_deck_card(
            prefs.get('user_id'), widget.partnerdata!["group_id"])
        .then((value) {
      for (var i = 0; i < value["data"].length; i++) {
        setState(() {
          deckCards.add({
            "question": value["data"][i]["question"],
            "card_image": value["data"][i]["card_image"],
            "acronyms": value["data"][i]["acronyms"],
            "card_number": value["data"][i]["card_number"],
            "card_id": value["data"][i]["flash_card_id"],
            "background": value["data"][i]["background"],
            "card_type": value["data"][i]["card_type"],
            "card_name": value["data"][i]["card_name"]
          });
        });
      }
      setState(() {
        if (value['status']) {
          _7CardDistribution();
        }
        isLoading1 = false;
        isTimeStart = true;
      });
    });
  }

  _7CardDistribution() {
    ApiService.sevenCardDistribution(widget.packid,
            widget.partnerdata!["group_id"], widget.partnerdata!["id"])
        .then((value) {
      for (var i = 0; i < value["data"]['randomCards'].length; i++) {
        setState(() {
          mycard.add({
            "question": value["data"]['randomCards'][i]["question"],
            "card_image": value["data"]['randomCards'][i]["card_image"],
            "acronyms": value["data"]['randomCards'][i]["acronyms"],
            "card_number": value["data"]['randomCards'][i]["card_number"],
            "card_id": value["data"]['randomCards'][i]["flash_card_id"],
            "background": value["data"]['randomCards'][i]["background"],
            "card_name": value["data"]['randomCards'][i]["card_name"],
            "card_type": value["data"]['randomCards'][i]["card_type"],
          });
        });
      }
      for (var i = 0; i < value["data"]['randomCPUCards'].length; i++) {
        setState(() {
          partnerCard.add({
            "question": value["data"]['randomCPUCards'][i]["question"],
            "card_image": value["data"]['randomCPUCards'][i]["card_image"],
            "acronyms": value["data"]['randomCPUCards'][i]["acronyms"],
            "card_number": value["data"]['randomCPUCards'][i]["card_number"],
            "card_id": value["data"]['randomCPUCards'][i]["flash_card_id"],
            "background": value["data"]['randomCPUCards'][i]["background"],
            "card_name": value["data"]['randomCPUCards'][i]["card_name"],
            "card_type": value["data"]['randomCPUCards'][i]["card_type"],
          });
        });
      }

      for (var i = 0; i < value["data"]['remainingCards'].length; i++) {
        setState(() {
          remainingMyCards.add({
            "question": value["data"]['remainingCards'][i]["question"],
            "card_image": value["data"]['remainingCards'][i]["card_image"],
            "acronyms": value["data"]['remainingCards'][i]["acronyms"],
            "card_number": value["data"]['remainingCards'][i]["card_number"],
            "card_id": value["data"]['remainingCards'][i]["flash_card_id"],
            "penlty_card_id": value["data"]["remainingCards"][i]["id"],
            "background": value["data"]['remainingCards'][i]["background"],
            "card_name": value["data"]['remainingCards'][i]["card_name"],
            "card_type": value["data"]['remainingCards'][i]["card_type"],
          });
        });
      }
    });
  }

  _spellOut() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Quitquiz(
            deckCards[(deckCards.length - 1)], widget.partnerdata!["group_id"]),
      ),
    );
  }

  _runHerraf() {
    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: Colors.black45,
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (BuildContext buildContext, Animation animation,
            Animation secondaryAnimation) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              children: [
                deckCards[deckCards.length - 1]["card_type"] == "P"
                    ? Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.7,
                            width: MediaQuery.of(context).size.width,
                            child: Center(
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.5,
                                width:
                                    MediaQuery.of(context).size.width * 0.750,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(
                                    '${URLS.IMAGE_URL}/${deckCards[(deckCards.length - 2)]['background']}',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                              top: 90,
                              right: 65,
                              child: Text(
                                '${deckCards[(deckCards.length - 2)]['card_number']}',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              )),
                          Positioned(
                            top: 90,
                            right: 100,
                            child: Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width * 0.600,
                              child: FittedBox(
                                child: AutoSizeText(
                                  "${deckCards[(deckCards.length - 2)]['question']}",
                                  style: TextStyle(
                                    color: Colors.black,
                                    // fontSize: 20
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 175,
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.25,
                              width: MediaQuery.of(context).size.width * 0.40,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                      '${URLS.IMAGE_URL}/${deckCards[(deckCards.length - 2)]['card_image']}'),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 90,
                            right: 55,
                            child: Container(
                              height: 40,
                              width: MediaQuery.of(context).size.width * 0.450,
                              child: FittedBox(
                                child: AutoSizeText(
                                  "${deckCards[(deckCards.length - 2)]['acronyms']}",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.7,
                            width: MediaQuery.of(context).size.width,
                            child: Center(
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.5,
                                width:
                                    MediaQuery.of(context).size.width * 0.750,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(
                                    '${URLS.IMAGE_URL}/${deckCards[(deckCards.length - 1)]['background']}',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                              top: 90,
                              right: 65,
                              child: Text(
                                '${deckCards[(deckCards.length - 1)]['card_number']}',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              )),
                          Positioned(
                            top: 90,
                            right: 100,
                            child: Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width * 0.600,
                              child: FittedBox(
                                child: AutoSizeText(
                                  "${deckCards[(deckCards.length - 1)]['question']}",
                                  style: TextStyle(
                                    color: Colors.black,
                                    // fontSize: 20
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 175,
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.25,
                              width: MediaQuery.of(context).size.width * 0.40,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                      '${URLS.IMAGE_URL}/${deckCards[(deckCards.length - 1)]['card_image']}'),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 90,
                            right: 55,
                            child: Container(
                              height: 40,
                              width: MediaQuery.of(context).size.width * 0.450,
                              child: FittedBox(
                                child: AutoSizeText(
                                  "${deckCards[(deckCards.length - 1)]['acronyms']}",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      deckCards[deckCards.length - 1]["card_type"] == "P"
                          ? InkWell(
                              onTap: () {
                                // _penalty(deckCards[0]["id"]);
                                _penalty(deckCards[deckCards.length - 1]
                                    ["card_name"]);
                                Navigator.of(context).pop();
                              },
                              child: Transform.rotate(
                                angle: 13.10,
                                child: Container(
                                  margin: EdgeInsets.only(top: 50, left: 20),
                                  height: 200,
                                  width: 130,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.white,
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 3,
                                      )),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(
                                          height: 100,
                                          width: 100,
                                          child: Image.network(
                                              '${URLS.IMAGE_URL}/${deckCards[(deckCards.length - 1)]['card_image']}'),
                                        ),
                                        Text(
                                          '${deckCards[(deckCards.length - 1)]['card_name']}',
                                          style: GoogleFonts.poppins(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : InkWell(
                              onTap: () {
                                // _penalty(deckCards[0]["id"]);
                                // Navigator.of(context).pop();
                              },
                              child: Transform.rotate(
                                angle: 13.10,
                                child: Container(
                                  margin: EdgeInsets.only(top: 50, left: 20),
                                  height: 200,
                                  width: 130,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.white,
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 3,
                                      )),
                                  child: Center(
                                    child: Text(
                                      'You can\'t take penalty now',
                                      style: GoogleFonts.poppins(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                      Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          Transform.rotate(
                            angle: -13.20,
                            child: InkWell(
                              onTap: (() {
                                _spellOut();
                              }),
                              child: Container(
                                margin: EdgeInsets.only(top: 60),
                                height: 200,
                                width: 120,
                                child: new Image.asset(
                                  "assets/images/spell.png",
                                  // fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 30,
                            child: Transform.rotate(
                              angle: 13.50,
                              child: Text(
                                "Spell out",
                                style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xfffffffff)),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }

  _leaveGame() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    ApiService.leaveGame(prefs.get('user_id'), widget.partnerdata!["group_id"])
        .then((value) {
    });
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => BottomNav(2)));
  }

  _winner() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    ApiService.gameWinner(prefs.get('user_id'), widget.partnerdata!["group_id"])
        .then((value) {
    });
  }

  _winnerConclude() async {
    ApiService.GameWinnerConculde(widget.partnerdata!["group_id"])
        .then((value) {
      // setState(() {
      //   gameWinner = value['message'];
      // });
    });
  }

  late Timer mytimer;

  @override
  Widget build(BuildContext context) {
    var Cards = mycard.length;
    var Cards1 = partnerCard.length;
    var remainingMyCard = remainingMyCards.length;

    return Scaffold(
      backgroundColor: Color(0xffDADADA),
      body: WillPopScope(
        onWillPop: () async {
          bool confirm = await showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          // height: 90,
                          child: Text(
                            'Leave the game?',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                color: Colors.black),
                          ),
                        ),
                        Container(
                          // color: Colors.amber,
                          // height: 110,
                          child: Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                              icon: Icon(
                                Icons.close,
                                size: 25,
                                color: Color(0xff212121),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                    content: Text(
                      'This will count as a loss and you will lose a life.',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Colors.grey),
                    ),
                    actions: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height:
                                  MediaQuery.of(context).size.height * 0.065,
                              width: MediaQuery.of(context).size.width * 0.300,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 1,
                                  ),
                                  // color: Colors.amber,
                                  borderRadius:
                                      BorderRadius.all((Radius.circular(10)))),
                              child: Text("Cancel",
                                  style: GoogleFonts.poppins(
                                      color: Color.fromARGB(255, 132, 131, 131),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500)),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              _leaveGame();
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height:
                                  MediaQuery.of(context).size.height * 0.065,
                              width: MediaQuery.of(context).size.width * 0.300,
                              decoration: const BoxDecoration(
                                  color: Color(0xffCE8C8C),
                                  borderRadius:
                                      BorderRadius.all((Radius.circular(10)))),
                              child: Text("Quit Game",
                                  style: GoogleFonts.poppins(
                                      color: const Color(0xffFFFFFF),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500)),
                            ),
                          ),
                        ],
                      )
                    ],
                  ));
          return confirm;
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SafeArea(
              child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      TextButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                      title: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            child: Text(
                                              'Leave the game?',
                                              style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 20,
                                                  color: Colors.black),
                                            ),
                                          ),
                                          Container(
                                            child: Align(
                                              alignment: Alignment.topRight,
                                              child: IconButton(
                                                icon: Icon(
                                                  Icons.close,
                                                  size: 25,
                                                  color: Color(0xff212121),
                                                ),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      content: Text(
                                        'This will count as a loss and you will lose a life.',
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            color: Colors.grey),
                                      ),
                                      actions: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.065,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.300,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: Colors.grey,
                                                      width: 1,
                                                    ),
                                                    // color: Colors.amber,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            (Radius.circular(
                                                                10)))),
                                                child: Text("Cancel",
                                                    style: GoogleFonts.poppins(
                                                        color: Color.fromARGB(
                                                            255, 132, 131, 131),
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500)),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                _leaveGame();
                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.065,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.300,
                                                decoration: const BoxDecoration(
                                                    color: Color(0xffCE8C8C),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            (Radius.circular(
                                                                10)))),
                                                child: Text("Quit Game",
                                                    style: GoogleFonts.poppins(
                                                        color: const Color(
                                                            0xffFFFFFF),
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500)),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ));
                          },
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(right: 15),
                                child: Icon(Icons.arrow_back,
                                    color: const Color(0xff212121)),
                              ),
                              Text(
                                "Leave",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: const Color(0xff212121)),
                              ),
                            ],
                          )),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: 0),
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    child: Image.asset("assets/images/Shape.png"),
                  ),
                  Row(
                    children: [
                      Container(
                          padding: const EdgeInsets.only(right: 10),
                          height: 37,
                          width: 37,
                          alignment: Alignment.center,
                          child: Image.asset("assets/images/sand clock.png")),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.watch_later_outlined,
                              size: 25,
                            ),
                            TweenAnimationBuilder<Duration>(
                                duration: const Duration(minutes: 3),
                                tween: Tween(
                                    begin: const Duration(minutes: 3),
                                    end: Duration.zero),
                                onEnd: () {
                                },
                                builder: (BuildContext context, Duration value,
                                    Widget? child) {
                                  final minutes = value.inMinutes;
                                  final seconds = value.inSeconds % 60;
                                  return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      child: Text('$minutes:$seconds',
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              color: Color(0xff00253A),
                                              fontWeight: FontWeight.w600,
                                              fontSize: 18)));
                                }),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 0, top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 90,
                      width: 60,
                    ),
                    JustTheTooltip(
                        showDuration: Duration(seconds: 3),
                        backgroundColor: Colors.black,
                        controller: partnerTooltipController,
                        preferredDirection: AxisDirection.up,
                        child: Material(
                            color: Colors.grey.shade800,
                            shape: const CircleBorder(),
                            elevation: 4.0,
                            animationDuration: Duration(seconds: 1),
                            child: Stack(
                              children: [
                                Stack(
                                  alignment: Alignment.bottomRight,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 0),
                                      child: Stack(
                                        alignment: Alignment.topRight,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 10, bottom: 15),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10),
                                              child: SizedBox(
                                                  height: 75,
                                                  width: 70,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          image: NetworkImage(
                                                              widget.partnerdata![
                                                                  "image"]),
                                                          fit: BoxFit.cover),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                  )),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 30, bottom: 10),
                                      child: Transform.rotate(
                                        angle: (-18.3),
                                        child: Container(
                                          height: 30,
                                          width: 19,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/HerrafCard.png'),
                                                fit: BoxFit.cover),
                                          ),
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 4, bottom: 7),
                                      child: Transform.rotate(
                                        angle: (-12.4),
                                        child: Container(
                                          height: 33,
                                          width: 22,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/HerrafCard.png'),
                                                fit: BoxFit.cover),
                                          ),
                                          alignment: Alignment.center,
                                          transformAlignment:
                                              Alignment.topRight,
                                          child: Text(
                                            'X$Cards1',
                                            style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontSize: 10,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Positioned(
                                  bottom: 20,
                                  left: 15,
                                  child: SizedBox(
                                    height: 35,
                                    width: 35,
                                    child: ClipPolygon(
                                      sides: 6,
                                      borderRadius: 5.0,
                                      rotate: 60.0,
                                      boxShadows: [
                                        PolygonBoxShadow(
                                            color: const Color(0xff773030),
                                            elevation: 1.0),
                                        PolygonBoxShadow(
                                          color: const Color(0xff773030),
                                          elevation: 1,
                                        )
                                      ],
                                      child: Container(
                                          color: const Color(0xff1F1C1C),
                                          alignment: Alignment.center,
                                          child: Text("0",
                                              style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w600,
                                                  color:
                                                      const Color(0xffFFFFFF),
                                                  fontSize: 12),
                                              textAlign: TextAlign.center)),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 120),
                                ),
                              ],
                            )),
                        content: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            chatMessage.toString(),
                            style: TextStyle(color: Colors.white, fontSize: 22),
                          ),
                        )),
                    InkWell(
                      onTap: () {
                        _takeCardFromDeck();
                      },
                      child: Stack(
                        children: [
                          Container(
                            height: 90,
                            width: 60,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/HerrafCard.png'),
                                  fit: BoxFit.cover),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              "X$remainingMyCard",
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  padding: const EdgeInsets.only(
                    top: 10,
                  ),
                  margin: new EdgeInsets.symmetric(horizontal: 20.0),
                  // width: 150,
                  height: 280,
                  child: Stack(fit: StackFit.expand, children: <Widget>[
                    Image(
                      image: AssetImage('assets/images/backgroundlogo.png'),
                    ),
                    isLoading1
                        ? Positioned(
                            top: 100,
                            left: 150,
                            child: CircularProgressIndicator(
                              color: Color(0xffCE8C8C),
                            ),
                          )
                        : Positioned(
                            top: 50,
                            left: 110,
                            child: Stack(
                              children: <Widget>[
                                for (var index = 0;
                                    index < deckCards.length;
                                    index++) ...[
                                  Transform.rotate(
                                    //angle: (double.parse("0.${index + 1}")),
                                    angle: 0,
                                    child: deckCards[index]["card_type"] == "P"
                                        ? Stack(
                                            clipBehavior: Clip.none,
                                            alignment: Alignment.bottomCenter,
                                            children: [
                                              Container(
                                                  color: Colors.white,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.201,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.300,
                                                  child: Image.network(
                                                    '${URLS.IMAGE_URL}/${deckCards[index]['background']}',
                                                    fit: BoxFit.fill,
                                                  )),
                                              Positioned(
                                                top: 40,
                                                child: Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.10,
                                                  width: 50,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      fit: BoxFit.fill,
                                                      image: NetworkImage(
                                                          "${URLS.IMAGE_URL}/${deckCards[index]['card_image']}"),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                child: Container(
                                                  margin: EdgeInsets.only(
                                                      left: 10, top: 20),
                                                  padding:
                                                      EdgeInsets.only(top: 15),
                                                  width: 50,
                                                  height: 40,
                                                  child: FittedBox(
                                                    child: AutoSizeText(
                                                      "${deckCards[index]['card_name']}",
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        : Stack(
                                            clipBehavior: Clip.none,
                                            alignment: Alignment.bottomCenter,
                                            children: [
                                              Container(
                                                color: Colors.white,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.201,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.300,
                                                child: Image.network(
                                                  "${URLS.IMAGE_URL}/${deckCards[index]['background']}",
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              Positioned(
                                                  top: 0,
                                                  right: 100,
                                                  child: Text(
                                                    '${deckCards[index]['card_number']}',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 20),
                                                  )),
                                              Positioned(
                                                top: 0,
                                                left: 25,
                                                child: Container(
                                                  padding:
                                                      EdgeInsets.only(left: 3),
                                                  width: 90,
                                                  height: 30,
                                                  child: FittedBox(
                                                    child: AutoSizeText(
                                                      "${deckCards[index]['question']}",
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                top: 45,
                                                child: Container(
                                                  margin:
                                                      EdgeInsets.only(top: 10),
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.09,
                                                  width: 50,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      image: NetworkImage(
                                                          "${URLS.IMAGE_URL}/${deckCards[index]['card_image']}"),
                                                    ),
                                                  ),
                                                  // child: CachedNetworkImage(
                                                  //   progressIndicatorBuilder:
                                                  //       (context, url, progress) =>
                                                  //           Center(
                                                  //     child:
                                                  //         CircularProgressIndicator(
                                                  //       value: progress.progress,
                                                  //     ),
                                                  //   ),
                                                  //   imageUrl:
                                                  //       '${URLS.IMAGE_URL}/${deckCards[index]['card_image']}',
                                                  // ),
                                                ),
                                              ),
                                              Positioned(
                                                bottom: 0,
                                                left: 35,
                                                child: Container(
                                                  padding: EdgeInsets.only(
                                                    top: 13,
                                                  ),
                                                  width: 70,
                                                  height: 40,
                                                  child: FittedBox(
                                                    child: AutoSizeText(
                                                      "${deckCards[index]['acronyms']}",
                                                      style: TextStyle(
                                                          // fontWeight: FontWeight.bold,
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                  ),
                                ]
                              ],
                            ),
                          )
                  ])),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35.0),
                          ),
                          backgroundColor: Color.fromARGB(255, 240, 238, 238),
                          context: context,
                          builder: (context) {
                            return Container(
                                margin: EdgeInsets.only(
                                    top: 20, left: 20, right: 20),
                                height: MediaQuery.of(context).size.height * .5,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Emojies',
                                          style: GoogleFonts.poppins(
                                              color: Color(0xff212121),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            icon: Icon(
                                              Icons.arrow_drop_down_sharp,
                                              size: 20,
                                            ))
                                      ],
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      height: 70,
                                      child: GridView.builder(
                                          scrollDirection: Axis.horizontal,
                                          shrinkWrap: true,
                                          gridDelegate:
                                              SliverGridDelegateWithMaxCrossAxisExtent(
                                                  maxCrossAxisExtent: 200,
                                                  mainAxisExtent: 70,
                                                  mainAxisSpacing: 15),
                                          itemCount: emoji.length,
                                          itemBuilder:
                                              (BuildContext ctx, index) {
                                            return InkWell(
                                              onTap: () {
                                                sendMessage(
                                                    emoji.elementAt(index),
                                                    user_id);
                                              },
                                              child: Text(
                                                '${emoji.elementAt(index)}',
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 50,
                                                    color: Color(0xff000000)),
                                              ),
                                            );
                                          }),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text('Quick phrases'),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    GridView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 3,
                                                mainAxisExtent: 40,
                                                mainAxisSpacing: 15),
                                        itemCount: quickChat.length,
                                        itemBuilder: (BuildContext ctx, index) {
                                          return Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            margin: const EdgeInsets.only(
                                              left: 10,
                                            ),
                                            child: Center(
                                              child: InkWell(
                                                onTap: () {
                                                  sendMessage(
                                                      quickChat
                                                          .elementAt(index),
                                                      user_id);
                                                },
                                                child: Text(
                                                  '${quickChat.elementAt(index)}',
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 12,
                                                      color: Color(0xff000000)),
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                  ],
                                ));
                          });
                    },
                    child: Container(
                      padding: const EdgeInsets.only(
                        top: 55,
                      ),
                      height: 120,
                      child: Image.asset("assets/images/chat.png"),
                    ),
                  ),
                  JustTheTooltip(
                    showDuration: Duration(seconds: 3),
                    backgroundColor: Colors.black,
                    controller: currentUserToolTipController,
                    preferredDirection: AxisDirection.up,
                    child: Material(
                        color: Colors.grey.shade800,
                        shape: const CircleBorder(),
                        elevation: 4.0,
                        animationDuration: Duration(seconds: 1),
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 0),
                                  child: Stack(
                                    alignment: Alignment.topRight,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 10, bottom: 15),
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10),
                                          child: SizedBox(
                                            height: 75,
                                            width: 70,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        user_photo),
                                                    fit: BoxFit.cover),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 30, bottom: 10),
                                  child: Transform.rotate(
                                    angle: (-18.3),
                                    child: Container(
                                      height: 33,
                                      width: 22,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/HerrafCard.png'),
                                            fit: BoxFit.cover),
                                      ),
                                      alignment: Alignment.center,
                                      transformAlignment: Alignment.topRight,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 4, bottom: 7),
                                  child: Transform.rotate(
                                    angle: (-12.4),
                                    child: Container(
                                      height: 33,
                                      width: 22,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/HerrafCard.png'),
                                            fit: BoxFit.cover),
                                      ),
                                      alignment: Alignment.center,
                                      transformAlignment: Alignment.topRight,
                                      child: Text(
                                        "X$Cards",
                                        style: GoogleFonts.poppins(
                                            color: Colors.black,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 17),
                              child: SizedBox(
                                height: 35,
                                width: 35,
                                child: ClipPolygon(
                                  sides: 6,
                                  borderRadius: 5.0,

                                  // Defaults to 0.0 degrees
                                  rotate: 60.0,
                                  // Defaults to 0.0 degrees
                                  boxShadows: [
                                    PolygonBoxShadow(
                                        color: const Color(0xff773030),
                                        elevation: 1.0),
                                    PolygonBoxShadow(
                                      color: const Color(0xff773030),
                                      elevation: 1,
                                    )
                                  ],
                                  child: Container(
                                      color: const Color(0xff1F1C1C),
                                      alignment: Alignment.center,
                                      child: Text("0",
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w600,
                                              color: const Color(0xffFFFFFF),
                                              fontSize: 12),
                                          textAlign: TextAlign.center)),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 0,
                              ),
                            ),
                          ],
                        )),
                    content: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        chatMessage.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      _runHerraf();
                    },
                    child: Container(
                      padding: const EdgeInsets.only(
                        top: 55,
                      ),
                      height: 130,
                      child: Image.asset("assets/images/herraf button.png"),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 15,
                ),
                height: MediaQuery.of(context).size.height * 0.205,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: <Widget>[
                    for (var index = 0; index < mycard.length; index++) ...[
                      new Positioned(
                        left: index == 0
                            ? 10
                            : index == 1
                                ? 20
                                : double.parse((15.0 * index).toString()),
                        child: Transform.rotate(
                          angle: (double.parse("0.${index + 1}")),
                          child: InkWell(
                              onTap: () {
                                _pushMyCard(index);
                              },
                              child: mycard[index]["card_type"].toString() ==
                                      "P"
                                  ? Stack(
                                      clipBehavior: Clip.none,
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        Container(
                                            color: Colors.white,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.201,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.300,
                                            child: Image.network(
                                              '${URLS.IMAGE_URL}/${mycard[index]['background']}',
                                              fit: BoxFit.fill,
                                            )),
                                        Positioned(
                                          top: 45,
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.10,
                                            width: 50,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                fit: BoxFit.fill,
                                                image: NetworkImage(
                                                    "${URLS.IMAGE_URL}/${mycard[index]['card_image']}"),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                left: 10, top: 30),
                                            padding: EdgeInsets.only(top: 20),
                                            width: 50,
                                            height: 40,
                                            child: FittedBox(
                                              child: AutoSizeText(
                                                "${mycard[index]['card_name']}",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  : Stack(
                                      clipBehavior: Clip.none,
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        Container(
                                            color: Colors.white,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.201,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.300,
                                            child: Image.network(
                                              '${URLS.IMAGE_URL}/${mycard[index]['background']}',
                                              fit: BoxFit.fill,
                                            )),
                                        Positioned(
                                            top: 0,
                                            left: 100,
                                            child: Text(
                                              '${mycard[index]['card_number']}',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                  color: Colors.black),
                                            )),
                                        Positioned(
                                          top: 5,
                                          child: Container(
                                            margin: EdgeInsets.only(right: 10),
                                            padding: EdgeInsets.only(right: 5),
                                            width: 100,
                                            height: 20,
                                            child: FittedBox(
                                              child: AutoSizeText(
                                                "${mycard[index]['question']}",
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: 45,
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.10,
                                            width: 50,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                fit: BoxFit.fill,
                                                image: NetworkImage(
                                                    "${URLS.IMAGE_URL}/${mycard[index]['card_image']}"),
                                                // image: AssetImage(
                                                //     'assets/images/kidney.png')
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                left: 10, top: 30),
                                            padding: EdgeInsets.only(top: 20),
                                            width: 50,
                                            height: 40,
                                            child: FittedBox(
                                              child: AutoSizeText(
                                                "${mycard[index]['acronyms']}",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }

  sendMessage(message, user_id) async {
    if (message.isEmpty) return;
    Map messageMap = {
      'message': message.toString(),
      'group_id': widget.partnerdata!["group_id"].toString(),
      'user_id': user_id.toString()
    };
    await ApiService.sendChat(messageMap);

    Navigator.pop(context);
  }

  _pushMyCard(index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    ApiService.deck_area(
      prefs.getString('user_id'),
      widget.partnerdata!["id"],
      // mycard[index]["card_id"],
      mycard[index]['card_type'] == 'P'
          ? mycard[index]["penlty_card_id"]
          : mycard[index]["card_id"],
      widget.partnerdata!["group_id"],
      widget.packid,
      mycard[index]["card_type"],
    ).then((value) {
      getDeckCards(widget.partnerdata!["group_id"]);
    });
    setState(() {
      mycard.removeAt(index);
      if (mycard.length == 0) {
        _winnerConclude();
        _winner();
      }
    });
  }

  _takeCardFromDeck() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    ApiService.takeCardFromDeck(
      prefs.getString('user_id'),
      widget.partnerdata!["group_id"],
    ).then((value) {

      setState(() {
        mycard.add({
          "question": value["data"][0]["question"],
          "card_image": value["data"][0]["card_image"],
          "acronyms": value["data"][0]["acronyms"],
          "card_number": value["data"][0]["card_number"],
          "card_id": value["data"][0]["flash_card_id"],
          "background": value["data"][0]["background"],
          "card_name": value["data"][0]["card_name"],
          "card_type": value["data"][0]["card_type"]
        });
      });
      remainingMyCards.removeLast();
    });
  }

  getDeckCards(group_id) {
    mytimer = Timer.periodic(Duration(seconds: 2), (timer) {
      ApiService.get_deck_card(group_id).then((value) {
        for (var i = 0; i < value["data"].length; i++) {
          setState(() {
            deckCards.add({
              "question": value["data"][i]["question"],
              "card_image": value["data"][i]["card_image"],
              "acronyms": value["data"][i]["acronyms"],
              "card_number": value["data"][i]["card_number"],
              "card_id": value["data"][i]["flash_card_id"],
              "penlty_card_id": value["data"][0]["id"],
              "background": value["data"][i]["background"],
              "card_type": value["data"][i]["card_type"],
              "card_name": value["data"][i]["card_name"],
              "card_color": value["data"][i]["card_color"]
            });
          });
        }
      });
    });
  }

  _penalty(limit) async {
    ApiService.penalty(widget.partnerdata!["group_id"], limit).then((value) {
      for (var i = 0; i < value["data"].length; i++) {
        setState(() {
          mycard.add({
            "question": value["data"][i]["question"],
            "card_image": value["data"][i]["card_image"],
            "acronyms": value["data"][i]["acronyms"],
            "card_number": value["data"][i]["card_number"],
            "card_id": value["data"][i]["flash_card_id"],
            "card_name": value["data"][i]["card_name"],
            "card_type": value["data"][i]["card_type"],
            "background": value["data"][i]["background"]
          });
        });
      }
    });
  }
}

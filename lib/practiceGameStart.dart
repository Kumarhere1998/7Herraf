import 'dart:async';

// import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import 'package:herraf_app/api_servivce.dart';
import 'package:herraf_app/bottomNavBar.dart';
import 'package:herraf_app/quizForPratice.dart';
import 'package:herraf_app/practiceWon.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class PracticeGame extends StatefulWidget {
  final int groupId;
  PracticeGame({required this.groupId});

  @override
  State<PracticeGame> createState() => _PracticeGameState();
}

class _PracticeGameState extends State<PracticeGame>
    with TickerProviderStateMixin {
  double containerPosition = 0.0;

  bool isCPU = false;
  bool isCPUSpelling = false;
  bool isobserving = false;
  bool isLoading = true;
  bool isLoading1 = true;
  bool userTakenPenlty = false;
  bool loopCompleted = false;
  bool isTimeStart = false;
  int? REMAININGCARDS = 0;
  bool turn = false;
  bool herrafBotton = false;
  String gameWinner = '';

  late IO.Socket socket;
  String user_photo = "";
  String humanUserId = "";
  String chatMessage = "";
  String cardColor = "";
  String cardColorCPU = "";
  List<dynamic> totalCard = [];
  List<dynamic> mycard = [];
  List<dynamic> cpucard = [];
  List<dynamic> remainingcards = [];
  List<dynamic> cardOptions = [];
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
  List<dynamic> addOneCard = [];
  var index;
  var optionTime;

  final cpuTooltipController = JustTheController();
  final humanTooltipController = JustTheController();

  late int originalLength = deckCards.length;

  late AnimationController controller;
  late Animation<Offset> offset;

  late AnimationController myCardController;
  late Animation<Offset> myCardOffset;

  late AnimationController cpuCardController;
  late Animation<Offset> cpuOffset;

  double offSetEndXPoint = -4.0;
  double offSetEndYPoint = 6.0;

  bool showRemainingHiddenCard = false;
  bool showMyHiddenCard = false;
  bool showCPUHiddenCard = false;

  @override
  void initState() {
    initSocket();
    _totalCardDistribution();
    // _gameSound();
    // _soundStop();
    _getUserInfo();
    getDeckCards(widget.groupId);
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    offset = Tween<Offset>(begin: Offset(0.0, 0.0), end: Offset(-4.0, 6.0))
        .animate(controller);
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reset();
        setState(() {
          showRemainingHiddenCard = false;
        });
      }
    });

    myCardController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    myCardOffset =
        Tween<Offset>(begin: Offset(0.0, 0.0), end: Offset(0.0, -2.4))
            .animate(myCardController);
    myCardController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        myCardController.reset();
        setState(() {
          showMyHiddenCard = false;
        });
      }
    });

    cpuCardController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    cpuOffset = Tween<Offset>(begin: Offset(0.0, 0.0), end: Offset(0.0, 2.0))
        .animate(cpuCardController);
    cpuCardController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        cpuCardController.reset();
        setState(() {
          showCPUHiddenCard = false;
        });
      }
    });
  }

  initSocket() {
    socket = IO.io("http://165.22.215.103:4000", <String, dynamic>{
      'autoConnect': false,
      'transports': ['websocket'],
    });
    socket.connect();
    socket.onConnect((_) {
      print('Connection established_${"herraf-${widget.groupId.toString()}"}');
    });
    socket.onDisconnect((_) => print('Connection Disconnection'));
    socket.onConnectError((err) => print(err));
    socket.onError((err) => print(err));

    socket.on("update-chat-${widget.groupId}", (newMessage) {
      setState(() {
        humanTooltipController.showTooltip();
        chatMessage = newMessage["message"];
      });

      print("MYM_${newMessage["message"]}");
    });
  }

  _cardColor(imageColor) {
    setState(() {
      cardColor = imageColor;
      print('Image==>$cardColor');
    });
  }

  _cardColorCPU(imageColor) {
    setState(() {
      cardColorCPU = imageColor;
      print('Image==>$cardColorCPU');
    });
  }
  // _gameSound() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   print("MUSIC==> ${prefs.getBool('music')!}");
  //   if (prefs.getBool('music') == true) {
  //     AudioPlayer().play(AssetSource('sound/GameSound.mp3'));
  //   }
  // }

  // void _soundStop() {
  //   Navigator.pop(context, true);
  //   AudioPlayer().stop();
  // }

  _getUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      user_photo = prefs.getString("photo")!;
      humanUserId = prefs.getString("user_id")!;
      // print(widget.partnerdata!["id"]);
    });
  }

  _winner() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    ApiService.practiceGameWinner(prefs.get('user_id'), widget.groupId)
        .then((value) {
      print('GAMEWINNER==> $value');
      // setState(() {
      gameWinner = value['message'];
      if (value['status']) {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //       builder: (BuildContext context) => WonPage(gameWinner)),
        // );

        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => WonPage(gameWinner)),
            (Route<dynamic> route) => false);
      }
      // });
    });
  }

  @override
  void dispose() {
    socket.disconnect();
    socket.dispose();
    controller.dispose();
    myCardController.dispose();
    super.dispose();
  }

  _quizOptions(Card_id) {
    print('CardID==>$Card_id');
    ApiService.quiz_options(Card_id).then((value) {
      cardOptions = value['data'];
      print('OptionLength==> ${cardOptions.length}');
    });
  }

  _winnerConclude() async {
    ApiService.practiceGameWinnerConculde(widget.groupId).then((value) {
      print('GAMEWINNERCONCLUDE==> $value');
      if (value['status']) {
        _winner();
      }
    });
  }

  _totalCardDistribution() {
    ApiService.practice_total_card_distribution(widget.groupId).then((value) {
      // print('TOTALCARDS==>$value');
      setState(() {
        totalCard = value['data'];
        if (value['status']) {
          // print('totalCard==>${totalCard.length}');
          _firstDeckcard();
        }
      });
    });
  }

  _7cardDistribution() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    ApiService.practice_card_distribution(prefs.get('user_id'), widget.groupId)
        .then((value) {
      for (var i = 0; i < value["data"]['randomCards'].length; i++) {
        setState(() {
          mycard.add({
            "question": value["data"]['randomCards'][i]["question"],
            "card_image": value["data"]['randomCards'][i]["card_image"],
            "acronyms": value["data"]['randomCards'][i]["acronyms"],
            "card_number": value["data"]['randomCards'][i]["card_number"],
            "card_id": value["data"]['randomCards'][i]["flash_card_id"],
            "penlty_card_id": value["data"]["randomCards"][i]["id"],
            "background": value["data"]['randomCards'][i]["background"],
            "card_name": value["data"]['randomCards'][i]["card_name"],
            "card_type": value["data"]['randomCards'][i]["card_type"],
          });
        });
      }
      for (var i = 0; i < value["data"]['randomCPUCards'].length; i++) {
        setState(() {
          cpucard.add({
            "question": value["data"]['randomCPUCards'][i]["question"],
            "card_image": value["data"]['randomCPUCards'][i]["card_image"],
            "acronyms": value["data"]['randomCPUCards'][i]["acronyms"],
            "card_number": value["data"]['randomCPUCards'][i]["card_number"],
            "card_id": value["data"]['randomCPUCards'][i]["flash_card_id"],
            "penlty_card_id": value["data"]["randomCPUCards"][i]["id"],
            "background": value["data"]['randomCPUCards'][i]["background"],
            "card_name": value["data"]['randomCPUCards'][i]["card_name"],
            "card_type": value["data"]['randomCPUCards'][i]["card_type"],
          });
        });
      }
      for (var i = 0; i < value["data"]['remainingCards'].length; i++) {
        setState(() {
          remainingcards.add({
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
          remainingcards.shuffle();
        });
      }
      setState(() {
        isLoading = false;
        isTimeStart = true;
        REMAININGCARDS = remainingcards.length - 1;
      });
    });
  }

  _firstDeckcard() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    ApiService.practice_first_get_deck_card(
            prefs.get('user_id'), widget.groupId)
        .then((value) {
      print('FIRSTDECKCARD==> ${deckCards.length}');
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
            "card_name": value["data"][i]["card_name"],
            "card_color": value["data"][i]["card_color"]
          });
          print(deckCards.last['card_color']);
        });
      }
      setState(() {
        if (value['status']) {
          _7cardDistribution();
        }
        isLoading1 = false;
      });
    });
  }

  _runCPUFirst() async {
    Future.delayed(const Duration(seconds: 3), () {
      _pushCPUCard((cpucard.length - 1));
    });
  }

  _spellOut() async {
    final result = await Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => QuitquizPratice(
          deckCards[(deckCards.length - 1)],
          widget.groupId,
          isCPU,
          isCPUSpelling,
        ),
      ),
    );
    print(result['message']);
    if (result['message'] == 'Wrong Spelling') {
      _takeCardFromDeck();
      _CpuTurn();

      setState(() {
        turn = false;
        turn = true;
      });
    }
    if (result) {
      print('After_RESULT==>$result');

      _runCPUFirst();
      if (isCPU == true) {
        setState(() {
          isCPU = false;
        });
      } else {
        setState(() {
          isCPU = true;
        });
        // print('After_RESULT==>$result');
      }
    }
    // if (result) {
    //   if (isCPUSpelling == true) {
    //     setState(() {
    //       isCPUSpelling = false;
    //     });
    //   } else {
    //     setState(() {
    //       isCPUSpelling = true;
    //     });
    //     print('After_isCPUSpelling==>$isCPUSpelling');
    //   }
    // }
  }

  _spellOut2() async {
    final result = await Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => QuitquizPratice(
          deckCards[(deckCards.length - 2)],
          widget.groupId,
          isCPU,
          isCPUSpelling,
        ),
      ),
    );

    if (result) {
      print("i am back ");
      setState(() {
        isCPU = false;
        // _runCPUFirst();
      });
    } else {
      setState(() {
        isCPU = true;
      });
      _runCPUFirst();
    }
  }

  _runHerraf() {
    print('i\'m here==> $isCPU');
    if (mounted && isCPU) {
      Future.delayed(const Duration(seconds: 3), () {
        deckCards[deckCards.length - 1]["card_type"] == "O"
            ? _spellOut()
            // : _spellOut2();
            : _cPUpenalty(deckCards[deckCards.length - 1]["card_name"]);
      });
    }

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
                                print('Sorry');
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
                                deckCards[deckCards.length - 1]["card_type"] ==
                                        "O"
                                    ? _spellOut()
                                    : _spellOut2();
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

  _cpuRunHerraf() {
    if (mounted && isCPU) {
      Future.delayed(const Duration(seconds: 2), () {
        deckCards[deckCards.length - 1]["card_type"] == "O"
            // ? _selectingOptions()c
            ? _spellOut()
            : _cPUpenalty(deckCards[deckCards.length - 1]["card_name"]);
      });
    }
  }

  _leaveGame() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    ApiService.leaveGame(prefs.get('user_id'), widget.groupId).then((value) {
      print(value);
    });

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => BottomNav(2)));
  }

  _chat(user_id) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35.0),
        ),
        backgroundColor: Color.fromARGB(255, 240, 238, 238),
        context: context,
        builder: (context) {
          return Container(
              margin: EdgeInsets.only(top: 20, left: 20, right: 20),
              height: MediaQuery.of(context).size.height * .5,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            mainAxisExtent: 70,
                            mainAxisSpacing: 15),
                        itemCount: emoji.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return InkWell(
                            onTap: () {
                              sendMessage(emoji.elementAt(index), user_id);
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
                      physics: const NeverScrollableScrollPhysics(),
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
                              borderRadius: BorderRadius.circular(10)),
                          margin: const EdgeInsets.only(
                            left: 10,
                          ),
                          child: Center(
                            child: InkWell(
                              onTap: () {
                                sendMessage(
                                    quickChat.elementAt(index), user_id);
                              },
                              child: Text(
                                '${quickChat.elementAt(index)}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500,
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
  }

  _fluttertoast() {
    Fluttertoast.showToast(
        msg: "Please wait opponent is spelling now",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  _turntoast() {
    // Fluttertoast.showToast(
    //     msg: turn ? "Your Turn" : 'CPU Turn',
    //     toastLength: Toast.LENGTH_SHORT,
    //     gravity: ToastGravity.CENTER,
    //     timeInSecForIosWeb: 2,
    //     backgroundColor: Colors.black,
    //     textColor: Colors.white,
    //     fontSize: 16.0);
  }

  sendMessage(message, user_id) async {
    if (message.isEmpty) return;
    Map messageMap = {
      'message': message.toString(),
      'group_id': widget.groupId.toString(),
      'user_id': user_id.toString()
    };
    //print(messageMap);
    await ApiService.sendChat(messageMap);

    Navigator.pop(context);
  }

  _tapAndHold(index) {
    showGeneralDialog(
        context: context,
        barrierDismissible: false,
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: Colors.black45,
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (BuildContext buildContext, Animation animation,
            Animation secondaryAnimation) {
          return Scaffold(
            backgroundColor: Color.fromARGB(0, 28, 28, 28),
            body: Center(
                child: mycard[index]["card_type"] == "P"
                    ? Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.5,
                            width: MediaQuery.of(context).size.width * 0.750,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                '${URLS.IMAGE_URL}/${mycard[index]['background']}',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Positioned(
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.25,
                              width: MediaQuery.of(context).size.width * 0.40,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                      '${URLS.IMAGE_URL}/${mycard[index]['card_image']}'),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                              bottom: 10,
                              right: 130,
                              child: Text(
                                '${mycard[index]['card_name']}',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              )),
                        ],
                      )
                    : Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.5,
                            width: MediaQuery.of(context).size.width * 0.750,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                '${URLS.IMAGE_URL}/${mycard[index]['background']}',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Positioned(
                              top: 10,
                              right: 10,
                              child: Text(
                                '${mycard[index]['card_number']}',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              )),
                          Positioned(
                            top: 5,
                            left: 10,
                            child: Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width * 0.600,
                              child: FittedBox(
                                child: AutoSizeText(
                                  "${mycard[index]['question']}",
                                  style: TextStyle(
                                    color: Colors.black,
                                    // fontSize: 20
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.25,
                              width: MediaQuery.of(context).size.width * 0.40,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                      '${URLS.IMAGE_URL}/${mycard[index]['card_image']}'),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 5,
                            right: 0,
                            child: Container(
                              height: 40,
                              width: MediaQuery.of(context).size.width * 0.450,
                              child: FittedBox(
                                child: AutoSizeText(
                                  "${mycard[index]['acronyms']}",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
          );
        });
  }

  late Timer mytimer;

  @override
  Widget build(BuildContext context) {
    var Cards = mycard.length;
    var Cards1 = cpucard.length;
    var remaingCardNumber = remainingcards.length - 1;

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
          padding: const EdgeInsets.symmetric(horizontal: 8),
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
                            // Navigator.of(context).pop();
                            showDialog(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                      title: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
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
                  isTimeStart
                      ? InkWell(
                          onTap: () {
                            // print('Clicked');
                            setState(() {
                              isobserving = true;
                            });
                            // Navigator.push
                            // print('After==>$isobserving');
                          },
                          child: Center(
                            child: Container(
                                // color: Colors.amber,
                                height: 45,
                                width: 100,
                                // child: Center(
                                //   child: Text(turn ? 'CPU Turn' : 'Your Turn'),
                                // ),
                                child: isCPUSpelling
                                    ? Image.asset('assets/images/spelling.png')
                                    : turn
                                        ? Center(
                                            child: Text(
                                              'CPU Turn',
                                              style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  color:
                                                      const Color(0xff212121)),
                                            ),
                                          )
                                        : Center(
                                            child: Text(
                                              'Your Turn',
                                              style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  color:
                                                      const Color(0xff212121)),
                                            ),
                                          )),
                          ),
                        )
                      : Container(),
                  Row(
                    children: [
                      Container(
                          padding: const EdgeInsets.only(right: 10),
                          height: 30,
                          width: 30,
                          // alignment: Alignment.center,
                          child: Image.asset("assets/images/sand clock.png")),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.watch_later_outlined,
                              size: 25,
                            ),
                            isTimeStart
                                ? TweenAnimationBuilder<Duration>(
                                    duration: const Duration(minutes: 3),
                                    tween: Tween(
                                        begin: const Duration(minutes: 3),
                                        end: Duration.zero),
                                    onEnd: () {
                                      print('Timer ended');
                                    },
                                    builder: (BuildContext context,
                                        Duration value, Widget? child) {
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
                                    })
                                : Container(),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Container(
                  // color: Colors.amber,
                  height: 90,
                  width: 80,
                ),
                JustTheTooltip(
                  showDuration: Duration(seconds: 3),
                  backgroundColor: Colors.black,
                  controller: cpuTooltipController,
                  preferredDirection: AxisDirection.down,
                  child: Material(
                    color: Colors.grey.shade800,
                    shape: const CircleBorder(),
                    animationDuration: Duration(seconds: 1),
                    elevation: 4.0,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 0, top: 5),
                      child: Stack(
                        children: [
                          // cpu_top
                          Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 0),
                                child: Stack(
                                  alignment: Alignment.topRight,
                                  children: [
                                    showCPUHiddenCard
                                        ? SlideTransition(
                                            position: cpuOffset,
                                            child: Container(
                                              height: 90,
                                              width: 60,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    // image: AssetImage(
                                                    //     'assets/images/HerrafCard.png'),
                                                    image: NetworkImage(
                                                        '${URLS.IMAGE_URL}/$cardColorCPU'),
                                                    fit: BoxFit.cover),
                                              ),
                                              alignment: Alignment.center,
                                              child: Text(""),
                                            ),
                                          )
                                        : Container(),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 10, bottom: 15),
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: SizedBox(
                                            height: 75,
                                            width: 70,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                      'assets/images/CPU player.png',
                                                    ),
                                                    // image: NetworkImage(
                                                    //     // widget.partnerdata!["image"]
                                                    //     ''),
                                                    fit: BoxFit.cover),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 30, bottom: 10),
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
                                padding:
                                    const EdgeInsets.only(right: 4, bottom: 7),
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
                                            color: const Color(0xffFFFFFF),
                                            fontSize: 12),
                                        textAlign: TextAlign.center)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 120),
                          ),
                        ],
                      ),
                    ),
                  ),
                  content: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      chatMessage.toString(),
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  ),
                ),
                for (var index = 0; index < remainingcards.length; index++)
                  ...[],
                // remainingcard_right
                Stack(
                  children: [
                    showRemainingHiddenCard
                        ? SlideTransition(
                            position: offset,
                            child: Container(
                              height: 90,
                              width: 60,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/HerrafCard.png'),
                                    fit: BoxFit.cover),
                              ),
                              alignment: Alignment.center,
                              child: Text(""),
                            ),
                          )
                        : Container(),
                    InkWell(
                      onTap: () {
                        _takeCardFromDeck();
                      },
                      child: Container(
                        height: 90,
                        width: 60,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/HerrafCard.png'),
                              fit: BoxFit.cover),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          remainingcards.length == 0
                              ? 'X108'
                              : "X$remaingCardNumber",
                          // 'X$REMAININGCARDS',
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 10,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),
              ]),
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
                            top: 30,
                            left: 100,
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
                                                      0.250,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.350,
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
                                                    0.250,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.350,
                                                child: Image.network(
                                                  "${URLS.IMAGE_URL}/${deckCards[index]['background']}",
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              Positioned(
                                                  top: 0,
                                                  right: 120,
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
                                                  width: 100,
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
                                                left: 45,
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
                      _chat(humanUserId);
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
                    controller: humanTooltipController,
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
                                        padding: const EdgeInsets.only(top: 10),
                                        child: SizedBox(
                                          height: 75,
                                          width: 70,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image:
                                                      NetworkImage(user_photo),
                                                  // NetworkImage(
                                                  //     '${URLS.IMAGE_URL}/$user_photo'),
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
                                padding:
                                    const EdgeInsets.only(left: 30, bottom: 10),
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
                                padding:
                                    const EdgeInsets.only(right: 4, bottom: 7),
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
                      ),
                    ),
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
                      print('TURN==>$turn');
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
              //mycard_bottom
              Container(
                margin: EdgeInsets.only(
                  left: 15,
                ),
                height: MediaQuery.of(context).size.height * 0.205,
                width: MediaQuery.of(context).size.width,
                child: isLoading
                    ? Center(
                        child:
                            CircularProgressIndicator(color: Color(0xffCE8C8C)))
                    : Stack(
                        children: <Widget>[
                          SlideTransition(
                            position: myCardOffset,
                            child: Center(
                              child: showMyHiddenCard
                                  ? Container(
                                      height: 150,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            // image: AssetImage(
                                            //     'assets/images/HerrafCard.png'),
                                            image: NetworkImage(
                                                '${URLS.IMAGE_URL}/$cardColor'),
                                            fit: BoxFit.cover),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(""),
                                    )
                                  : Container(),
                            ),
                          ),
                          for (var index = 0;
                              index < mycard.length;
                              index++) ...[
                            new Positioned(
                              left: index == 0
                                  ? 7
                                  : index == 1
                                      ? 20
                                      : double.parse((15.0 * index).toString()),
                              child: Transform.rotate(
                                angle: (double.parse("0.${index + 1}")),
                                child: GestureDetector(
                                    onTap: () async {
                                      // print("callingme");
                                      if (isCPUSpelling) {
                                        _fluttertoast();
                                      } else {
                                        _cardColor(mycard[index]['background']);
                                        _pushMyCard(index);
                                      }
                                      setState(() {
                                        showMyHiddenCard = true;
                                      });
                                      await myCardController.forward();
                                    },
                                    onLongPress: () {
                                      setState(() {
                                        _tapAndHold(index);
                                        // print('tap and hold');
                                      });
                                    },
                                    onDoubleTap: () {
                                      print('double tapped');
                                    },
                                    child: mycard[index]["card_type"]
                                                .toString() ==
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
                                                  child: CachedNetworkImage(
                                                    progressIndicatorBuilder:
                                                        (context, url,
                                                                progress) =>
                                                            Center(
                                                      child:
                                                          CircularProgressIndicator(
                                                        value:
                                                            progress.progress,
                                                      ),
                                                    ),
                                                    imageUrl:
                                                        '${URLS.IMAGE_URL}/${mycard[index]['card_image']}',
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                child: Container(
                                                  margin: EdgeInsets.only(
                                                      left: 10, top: 30),
                                                  padding:
                                                      EdgeInsets.only(top: 20),
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
                                                  top: 5,
                                                  right: 100,
                                                  child: Text(
                                                    '${mycard[index]['card_number']}',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15,
                                                        color: Colors.black),
                                                  )),
                                              Positioned(
                                                top: 0,
                                                left: 20,
                                                child: Container(
                                                  margin: EdgeInsets.only(
                                                      right: 10),
                                                  padding:
                                                      EdgeInsets.only(right: 5),
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
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                child: Container(
                                                  margin: EdgeInsets.only(
                                                      left: 10, top: 30),
                                                  padding:
                                                      EdgeInsets.only(top: 20),
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

  _pushMyCard(index) async {
    print(index);
    setState(() {
      isCPU = true;
    });
    setState(() {
      turn = true;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    ApiService.praticeGame_deck_area(
            prefs.getString('user_id'),
            mycard[index]['card_type'] == 'P'
                ? mycard[index]["penlty_card_id"]
                : mycard[index]["card_id"],
            widget.groupId,
            mycard[index]["card_type"])
        .then((value) {
      getDeckCards(widget.groupId);
    });

    mycard.removeAt(index);
    if (mycard.length == 0) {
      Future.delayed(const Duration(seconds: 2), () {
        _winnerConclude();
      });
      // _winner();
    } else {
      setState(() {
        if (isCPU) {
          print('HERE CPU TURN');

          Future.delayed(const Duration(seconds: 2), () {
            _CpuTurn();

            // print('ID==>${mycard[index]["card_id"]}');
            // print('OptionLength==> ${cardOptions.length}');
          });
        }
      });
    }
    setState(() {
      isCPU = false;
    });
  }

  _CpuTurn() {
    int count = 0;
    print('Here==> $userTakenPenlty');

    if (deckCards.elementAt(deckCards.length - 1)['card_type'] == 'P') {
      print('Penalty card on table');
      setState(() {
        userTakenPenlty
            ? _pushCPUCard(cpucard.length - 1)
            : Future.delayed(const Duration(seconds: 2), () {
                setState(() {
                  _cpuRunHerraf();
                  setState(() {
                    isCPUSpelling = true;
                    optionTime = cardOptions.length * 2;
                  });
                  _selectingOptions();
                  userTakenPenlty = false;
                });
              });
      });
    } else {
      Future.delayed(const Duration(seconds: 2), () {
        print(
            'DeckCardNumber==>${deckCards.elementAt(deckCards.length - 1)['card_number']}');
        print(
            'DeckCardColor==>${deckCards.elementAt(deckCards.length - 1)['card_color']}');

        for (var i = 0; i < cpucard.length; i++) {
          print('HERE CPU TURN in LOOP HERE');
          if (deckCards.elementAt(deckCards.length - 1)['card_number'] ==
              cpucard[i]['card_number']) {
            print('YES(Card Number)==>${cpucard[i]['card_number']}');
            _pushCPUCard(i);
            setState(() {
              isCPU = false;
            });
            break;
          } else if (deckCards.elementAt(deckCards.length - 1)['card_color'] ==
              cpucard[i]['card_color']) {
            print('YES(Card Color)==>${cpucard[i]['card_color']}');
            _pushCPUCard(i);
            setState(() {
              isCPU = false;
            });
            break;
          } else {
            print('COUNT==>$count');
            if (count == 1) {
              break;
            }
            setState(() {
              isCPU = false;
              count++;
              _cPUtakeCardFromDeck();
            });
          }
        }
      });
    }
  }

  _selectingOptions() {
    print('Screen here');
    print('Selecting Options');
    Future.delayed(Duration(seconds: optionTime), () {
      _anserChecking();
    });
  }

  _anserChecking() {
    print('Answer Checking');
    Future.delayed(Duration(seconds: 2), () {
      _playAgain();
    });
  }

  _playAgain() {
    print('Play again Clicked');
    setState(() {
      isCPUSpelling = false;
      isCPU = false;
      isobserving = false;
    });
    setState(() {
      turn = false;
    });
    _cPUtakeCardFromDeck();
  }

  _pushCPUCard(index) async {
    _cardColorCPU(cpucard[index]["background"]);
    setState(() {
      showCPUHiddenCard = true;
    });
    await cpuCardController.forward();
    // print(index);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    ApiService.cpu_praticeGame_deck_area(
            prefs.getString('user_id'),
            cpucard[index]['card_type'] == 'P'
                ? cpucard[index]["penlty_card_id"]
                : cpucard[index]["card_id"],
            widget.groupId,
            cpucard[index]["card_type"])
        .then((value) {
      getDeckCards(widget.groupId);
    });
    setState(() {
      cpucard.removeAt(index);
      turn = false;
    });
    if (cpucard.length == 0) {
      _winnerConclude();
    }
  }

  getDeckCards(group_id) {
    ApiService.practice_get_deck_card(widget.groupId).then((value) {
      // print('PUSH(AFTER)==>$value');

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
      // print('PUSH(AFTER)==>${deckCards.last}');
    });
  }

  _penalty(id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    ApiService.penaltyPratice(
      widget.groupId,
      prefs.getString('user_id'),
      id,
    ).then((value) {
      print(value['data']);
      for (var i = 0; i < value["data"].length; i++) {
        setState(() {
          mycard.add({
            "question": value["data"][0]["question"],
            "card_image": value["data"][0]["card_image"],
            "acronyms": value["data"][0]["acronyms"],
            "card_number": value["data"][0]["card_number"],
            "card_id": value["data"][0]["flash_card_id"],
            "penlty_card_id": value["data"][0]["id"],
            "background": value["data"][0]["background"],
            "card_name": value["data"][0]["card_name"],
            "card_type": value["data"][0]["card_type"]
          });
          _turntoast();
          setState(() {
            userTakenPenlty = true;
            Future.delayed(const Duration(seconds: 2), () {
              _CpuTurn();
            });
          });
          // if (isCPU) {
          //   print('isCPU ==> $isCPU');

          //   print('HERE CPU TURN');
          //   Future.delayed(const Duration(seconds: 2), () {
          //     _CpuTurn();
          //   });
          // }
        });
      }
    });
  }

  _cPUpenalty(id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    ApiService.penaltyPratice(
      widget.groupId,
      prefs.getString('user_id'),
      id,
    ).then((value) {
      print(value['data']);
      for (var i = 0; i < value["data"].length; i++) {
        setState(() {
          cpucard.add({
            "question": value["data"][0]["question"],
            "card_image": value["data"][0]["card_image"],
            "acronyms": value["data"][0]["acronyms"],
            "card_number": value["data"][0]["card_number"],
            "card_id": value["data"][0]["flash_card_id"],
            "penlty_card_id": value["data"][0]["id"],
            "background": value["data"][0]["background"],
            "card_name": value["data"][0]["card_name"],
            "card_type": value["data"][0]["card_type"]
          });
        });
      }
      if (isobserving) {
        Navigator.of(context).pop();
      } else {
        print('isobserving==>$isobserving');
      }
      _runCPUFirst();
      if (isCPU == true) {
        setState(() {
          isCPU = false;
        });
      } else {
        setState(() {
          isCPU = true;
        });
      }
    });
  }

  _takeCardFromDeck() async {
    setState(() {
      showRemainingHiddenCard = true;
      offset = Tween<Offset>(begin: Offset(0.0, 0.0), end: Offset(-4, 6.0))
          .animate(controller);
    });
    await controller.forward();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    ApiService.takeCardFromDeck(
      prefs.getString('user_id'),
      widget.groupId,
    ).then((value) {
      // print('CardFromDeck==>$value');
      // print(value["data"][0]["card_number"]);
      setState(() {
        mycard.add({
          "question": value["data"][0]["question"],
          "card_image": value["data"][0]["card_image"],
          "acronyms": value["data"][0]["acronyms"],
          "card_number": value["data"][0]["card_number"],
          "card_id": value["data"][0]["flash_card_id"],
          "penlty_card_id": value["data"][0]["id"],
          "background": value["data"][0]["background"],
          "card_name": value["data"][0]["card_name"],
          "card_type": value["data"][0]["card_type"]
        });
        // print('myCardLemgth==${mycard.length}');
      });
      remainingcards.removeLast();
      setState(() {
        Future.delayed(const Duration(seconds: 2), () {
          if (value["data"][0]["card_number"] ==
              deckCards.last['card_number']) {
            print('Match Found with card Number');
          } else if (value["data"][0]["card_color"] ==
              deckCards.last['card_color']) {
            print('Match Found with card color');
          } else {
            print('NO MATCH FOUND');
            setState(() {
              turn = false;
              // _turntoast();
              turn = true;
            });
            _CpuTurn();
          }
        });
      });
    });
  }

  _cPUtakeCardFromDeck() async {
    print("TAKINGCPU");
    setState(() {
      showRemainingHiddenCard = true;
      offset = Tween<Offset>(begin: Offset(0.0, 0.0), end: Offset(-2.0, 0.0))
          .animate(controller);
    });
    await controller.forward();
    ApiService.cputakeCardFromDeck(
      widget.groupId,
    ).then((value) {
      // print('CardFromDeck==>$value');
      setState(() {
        cpucard.add({
          "question": value["data"][0]["question"],
          "card_image": value["data"][0]["card_image"],
          "acronyms": value["data"][0]["acronyms"],
          "card_number": value["data"][0]["card_number"],
          "card_id": value["data"][0]["flash_card_id"],
          "penlty_card_id": value["data"][0]["id"],
          "background": value["data"][0]["background"],
          "card_name": value["data"][0]["card_name"],
          "card_type": value["data"][0]["card_type"],
          "card_color": value["data"][0]["card_color"]
        });
        print('Took one card from deck==>${value['status']}');
        // print('INDEX==>${cpucard.elementAt(cpucard.length - 1)}');
      });
      remainingcards.removeLast();
      if (value["data"][0]["card_number"] ==
          deckCards.elementAt(deckCards.length - 1)['card_number']) {
        print('Match Found with card number');
        _pushCPUCard(cpucard.length - 1);
      } else if (value["data"][0]["card_color"] ==
          deckCards.elementAt(deckCards.length - 1)['card_color']) {
        print('Match Found with card color');
        _pushCPUCard(cpucard.length - 1);
      } else {
        print('NO MATCH FOUND');
        setState(() {
          turn = true;
          _turntoast();
          turn = false;
          isCPU = false;
        });
      }
    });
  }
}

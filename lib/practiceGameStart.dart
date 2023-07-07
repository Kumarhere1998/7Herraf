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
  Timer? countdownTimer;
  Duration myDuration = Duration(minutes: 1);
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
  bool cpuChoosingOptions = false;
  int? optionTime;

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
  double angle = -0.7;
  final cpuTooltipController = JustTheController();
  final humanTooltipController = JustTheController();

  late int originalLength = deckCards.length;

  late AnimationController controller;
  late Animation<Offset> offset;

  late AnimationController myCardController;
  late Animation<Offset> myCardOffset;

  late AnimationController cpuCardController;
  late Animation<Offset> cpuOffset;

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
    startTimer();

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

  void startTimer() {
    countdownTimer =
        Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
  }

  void resetTimer() {
    stopTimer();
    setState(() => myDuration = Duration(minutes: 1));
  }

  void stopTimer() {
    setState(() => countdownTimer!.cancel());
  }

  void setCountDown() {
    final reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
        setState(() {
          if (turn == true) {
            setState(() {
              turn = false;
            });
          } else {
            setState(() {
              turn = true;
            });
          }
          resetTimer();
          startTimer();
          _CpuTurn();
        });
      } else {
        myDuration = Duration(seconds: seconds);
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

    });
  }

  _turnChangeTimer() {
    resetTimer();
    startTimer();
  }

  _cardColor(imageColor) {
    setState(() {
      cardColor = imageColor;
    });
  }

  _cardColorCPU(imageColor) {
    setState(() {
      cardColorCPU = imageColor;
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

  _getUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      user_photo = prefs.getString("photo")!;
      humanUserId = prefs.getString("user_id")!;
    });
  }

  _winner() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    ApiService.practiceGameWinner(prefs.get('user_id'), widget.groupId)
        .then((value) {
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
    setState(() {
      isCPUSpelling = true;
    });
    ApiService.quiz_options(Card_id).then((value) {
      cardOptions = value['data'];
    });
    setState(() {
      _selectingOptions(cardOptions.length);
    });
  }

  _winnerConclude() async {
    ApiService.practiceGameWinnerConculde(widget.groupId).then((value) {
      if (value['status']) {
        _winner();
      }
    });
  }

  _totalCardDistribution() {
    ApiService.practice_total_card_distribution(widget.groupId).then((value) {
      setState(() {
        totalCard = value['data'];
        if (value['status']) {
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
            "card_color": value["data"]['randomCards'][i]["card_color"],
            "postion": 70,
            "_leftPosition": (mycard.length * 20)
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
            "card_color": value["data"]['randomCPUCards'][i]["card_color"],
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
        });
      }
      setState(() {
        isLoading = false;
        isTimeStart = true;
        REMAININGCARDS = remainingcards.length - 1;
        remainingcards.shuffle();
      });
    });
  }

  _firstDeckcard() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    ApiService.practice_first_get_deck_card(
            prefs.get('user_id'), widget.groupId)
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
            "card_name": value["data"][i]["card_name"],
            "card_color": value["data"][i]["card_color"]
          });
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
    if (result['message'] == 'Wrong Spelling') {
      _takeCardFromDeck();
      setState(() {
        turn = false;
        _CpuTurn();
        turn = true;
        _turnChangeTimer();
      });
    }
    if (result) {
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
    Future.delayed(const Duration(seconds: 2), () {
      deckCards[deckCards.length - 1]["card_type"] == "P"
          ? _cPUpenalty(deckCards[deckCards.length - 1]["card_name"])
          : _quizOptions(deckCards[deckCards.length - 1]["card_id"]);
    });
  }

  _leaveGame() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    ApiService.leaveGame(prefs.get('user_id'), widget.groupId).then((value) {
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
        msg: "Please wait for your turn",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  _cardMatchtoast() {
    Fluttertoast.showToast(
        msg: "Please play with valid card or choose another options",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 3,
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
    await ApiService.sendChat(messageMap);

    Navigator.pop(context);
  }

  _tapAndHold(index) {
    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: Colors.black45,
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (BuildContext buildContext, Animation animation,
            Animation secondaryAnimation) {
          return Center(
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
                                  decoration: TextDecoration.none,
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            )),
                      ],
                    )
                  : Container(
                      child: Stack(
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
                                    decoration: TextDecoration.none,
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
                                    decoration: TextDecoration.none,
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
                                      decoration: TextDecoration.none,
                                      color: Colors.black,
                                      fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ));
        });
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');

    var Cards = mycard.length;
    var Cards1 = cpucard.length;
    var remaingCardNumber = remainingcards.length - 1;
    final minutes = strDigits(myDuration.inMinutes.remainder(60));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));

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
              Container(
                color: Colors.amber,
                child: Row(
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
                                                      style:
                                                          GoogleFonts.poppins(
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      132,
                                                                      131,
                                                                      131),
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500)),
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
                                                  decoration:
                                                      const BoxDecoration(
                                                          color:
                                                              Color(0xffCE8C8C),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  (Radius
                                                                      .circular(
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
                              setState(() {
                                isobserving = true;
                              });
                            },
                            child: Center(
                              child: Container(
                                  height: 45,
                                  width: 100,
                                  child: isCPUSpelling
                                      ? Image.asset(
                                          'assets/images/spelling.png')
                                      : turn
                                          ? Center(
                                              child: Text(
                                                'CPU Turn',
                                                style: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    color: const Color(
                                                        0xff212121)),
                                              ),
                                            )
                                          : Center(
                                              child: Text(
                                                'Your Turn',
                                                style: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    color: const Color(
                                                        0xff212121)),
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
                                  ? Text("$minutes:$seconds")
                                  // TweenAnimationBuilder<Duration>(
                                  //     duration: const Duration(minutes: 2),
                                  //     tween: Tween(
                                  //         begin: const Duration(minutes: 2),
                                  //         end: Duration.zero),
                                  //     onEnd: () {
                                  //       if (turn == true) {
                                  //         setState(() {
                                  //           turn = false;
                                  //         });
                                  //       } else {
                                  //         setState(() {
                                  //           turn = true;
                                  //         });
                                  //       }
                                  //       _CpuTurn();
                                  //     },
                                  //     builder: (BuildContext context,
                                  //         Duration value, Widget? child) {
                                  //       final minutes = value.inMinutes;
                                  //       final seconds = value.inSeconds % 60;
                                  //       return Padding(
                                  //           padding: const EdgeInsets.symmetric(
                                  //               vertical: 5),
                                  //           child: Text('$minutes:$seconds',
                                  //               textAlign: TextAlign.center,
                                  //               style: const TextStyle(
                                  //                   color: Color(0xff00253A),
                                  //                   fontWeight: FontWeight.w600,
                                  //                   fontSize: 18)));
                                  //     })
                                  : Container(),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                color: Colors.red,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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
                                              padding: const EdgeInsets.only(
                                                  top: 10),
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
                                    image: AssetImage(
                                        'assets/images/HerrafCard.png'),
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
              ),
              Container(
                  color: Colors.blueGrey,
                  padding: const EdgeInsets.only(
                    top: 10,
                  ),
                  // margin: new EdgeInsets.symmetric(horizontal: 20.0),

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
                            left: 120,
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
              Container(
                // color: Colors.pinkAccent,
                child: Row(
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
                        turn == false ? _runHerraf() : _fluttertoast();
                      },
                      child: Container(
                        // color:Colors.amber,
                        padding: const EdgeInsets.only(
                          top: 25,
                        ),
                        height: 100,
                        width: 100,
                        child: Image.asset("assets/images/herraf button.png"),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                color: Colors.green,
                height: MediaQuery.of(context).size.height * 0.250,
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
                          Center(
                            child: Container(
                              color: Colors.red,
                              //margin: EdgeInsets.only(left: 50),
                              height: 200,
                              width: MediaQuery.of(context).size.width,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  for (var index = 0;
                                      index < mycard.length;
                                      index++) ...[
                                    Positioned(
                                      top: double.parse(
                                          mycard[index]["postion"].toString()),
                                      left: double.parse(
                                          mycard[index]["_leftPosition"].toString()),
                                      child: Transform.rotate(
                                          angle: mycard[index]["postion"] != 70
                                              ? 0
                                              : double.parse(
                                                  (angle + (index * 0.2))
                                                      .toStringAsFixed(1)),
                                          child: GestureDetector(
                                            onPanUpdate:  (DragUpdateDetails details) {
                                                setState(() {
                                                  mycard[index]["postion"] += details.delta.dy;

                                                      mycard[index]["_leftPosition"] += details.delta.dx;
                                                });
                                            },
                                              // onVerticalDragUpdate:
                                              //     (DragUpdateDetails details) {
                                              //   setState(() {
                                              //     mycard[index]["postion"] +=
                                              //         details.delta.dy;
                                              //   });
                                              // },
                                              // onHorizontalDragUpdate:
                                              //     (DragUpdateDetails details) {
                                              //   setState(() {
                                              //     mycard[index]["_leftPosition"] +=
                                              //         details.delta.dx;
                                              //   });
                                              // },
                                              onPanEnd:
                                                  (DragEndDetails details) {
                                                setState(() async {
                                                  if (mycard[index]["postion"] <
                                                      -150) {
                                                  
                                                    if (turn) {
                                                      _fluttertoast();
                                                    } else {
                                                      _cardColor(mycard[index]
                                                          ['background']);
                                                      if (mycard[index]
                                                              ['card_type'] ==
                                                          'P') {
                                                        _pushMyCard(index);
                                                        setState(() {
                                                          showMyHiddenCard =
                                                              true;
                                                        });
                                                        await myCardController
                                                            .forward();
                                                      } else if (deckCards.last[
                                                              'card_color'] ==
                                                          mycard[index]
                                                              ['card_color']) {
                                                        _pushMyCard(index);
                                                        setState(() {
                                                          showMyHiddenCard =
                                                              true;
                                                        });
                                                        await myCardController
                                                            .forward();
                                                      } else if (deckCards.last[
                                                              'card_number'] ==
                                                          mycard[index]
                                                              ['card_number']) {
                                                        _pushMyCard(index);
                                                        setState(() {
                                                          showMyHiddenCard =
                                                              true;
                                                        });
                                                        await myCardController
                                                            .forward();
                                                      } else {
                                                        _cardMatchtoast();
                                                      }
                                                    }
                                                  }
                                                  mycard[index]["postion"] = 70;
                                                });
                                              },
                                              onTap: () async {
                                                if (turn) {
                                                  _fluttertoast();
                                                } else {
                                                  _cardColor(mycard[index]
                                                      ['background']);
                                                  if (mycard[index]
                                                          ['card_type'] ==
                                                      'P') {
                                                    _pushMyCard(index);
                                                    setState(() {
                                                      showMyHiddenCard = true;
                                                    });
                                                    await myCardController
                                                        .forward();
                                                  } else if (deckCards
                                                          .last['card_color'] ==
                                                      mycard[index]
                                                          ['card_color']) {
                                                    _pushMyCard(index);
                                                    setState(() {
                                                      showMyHiddenCard = true;
                                                    });
                                                    await myCardController
                                                        .forward();
                                                  } else if (deckCards.last[
                                                          'card_number'] ==
                                                      mycard[index]
                                                          ['card_number']) {
                                                    _pushMyCard(index);
                                                    setState(() {
                                                      showMyHiddenCard = true;
                                                    });
                                                    await myCardController
                                                        .forward();
                                                  } else {
                                                    _cardMatchtoast();
                                                  }
                                                }
                                              },
                                              onLongPress: () {
                                                setState(() {
                                                  _tapAndHold(index);
                                                });
                                              },
                                              onDoubleTap: () {
                                              },
                                              child: mycard[index]["card_type"]
                                                          .toString() ==
                                                      "P"
                                                  ? Stack(
                                                      clipBehavior: Clip.none,
                                                      alignment: Alignment
                                                          .bottomCenter,
                                                      children: [
                                                        Container(
                                                            color:
                                                                Colors.yellow,
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.130,
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.230,
                                                            child:
                                                                Image.network(
                                                              '${URLS.IMAGE_URL}/${mycard[index]['background']}',
                                                              fit: BoxFit.fill,
                                                            )),
                                                        Positioned(
                                                          top: 45,
                                                          child: Container(
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.05,
                                                            width: 50,
                                                            child:
                                                                CachedNetworkImage(
                                                              progressIndicatorBuilder:
                                                                  (context, url,
                                                                          progress) =>
                                                                      Center(
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  value: progress
                                                                      .progress,
                                                                ),
                                                              ),
                                                              imageUrl:
                                                                  '${URLS.IMAGE_URL}/${mycard[index]['card_image']}',
                                                            ),
                                                          ),
                                                        ),
                                                        Positioned(
                                                          child: Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 10,
                                                                    top: 30),
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: 20),
                                                            width: 50,
                                                            height: 40,
                                                            child: FittedBox(
                                                              child:
                                                                  AutoSizeText(
                                                                "${mycard[index]['card_name']}",
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  : Stack(
                                                      clipBehavior: Clip.none,
                                                      alignment: Alignment
                                                          .bottomCenter,
                                                      children: [
                                                        Container(
                                                            color:
                                                                Colors.yellow,
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.130,
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.230,
                                                            child:
                                                                Image.network(
                                                              '${URLS.IMAGE_URL}/${mycard[index]['background']}',
                                                              fit: BoxFit.fill,
                                                            )),
                                                        Positioned(
                                                            top: 0,
                                                            right: 75,
                                                            child: Text(
                                                              '${mycard[index]['card_number']}',
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 15,
                                                                  color: Colors
                                                                      .black),
                                                            )),
                                                        Positioned(
                                                          top: 0,
                                                          left: 20,
                                                          child: Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    right: 10),
                                                            padding:
                                                                EdgeInsets.only(
                                                                    right: 5),
                                                            width: 75,
                                                            height: 20,
                                                            child: FittedBox(
                                                              child:
                                                                  AutoSizeText(
                                                                "${mycard[index]['question']}",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Positioned(
                                                          top: 30,
                                                          child: Container(
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.05,
                                                            width: 50,
                                                            decoration:
                                                                BoxDecoration(
                                                              image:
                                                                  DecorationImage(
                                                                fit:
                                                                    BoxFit.fill,
                                                                image: NetworkImage(
                                                                    "${URLS.IMAGE_URL}/${mycard[index]['card_image']}"),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Positioned(
                                                          child: Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 10,
                                                                    top: 30),
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: 20),
                                                            width: 50,
                                                            height: 40,
                                                            child: FittedBox(
                                                              child:
                                                                  AutoSizeText(
                                                                "${mycard[index]['acronyms']}",
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ))),
                                    )
                                  ]
                                ],
                              ),
                            ),
                          ),

                          /*ListView.builder(
          itemCount: mycard.length, // Number of cards to display
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            double currentAngle = angle + (index * 0.2); 


              return new Positioned(
                  //left: index * 10,
                  child: Transform.rotate(
                    angle: currentAngle,
                    child: GestureDetector(
                        onTap: () async {
                          if (turn) {
                            _fluttertoast();
                          } else {
                            _cardColor(mycard[index]['background']);
                            if (mycard[index]['card_type'] == 'P') {
                              _pushMyCard(index);
                              setState(() {
                                showMyHiddenCard = true;
                              });
                              await myCardController.forward();
                            } else if (deckCards
                                    .last['card_color'] ==
                                mycard[index]['card_color']) {
                              _pushMyCard(index);
                              setState(() {
                                showMyHiddenCard = true;
                              });
                              await myCardController.forward();
                            } else if (deckCards
                                    .last['card_number'] ==
                                mycard[index]['card_number']) {
                              _pushMyCard(index);
                              setState(() {
                                showMyHiddenCard = true;
                              });
                              await myCardController.forward();
                            } else {
                              _cardMatchtoast();
                            }
                          }
                        },
                        onLongPress: () {
                          setState(() {
                            _tapAndHold(index);
                          });
                        },
                        onDoubleTap: () {
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
                );

          })*/
                        ],
                      ),
              ), 

              //mycard_bottom
            ],
          )),
        ),
      ),
    );
  }

  _pushMyCard(index) async {
    setState(() {
      isCPU = true;
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
          Future.delayed(const Duration(seconds: 2), () {
            _CpuTurn();
            _turnChangeTimer();
            // _cpuRunHerraf();
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
    if (deckCards.elementAt(deckCards.length - 1)['card_type'] == 'P') {
      setState(() {
        Future.delayed(const Duration(seconds: 3), () {
          _cpuRunHerraf();
        });
      });
    } else {
      Future.delayed(const Duration(seconds: 3), () {
        for (var i = 0; i < cpucard.length; i++) {
          if (deckCards.elementAt(deckCards.length - 1)['card_number'] ==
              cpucard[i]['card_number']) {
            _pushCPUCard(i);
            setState(() {
              isCPU = false;
            });
            break;
          } else if (deckCards.elementAt(deckCards.length - 1)['card_color'] ==
              cpucard[i]['card_color']) {
            _pushCPUCard(i);
            setState(() {
              isCPU = false;
            });
            break;
          } else {
            if (count == 1) {
              break;
            }
            setState(() {
              isCPU = false;
              count++;
              if (cpuChoosingOptions) {
                _cpuRunHerraf();
                setState(() {
                  cpuChoosingOptions = false;
                });
              } else {
                _cPUtakeCardFromDeck();
                setState(() {
                  cpuChoosingOptions = true;
                });
              }
            });
          }
        }
      });
    }
  }

  _selectingOptions(optionTime) {
    setState(() {
      optionTime = optionTime * 2;
    });
    Future.delayed(Duration(seconds: optionTime), () {
      _anserChecking();
    });
  }

  _anserChecking() {
    Future.delayed(Duration(seconds: 2), () {
      _playAgain();
    });
  }

  _playAgain() {
    setState(() {
      turn = false;
      isCPUSpelling = false;
      isCPU = false;
      isobserving = false;
    });
    _cPUtakeCardFromDeck();
    _turnChangeTimer();
  }

  _pushCPUCard(index) async {
    _turnChangeTimer();
    _cardColorCPU(cpucard[index]["background"]);
    setState(() {
      showCPUHiddenCard = true;
    });
    await cpuCardController.forward();
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
  }

  _penalty(id) async {
    ApiService.penalty(
            widget.groupId, deckCards[deckCards.length - 1]["card_name"])
        .then((value) {
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
            "card_type": value["data"][0]["card_type"],
            "card_color": value["data"][0]["card_color"],
            "postion": 70,
            "_leftPosition": (mycard.length * 20)
          });
          _turntoast();
          setState(() {
            userTakenPenlty = true;
            Future.delayed(const Duration(seconds: 2), () {
              turn = true;

              _turnChangeTimer();
              _CpuTurn();
            });
          });
        });
      }
    });
  }

  _cPUpenalty(id) async {
    ApiService.penaltyCPU(
            widget.groupId, deckCards[deckCards.length - 1]["card_name"])
        .then((value) {
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
            "card_type": value["data"][0]["card_type"],
            "card_color": value["data"][0]["card_color"]
          });
        });
      }
      setState(() {
        int howMany;
        howMany = deckCards[deckCards.length - 1]["card_name"] == '+2' ? 2 : 4;
        remainingcards.length = remainingcards.length - howMany;
        turn = false;
        _turnChangeTimer();
      });
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
          "card_type": value["data"][0]["card_type"],
          "card_color": value["data"][0]["card_color"],
          "postion": 70,
          "_leftPosition": (mycard.length * 20)
        });
      });
      remainingcards.removeLast();
      setState(() {
        Future.delayed(const Duration(seconds: 2), () {
          if (value["data"][0]["card_number"] ==
              deckCards.last['card_number']) {
            setState(() {
              turn = false;
              turn = true;
            });
            _turnChangeTimer();

            _CpuTurn();
          } else if (value["data"][0]["card_color"] ==
              deckCards.last['card_color']) {
            setState(() {
              turn = false;
              turn = true;
            });
            _turnChangeTimer();

            _CpuTurn();
          } else {
            setState(() {
              turn = false;
              turn = true;
            });
            _turnChangeTimer();

            _CpuTurn();
          }
        });
      });
    });
  }

  _cPUtakeCardFromDeck() async {
    _turnChangeTimer();

    setState(() {
      showRemainingHiddenCard = true;
      offset = Tween<Offset>(begin: Offset(0.0, 0.0), end: Offset(-2.0, 0.0))
          .animate(controller);
    });
    await controller.forward();
    ApiService.cputakeCardFromDeck(
      widget.groupId,
    ).then((value) {
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
      });
      remainingcards.removeLast();
      if (value["data"][0]["card_number"] ==
          deckCards.elementAt(deckCards.length - 1)['card_number']) {
        // _pushCPUCard(cpucard.length - 1);
        setState(() {
          turn = true;
          _turntoast();
          turn = false;
          isCPU = false;
        });
      } else if (value["data"][0]["card_color"] ==
          deckCards.elementAt(deckCards.length - 1)['card_color']) {
        // _pushCPUCard(cpucard.length - 1);
        setState(() {
          turn = true;
          _turntoast();
          turn = false;
          isCPU = false;
        });
      } else {
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

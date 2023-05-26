// ignore_for_file: must_be_immutable

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:herraf_app/api_servivce.dart';
import 'package:herraf_app/bottomNavBar.dart';
import 'package:herraf_app/failpage.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuitquizPratice extends StatefulWidget {
  Map? acronyms;
  final groupId;
  bool isCPU;
  bool isCPUSpelling;
  QuitquizPratice(this.acronyms, this.groupId, this.isCPU, this.isCPUSpelling,
      );

  @override
  _QuitquizPraticeState createState() => _QuitquizPraticeState();
}

bool _hasBeenPressed = false;

class _QuitquizPraticeState extends State<QuitquizPratice> {
  final String message = '';

  late PageController _pageController;
  int currentIndex = 0;

  List acronym = [];
  List quizOption = [];

  List<dynamic> selectedOption = [];

  double _currentSliderValue = 1;
  bool isSpinner = false;

  var i;

  @override
  void initState() {
    quiz_options();

    _pageController = PageController(initialPage: 0);

    if (widget.isCPU == true) {
      _cpuGiveAnswer();
    }
    super.initState();
  }

  _cpuGiveAnswer() {
    Future.delayed(const Duration(seconds: 3), () {
      // if (widget.isCPU == false) {
      _getCorrectAnswer(0);
      // }
    });
  }

  _getCorrectAnswer(index) {
    setState(() {
      currentIndex += 1;
      if (acronym.length > currentIndex) {
        _currentSliderValue = (currentIndex + 1);

        _pageController.animateToPage(currentIndex,
            duration: Duration(milliseconds: 500), curve: Curves.ease);
        // print(
        //     "${currentIndex}_${acronym.length}");
      }
    });
    _selectedOption(quizOption[index]);
    if (widget.isCPU == true) {
      if (acronym.length > selectedOption.length) {
        Future.delayed(const Duration(seconds: 3), () {
          _getCorrectAnswer(0);
        });
      } else {
        // checking final answer
        print("checking final answer");
        _checkCorrectAnswer();
      }
    }
  }

  quiz_options() {
    setState(() {
      isSpinner = true;
    });
    // print('CARDID=${widget.acronyms!["card_id"]}');
    // print('QUESTION=${widget.acronyms!["question"]}');
    ApiService.quiz_options(widget.acronyms!["card_id"]).then((value) {
      var response = value["data"];
      setState(() {
        isSpinner = false;
        acronym = response;
        _takeQuizOption(acronym[0]);
      });
    });
  }

  _checkCorrectAnswer() {
    setState(() {
      if (selectedOption.isEmpty) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Please select the options')));
      } else {
        _answerChecking("option");
      }
    });
  }

  _optionClicked(i) {
    setState(() {
      _hasBeenPressed = !_hasBeenPressed;
      _currentSliderValue = (i + 1).toDouble();
      currentIndex = i;
    });
    _takeQuizOption(acronym[i]);
  }

  _answerChecking(option) async {
    // print('Acrronym = ${widget.acronyms!["card_id"]}');
    ApiService.checking_answer(
      widget.groupId,
      (widget.acronyms!["card_id"]),
      selectedOption.join(' '),
    ).then((value) {
      // print(value);
      if (selectedOption.isEmpty) {
        Text("Please Select the options");
      } else {
        final result = Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => FailPage(
                  value['message'], widget.isCPU, widget.isCPUSpelling)),
        );
        print("resultresult_${result}");
      }
    });
  }

  _leaveGame() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    ApiService.leaveGame(prefs.get('user_id'), widget.groupId).then((value) {
      print(value);
    });
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => BottomNav(2)));
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  _takeQuizOption(item) {
    setState(() {
      quizOption = item["quiz_options"];
      // selectedOption = item["quiz_option"];
    });
  }

  _selectedOption(option) {
    print(option);
    setState(() {
      selectedOption.add(option);
    });
  }

  @override
  Widget build(BuildContext context) {
    // print('GI==>${widget.groupId}');

    print(widget.groupId);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffDADADA),
        title: Text(
          "Quit the quiz",
          style: GoogleFonts.poppins(
              color: Color(0xff212121),
              fontSize: 16,
              fontWeight: FontWeight.w500),
        ),
        leading: InkWell(
          onTap: () {
            // Navigator.of(context).pop();
            showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                width:
                                    MediaQuery.of(context).size.width * 0.300,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 1,
                                    ),
                                    // color: Colors.amber,
                                    borderRadius: BorderRadius.all(
                                        (Radius.circular(10)))),
                                child: Text("Cancel",
                                    style: GoogleFonts.poppins(
                                        color:
                                            Color.fromARGB(255, 132, 131, 131),
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
                                width:
                                    MediaQuery.of(context).size.width * 0.300,
                                decoration: const BoxDecoration(
                                    color: Color(0xffCE8C8C),
                                    borderRadius: BorderRadius.all(
                                        (Radius.circular(10)))),
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
          },
          child: Container(
            padding: const EdgeInsets.only(
              left: 20,
            ),
            child: Icon(
              Icons.arrow_back,
              color: Color(0xff000000),
            ),
          ),
        ),
        actions: [
          Container(
            decoration: BoxDecoration(
              // color: Color(0xffCE8C8C),
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.only(top: 8),
            padding: const EdgeInsets.only(right: 0),
            // height: 25,
            width: 100,
            alignment: Alignment.center,
            child: widget.isCPU == true
                ? Row(
                    children: [
                      Icon(
                        Icons.play_arrow_rounded,
                        color: Color(0xffCE8C8C),
                      ),
                      Text('CPU turn',
                          style: const TextStyle(
                              color: Color(0xffCE8C8C), fontSize: 15)),
                    ],
                  )
                : Row(
                    children: [
                      Icon(
                        Icons.play_arrow_rounded,
                        color: Color(0xffCE8C8C),
                      ),
                      Text('Your Turn',
                          style: const TextStyle(
                              color: Color(0xffCE8C8C), fontSize: 15)),
                    ],
                  ),
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      backgroundColor: Color(0xffDADADA),
      body: isSpinner
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        padding: const EdgeInsets.only(right: 10),
                        height: 65,
                        width: 65,
                        alignment: Alignment.center,
                        child: Image.asset("assets/images/sand clock.png")),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Row(
                        children: [
                          TweenAnimationBuilder<Duration>(
                              duration: const Duration(minutes: 3),
                              tween: Tween(
                                  begin: const Duration(minutes: 3),
                                  end: Duration.zero),
                              onEnd: () {
                                print('Timer ended');
                              },
                              builder: (BuildContext context, Duration value,
                                  Widget? child) {
                                final minutes = value.inMinutes;
                                final seconds = value.inSeconds % 60;
                                return Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    child: Text('$minutes:$seconds ',
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
                ),
                Column(children: [
                  Container(
                    padding: EdgeInsets.only(left: 6, right: 6),
                    height: 80,
                    width: MediaQuery.of(context).size.width,
                    child: FittedBox(
                      child: Text(
                        widget.acronyms!["question"],
                        style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        for (var i = 0; i < acronym.length; i++) ...[
                          InkWell(
                            onTap: () {
                              _optionClicked(i);
                            },
                            child: Text(
                              "${acronym[i]['quiz_letters']}",
                              style: GoogleFonts.poppins(
                                  color: currentIndex == i
                                      ? Color(0xffCE8C8C)
                                      : Color(0xff212121),
                                  // color: const Color(0xff212121),
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ],
                    ),
                  )
                ]),
                Container(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Row(
                              children: [
                                Text('  ${_currentSliderValue.toInt()}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xffCE8C8C))),
                                Text(
                                  "/${acronym.length.toString()}",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            )),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                            margin: EdgeInsets.only(top: 5),
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                            ),
                            child: LinearPercentIndicator(
                              width: 380,
                              animation: false,
                              lineHeight: 6.0,
                              animationDuration: 2000,
                              percent: double.parse(
                                  (((_currentSliderValue / acronym.length) *
                                              100) /
                                          100)
                                      .toString()),
                              // center: Text(
                              //     "${double.parse((((_currentSliderValue / acronym.length) * 100) / 100).toString())}"),
                              linearStrokeCap: LinearStrokeCap.roundAll,
                              progressColor: Color(0xffCE8C8C),
                            )),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 150,
                  child: Container(
                      padding: EdgeInsets.all(10),
                      child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisExtent: 55,
                                  childAspectRatio: 2,
                                  crossAxisSpacing: 7,
                                  crossAxisCount: 4),
                          itemCount: selectedOption.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              padding: EdgeInsets.all(5),
                              margin: new EdgeInsets.symmetric(vertical: 5),
                              alignment: Alignment.center,
                              child: FittedBox(
                                child: AutoSizeText(
                                  '${selectedOption[index]}',
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0xff333333), width: 0),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8)),
                                  // color: const Color(0xfffffffffff),
                                  color: Colors.black),
                            );
                          })),
                ),
                SizedBox(
                  height: 180,
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    color: Color(0xffDADADA),
                    child: PageView(
                      onPageChanged: (int page) {
                        setState(() {
                          currentIndex = page;
                          _currentSliderValue = (currentIndex + 1);
                          _takeQuizOption(acronym[currentIndex]);
                        });
                      },
                      controller: _pageController,
                      children: <Widget>[
                        for (var i = 0; i < acronym.length; i++) ...[
                          Container(
                              margin: new EdgeInsets.symmetric(horizontal: 20),
                              width: 120,
                              child: GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        mainAxisExtent: 50,
                                        childAspectRatio: 2,
                                        mainAxisSpacing: 12,
                                        crossAxisSpacing: 7,
                                        crossAxisCount: 4),
                                itemCount: quizOption.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return InkWell(
                                    onTap: () {
                                      _getCorrectAnswer(index);
                                    },
                                    child: Container(
                                      margin:
                                          new EdgeInsets.symmetric(vertical: 5),
                                      padding: EdgeInsets.all(3),
                                      alignment: Alignment.center,
                                      width: 120,
                                      //  height: 28,
                                      child: FittedBox(
                                        child: AutoSizeText(
                                          '${quizOption[index]}',
                                          style: GoogleFonts.poppins(
                                              color: Color(0xff212121),
                                              // fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: const Color(0xff333333),
                                            width: 0),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(8)),
                                        color: const Color(0xfffffffffff),
                                      ),
                                    ),
                                  );
                                },
                              )),
                        ]
                      ],
                    ),
                  ),
                ),
                widget.isCPU
                    ? Expanded(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: InkWell(
                              onTap: () {
                                print('Clicked Here==>');
                                _checkCorrectAnswer();
                              },
                              child: Container()),
                        ),
                      )
                    : Expanded(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: InkWell(
                              onTap: () {
                                _checkCorrectAnswer();
                              },
                              child: Container(
                                margin: EdgeInsets.only(bottom: 10),
                                alignment: Alignment.center,
                                height: 50,
                                width: 300,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Color(0xffCE8C8C),
                                ),
                                //  color: Color(0xff267693),
                                child: Text(
                                  "Check",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                      color: Color(0xffffffff),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              )),
                        ),
                      ),
              ],
            ),
    );
  }
}

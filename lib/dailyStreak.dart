import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:herraf_app/calendar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DailyStreak extends StatefulWidget {
  const DailyStreak({Key? key}) : super(key: key);

  @override
  State<DailyStreak> createState() => _DailyStreakState();
}

class _DailyStreakState extends State<DailyStreak> {
  int averageSpelling = 5;
  int gametoPlay = 10;
  double spellAcronym = 1 / 8;
  double _gametoPlaySliderValue = 20;
  double _averageSpellingSliderValue = 5;
  double _spellAcronymSliderValue = 1 / 8;

  @override
  void initState() {
    super.initState();
    _loadSlider();
    _averageSpellingloadSlider();
    _spellAcronymloadSlider();
  }

  //Loading slider value on start
  void _loadSlider() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _gametoPlaySliderValue = (prefs.getDouble('slider') ?? 20);
    });
  }

  void _averageSpellingloadSlider() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _averageSpellingSliderValue = (prefs.getDouble('slider1') ?? 5);
    });
  }

  void _spellAcronymloadSlider() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _spellAcronymSliderValue = (prefs.getDouble('slider2') ?? 1 / 8);
    });
  }

  // change slider value to value
  void _changeSlider(double value) {
    setState(() {
      _gametoPlaySliderValue = value;
    });
  }

  void _averageSpellingchangeSlider(double value) {
    setState(() {
      _averageSpellingSliderValue = value;
    });
  }

  void _spellAcronymchangeSlider(double value) {
    setState(() {
      _spellAcronymSliderValue = value;
    });
  }

  // store slider value
  void _storeSlider() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setDouble('slider', _gametoPlaySliderValue);
  }

  void _averageSpellingstoreSlider() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setDouble('slider1', _averageSpellingSliderValue);
  }

  void _spellAcronymstoreSlider() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setDouble('slider2', _spellAcronymSliderValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              SizedBox(
                // height: MediaQuery.of(context).size.height * 0.30,
                width: double.infinity,
                child: Image.asset("assets/images/background-top(1).png"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          size: 24,
                          color: Color(0xff212121),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Daily streak',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff212121),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.calendar_month_outlined,
                          size: 24,
                          color: Color(0xff212121),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Calendar()));
                        },
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.share,
                          size: 24,
                          color: Color(0xff212121),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
              Positioned(
                bottom: 60,
                child: SizedBox(
                  height: 75,
                  width: 75,
                  child: Image.asset('assets/images/daily streak .png'),
                ),
              ),
              Positioned(
                  bottom: 20,
                  child: Text('25',
                      style: GoogleFonts.poppins(
                          color: Color(0xff212121),
                          fontSize: 20,
                          fontWeight: FontWeight.w500)))
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.885,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Current Streak",
                  style: GoogleFonts.poppins(
                      fontSize: 30,
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            width: MediaQuery.of(context).size.width * 0.885,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Games to play",
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Slider(
                activeColor: const Color(0xffF1F6FF),
                inactiveColor: const Color(0xffF1F6FF),
                thumbColor: const Color(0xffCE8C8C),
                autofocus: true,
                value: _gametoPlaySliderValue,
                onChanged: (double value) {
                  _changeSlider(value);
                  _storeSlider();
                },
                divisions: 2,
                min: 10,
                max: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.885,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "10",
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: const Color(0xff000000),
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "15",
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: const Color(0xff000000),
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "20",
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: const Color(0xff000000),
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            width: MediaQuery.of(context).size.width * 0.885,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Average spelling acuracy for an acronym",
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: const Color(0xff000000),
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: [
              Slider(
                activeColor: const Color(0xffF1F6FF),
                inactiveColor: const Color(0xffF1F6FF),
                thumbColor: const Color(0xffCE8C8C),
                value: _averageSpellingSliderValue,
                onChanged: (double value) {
                  _averageSpellingchangeSlider(value);
                  _averageSpellingstoreSlider();
                },
                divisions: 2,
                min: 5,
                max: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.885,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "50%",
                      style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: const Color(0xff000000),
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "75%",
                      style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: const Color(0xff000000),
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "100%",
                      style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: const Color(0xff000000),
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            width: MediaQuery.of(context).size.width * 0.885,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Spell acronym/accept penalty ratio",
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Slider(
                activeColor: const Color(0xffF1F6FF),
                inactiveColor: const Color(0xffF1F6FF),
                thumbColor: const Color(0xffCE8C8C),
                autofocus: true,
                value: _spellAcronymSliderValue,
                onChanged: (double value) {
                  _spellAcronymchangeSlider(value);
                  _spellAcronymstoreSlider();
                },
                divisions: 2,
                min: 1 / 8,
                max: 1 / 2,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.885,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "0,25",
                      style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: const Color(0xff000000),
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "0,5",
                      style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: const Color(0xff000000),
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "0,75",
                      style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: const Color(0xff000000),
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          )
        ],
      )),
    );
  }
}

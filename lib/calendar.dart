import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime today = DateTime.utc(2021, 10, 12);
  void _oneDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      print(today);
      today = day;
    });
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
                          size: 22,
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
                        'Calendar view',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff212121),
                        ),
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
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.050,
          ),
          TableCalendar(
              focusedDay: DateTime.now(),
              calendarStyle: const CalendarStyle(
                rangeHighlightColor: Colors.green,
              ),
              daysOfWeekStyle: const DaysOfWeekStyle(),
              headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                  titleTextStyle: GoogleFonts.roboto(
                      color: const Color(0xff333333),
                      fontSize: 18,
                      fontWeight: FontWeight.w700)),
              availableGestures: AvailableGestures.all,
              selectedDayPredicate: (day) => isSameDay(day, today),
              onDaySelected: _oneDaySelected,
              // focusedDay: today,
              firstDay: DateTime.utc(1990, 10, 12),
              lastDay: DateTime.utc(2050, 10, 14)),
        ],
      )),
    );
  }
}

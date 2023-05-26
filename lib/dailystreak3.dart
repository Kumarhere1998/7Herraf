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
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Color(0xff0093ED),
                      size: 18,
                    )),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Calendar",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: const Color(0xff0093ED)),
                    )),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.040),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.896,
                height: MediaQuery.of(context).size.width * 0.350,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    color: Color(0xffF1F6FF)),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Daily streak",
                        style: GoogleFonts.poppins(
                            fontSize: 18,
                            color: const Color(0xff00253A),
                            fontWeight: FontWeight.w700),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              height: 70,
                              child: Image.asset("assets/images/flames 1.png")),
                          Text(
                            "25",
                            style: GoogleFonts.poppins(
                                fontSize: 24,
                                color: const Color(0xff00253A),
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      )
                    ]),
              ),
            ),
            SizedBox(
              height: 400,
              child: TableCalendar(
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
                  focusedDay: today,
                  firstDay: DateTime.utc(1990, 10, 12),
                  lastDay: DateTime.utc(2050, 10, 14)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.220,
            )
          ],
        ),
      ),
    );
  }
}

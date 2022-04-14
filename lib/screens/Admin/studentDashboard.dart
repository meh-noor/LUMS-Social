import 'dart:html';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:lums_social_app2/services/auth.dart';
import 'package:lums_social_app2/widget/button_widget.dart';
import 'package:lums_social_app2/screens/Admin/addEvent.dart';

class student extends StatefulWidget {
  @override
  State<student> createState() => _studentState();
}

class _studentState extends State<student> {
  late final ValueNotifier<List<Event>> _selectedEvents;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  // CalendarController _calendarController = CalendarController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: Column(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 30.0, bottom: 10.0, top: 40.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: mainText(),
                )),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 15.0, bottom: 10.0, top: 10.0),
              child: greetingRow(),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment(-0.72, -0.1),
              child: addedEvents(),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 15.0, bottom: 10.0, top: 10.0),
              child: viewCalender(),
            ),
            // addedEvents(),
          ],
        ));
  }

  Widget mainText() => RichText(
          text: TextSpan(
              text: ' LUMS ',
              style: TextStyle(
                // alignment: Alignment(-0.85, -0.85),
                fontFamily: 'Poppins',
                color: Color(0xFF050A30),
                fontSize: 25,
              ),
              children: [
            TextSpan(
              text: ' SOCIAL ',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Color(0xFF5DCAD1),
                fontSize: 25,
              ),
              // child: Align(
              //   alignment: Alignment(-0.85, -0.85),
            )
          ]));

  Widget greetingRow() => Row(
        children: [
          Icon(Icons.account_circle_rounded,
              size: 33, color: Color(0xFF050A30)),
          Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                'Hello',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.black,
                  fontSize: 25,
                  // padding: const EdgeInsets.all(15.0),
                ),
              )),
        ],
      );

  Widget addedEvents() => Text(
        'Events you have added',
        style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.black,
            fontSize: 21,
            fontWeight: FontWeight.w500
            // padding: const EdgeInsets.all(15.0),
            ),
      );

// Widget listEvents(context) => Container(
//       padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
//       height: MediaQuery.of(context).size.height * 0.35,
//       child: ListView.builder(
//           scrollDirection: Axis.horizontal,
//           itemCount: numbers.length,
//           itemBuilder: (context, index) {
//             return Container(
//               width: MediaQuery.of(context).size.width * 0.6,
//               child: Card(
//                 color: Colors.blue,
//                 child: Container(
//                   child: Center(
//                       child: Text(
//                     numbers[index].toString(),
//                     style: TextStyle(color: Colors.white, fontSize: 36.0),
//                   )),
//                 ),
//               ),
//             );
//           }),
//     );

  Widget viewCalender() => Card(
      clipBehavior: Clip.antiAlias,
      shadowColor: Colors.grey,
      child: TableCalendar(
        firstDay: DateTime.utc(2022, 4, 12),
        lastDay: DateTime.utc(2040, 3, 14),
        focusedDay: DateTime.now(),
        calendarFormat: CalendarFormat.month,
        selectedDayPredicate: (day) {
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay; // update `_focusedDay` here as well
          });
        },
        headerStyle: HeaderStyle(
            decoration: BoxDecoration(
              color: Color(0xFF5DCAD1),
            ),
            headerMargin: EdgeInsets.only(bottom: 8.0),
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            formatButtonDecoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
            formatButtonTextStyle: TextStyle(
              color: Color(0xFF050A30),
            ),
            leftChevronIcon: Icon(Icons.chevron_left, color: Colors.white),
            rightChevronIcon: Icon(Icons.chevron_right, color: Colors.white)),

        // CALENDER STYLE EDITOR
        calendarStyle: CalendarStyle(
          selectedDecoration:
              BoxDecoration(color: Color(0xFF5DCAD1), shape: BoxShape.circle),
          todayTextStyle: TextStyle(
            color: Colors.black,
          ),
          todayDecoration: BoxDecoration(
              color: Color.fromARGB(255, 204, 230, 252),
              shape: BoxShape.circle),
        ),

        // CALENDER BUILDER
        calendarBuilders: CalendarBuilders(),
      ));
}

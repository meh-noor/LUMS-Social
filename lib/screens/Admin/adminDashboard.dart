import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lums_social_app2/models/user.dart';
import 'package:lums_social_app2/screens/auth/sign_in.dart';
import 'package:lums_social_app2/splash.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:lums_social_app2/screens/Admin/addEvent.dart';

import '../../services/auth.dart';

class admin extends StatefulWidget {
  @override
  State<admin> createState() => _adminState();
}

class _adminState extends State<admin> {
  final AuthService _auth = AuthService();
  List<Map<String, dynamic>> allData = [];

  // late final ValueNotifier<List<Event>> _selectedEvents;
  // late Map<DateTime, List<Event>> selectedEvents;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  CalendarFormat format = CalendarFormat.month;
  List numbers = [1, 2, 3, 4, 5];

  // List<Event> _getEventsforDay(DateTime date) {
  //   return selectedEvents[date] ?? [];
  // }

  // CalendarController _calendarController = CalendarController();
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser?>(context);
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            SignOut(),
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
              child: greetingRow(user),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment(-0.72, -0.1),
              child: addedEvents(),
            ),
            listEvents(context, user),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 15.0, bottom: 10.0, top: 10.0),
              child: addButton(context),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 15.0, bottom: 10.0, top: 10.0),
              child: viewCalender(),
            ),
            // addedEvents(),
            // Text(getData(user?.uid).toString()),
          ],
        )));
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
              text: 'SOCIAL',
              style: TextStyle(
                // alignment: Alignment(-0.85, -0.85),
                fontFamily: 'Poppins',
                color: Color(0xFF5DCAD1),
                fontSize: 25,
              ),
            )
          ]));

  Widget greetingRow(user) => Row(
        children: [
          Icon(Icons.account_circle_rounded,
              size: 33, color: Color(0xFF050A30)),
          Padding(
            padding: EdgeInsets.all(5.0),
            child: FutureBuilder(
              builder: (context, snapshot) {
                if (snapshot.data != null) {
                  return Text(
                    "Hello " + snapshot.data.toString(),
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.black,
                      fontSize: 25,
                      // padding: const EdgeInsets.all(15.0),
                    ),
                  );
                } else {
                  return Text('Loading');
                }
              },
              future: getDataName(user?.uid, "name"),
            ),
            // Text(
            //   'Hello',
            //   style: TextStyle(
            //     fontFamily: 'Poppins',
            //     color: Colors.black,
            //     fontSize: 25,
            //     // padding: const EdgeInsets.all(15.0),
            //   ),
            // )
          ),
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

  Widget listEvents(context, user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        // height: MediaQuery.of(context).size.height * 0.35,
        height: 150,
        child: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return Container(
                // margin: EdgeInsets.all(50.0),
                child: Image(
                  image: AssetImage('images/finallogo.png'),
                  // fit: BoxFit.cover,
                  width: 450,
                  height: 400,
                ),
              );
              ;
            }
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: allData.length,
                itemBuilder: (context, index) {
                  return Container(
                    // width: MediaQuery.of(context).size.width * 0.6,
                    width: 200,
                    child: Card(
                      color: Color(0xFFF2F1F0),
                      child: TextButton(
                        onPressed: () => {},
                        child: Column(children: [
                          Center(
                              child: Text(
                            allData[index]['title'],
                            style:
                                TextStyle(color: Colors.black, fontSize: 20.0),
                          )),
                          Center(
                              child: Text(
                            allData[index]['start_date']
                                .toDate()
                                .toString()
                                .substring(0, 10),
                            style:
                                TextStyle(color: Colors.black, fontSize: 20.0),
                          ))
                        ]),
                      ),
                    ),
                  );
                });
          },
          future: getData(user?.uid),
        ),
      );

  Widget addButton(context) => Row(
        children: [
          Container(
              height: 30.0,
              width: 30.0,
              child: FloatingActionButton(
                  elevation: 2,
                  backgroundColor: Color(0xFF050A30),
                  child: Icon(Icons.add),
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddEvent()),
                    );
                  })),
          Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                '   Add new event',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.black,
                  fontSize: 20,
                  // padding: const EdgeInsets.all(15.0),
                ),
              )),
        ],
      );

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

        onFormatChanged: (CalendarFormat _format) {
          setState(() {
            format = _format;
          });
        },

        headerStyle: HeaderStyle(
            titleCentered: true,
            formatButtonVisible: false,
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
            formatButtonTextStyle: const TextStyle(
              color: Color(0xFF050A30),
            ),
            leftChevronIcon: Icon(Icons.chevron_left, color: Colors.white),
            rightChevronIcon: Icon(Icons.chevron_right, color: Colors.white)),

        // eventLoader: _getEventsforDay,
        // CALENDER STYLE EDITOR
        calendarStyle: const CalendarStyle(
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

  Future<String> getDataName(String? uid, String dataType) async {
    // Get docs from collection reference
    DocumentSnapshot<Map<String, dynamic>> mySnapshot;
    mySnapshot =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    // DocumentSnapshot querySnapshot = await eventCollection.doc(uid).get();
    // print(querySnapshot.get('title'));
    // Get data from docs and convert map to List
    // final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    return mySnapshot.data()?[dataType];

    // return ret;
  }

  Widget SignOut() => TextButton.icon(
      onPressed: () async {
        await _auth.signOut();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignIn()));
      },
      icon: const Icon(Icons.person),
      label: const Text('Logout'));

  Future<bool?> getData(String? uid) async {
    // Get docs from collection reference
    QuerySnapshot<Map<String, dynamic>> mySnapshot;
    mySnapshot = await FirebaseFirestore.instance
        .collection('adminEvents')
        .doc(uid)
        .collection('Events')
        .get();

    print('mera data');
    print(uid);
    allData = mySnapshot.docs.map((doc) => doc.data()).toList();

    // print(allData);
    return true;
  }
}

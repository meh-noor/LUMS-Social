import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
<<<<<<< HEAD
import 'package:lums_social_app2/services/addToCollection.dart';
=======
=======
import 'package:lums_social_app2/screens/Admin/editEvent.dart';
>>>>>>> 1d1767ae1b7824963a5000cdcdf2c4f1f3e6925b
import 'package:lums_social_app2/screens/auth/sign_in.dart';
import 'package:lums_social_app2/screens/news/viewDayEvent.dart';
import 'package:lums_social_app2/screens/settings/editmainProfile.dart';
import 'package:provider/provider.dart';
>>>>>>> 3ad9417b04703d4e7344cc9e0f4338b014093e7b
import 'package:table_calendar/table_calendar.dart';
import 'package:lums_social_app2/services/auth.dart';
import 'package:lums_social_app2/widget/button_widget.dart';
import 'package:lums_social_app2/screens/Admin/addEvent.dart';
import 'package:lums_social_app2/screens/news/newsStudent.dart';

import '../../models/user.dart';
import '../auth/forget_password.dart';

class student extends StatefulWidget {
  @override
  State<student> createState() => _studentState();
}

class _studentState extends State<student> {
  final AuthService _auth = AuthService();
  List<Map<String, dynamic>> allData = [];
  List<Map<String, dynamic>> newsData = [];
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  CalendarFormat format = CalendarFormat.month;

  final List colors = [
    const Color(0xffDDFFE7),
    const Color(0xff98D7C2),
    const Color(0xffc8e1cc),
    const Color(0xffe0f0e3),
    const Color(0xffABC7A2)
  ];

  final List colorsB = [
    const Color(0xffa4dded),
    const Color(0xffa7d8de),
    const Color(0xffb0e0e6),
    const Color(0xfface5ee),
    const Color(0xffc9e5ee),
  ];

  final _random = Random();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser?>(context);
    return Scaffold(
        drawer: SideMenu(),
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
            const SizedBox(height: 10),
            Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 15.0, bottom: 10.0),
              child: greetingRow(user),
            ),
            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 15.0, bottom: 10.0, top: 10.0),
              child: viewCalender(),
            ),
            Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(
                      right: 15.0, bottom: 10.0, top: 30.0),
                  child: viewNews(),
                )),
            // addedEvents(),
          ],
        ));
  }

  Widget mainText() => Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text: new TextSpan(
                // Note: Styles for TextSpans must be explicitly defined.
                // Child text spans will inherit styles from parent
                style: new TextStyle(
                  fontSize: 25.0,
                  color: Colors.black,
                  fontFamily: 'poppins',
                  //  fontWeight: FontWeight.bold,
                ),
                children: <TextSpan>[
                  new TextSpan(
                      text: 'LUMS',
                      style: new TextStyle(fontWeight: FontWeight.w500)),
                  new TextSpan(text: " "),
                  new TextSpan(
                      text: 'SOCIAL',
                      style: new TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF5DCAD1))),
                ],
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.fromLTRB(140, 5, 0, 10),
            //   // child: SignOut(),
            // )
            // SignOut(),
          ]);


  Widget SideMenu() => 
  Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              '     \n\nAccount Settings',
              
              style: TextStyle(color: Colors.white, fontSize: 30,fontWeight: FontWeight.bold),
            ),
            decoration: BoxDecoration(
                color: Color(0xFF5DCAD1),
                // image: DecorationImage(
                //     fit: BoxFit.fill,
                //     image: Icon()

                //     )
                    ),
          ),
          ListTile(
            title: Text('\n'),
          ),
           ListTile(
            leading: Icon(Icons.edit, size: 40, color: Colors.black87,),
            title: Text('Edit Profile', style: TextStyle(fontSize: 20),),
            onTap: () async {
        await _auth.signOut();
              Navigator.push(
            context, MaterialPageRoute(builder: (context) => EditProfile()));
            },
          ),
          ListTile(
            title: Text('\n'),
          ),
         
          ListTile(
            leading: Icon(Icons.change_circle,size: 40, color: Colors.black87,),
            title: Text('Change Password', style: TextStyle(fontSize: 20),),
            onTap: () async {
        await _auth.signOut();
              Navigator.push(
            context, MaterialPageRoute(builder: (context) => ForgotPassword()));
            },
          ),
          ListTile(
            title: Text('\n'),
          ),
           ListTile(
            leading: Icon(Icons.logout,size: 40, color: Colors.black,),
            title: Text('Logout', style: TextStyle(fontSize: 20),),
            
            onTap: () async {
        await _auth.signOut();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignIn()));
      },
          ),
          
         
          // ListTile(
          //   leading: Icon(Icons.settings),
          //   title: Text('Settings'),
          //   // onTap: () => {Navigator.of(context).pop()},
          // ),
          // ListTile(
          //   leading: Icon(Icons.border_color),
          //   title: Text('Feedback'),
          //   // onTap: () => {Navigator.of(context).pop()},
          // ),
          // ListTile(
          //   leading: Icon(Icons.exit_to_app),
          //   title: Text('Logout'),
          //   // onTap: () => {Navigator.of(context).pop()},
          // ),
        ],
      ),
    );

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
                    "Hello " + snapshot.data.toString().toUpperCase() + "!",
                    style: new TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                      // padding: const EdgeInsets.all(15.0),
                    ),
                  );
                } else {
                  return Text('Loading');
                }
              },
              future: getDataName(user?.uid, "name"),
            ),
          ),
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
            _focusedDay = focusedDay;
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        DayEvent())); // update `_focusedDay` here as well
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

  Widget viewNews() => Container(
      height: 70.0,
      width: 70.0,
      child: FloatingActionButton(
          elevation: 2,
          backgroundColor: Color(0xFF050A30),
          child: Icon(Icons.newspaper, size: 40),
          onPressed: () async {
<<<<<<< HEAD
            print("here");
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NewsStudent()),
            );
=======
            getAllAdminsEvents(); // tester function
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => NewsStudent()),
            // );
>>>>>>> 1d1767ae1b7824963a5000cdcdf2c4f1f3e6925b
          }));

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

  Widget SignOut() => IconButton(
      onPressed: () async {
        await _auth.signOut();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignIn()));
      },
      icon: const Icon(Icons.logout_rounded));

  Future<List<Map<String, dynamic>>> getAdminIDs() async {
    // QuerySnapshot<Map<String, dynamic>> mySnap;
    QuerySnapshot<Map<String, dynamic>> snapshotAdminIDs =
        await FirebaseFirestore.instance.collection('adminIDs').get();

    List<Map<String, dynamic>> allAdminIDs =
        snapshotAdminIDs.docs.map((doc) => doc.data()).toList();

    return allAdminIDs;
  }

  Future<List<List<Map<String, dynamic>>>> getAllAdminsEvents() async {
    List<Map<String, dynamic>> adminIDs = await getAdminIDs();
    // print(adminIDs);
    List<List<Map<String, dynamic>>> storeAllData = [];

    for (var i = 0; i < adminIDs.length; i++) {
      QuerySnapshot<Map<String, dynamic>> snapshotAdminIDs =
          await FirebaseFirestore.instance
              .collection('adminEvents')
              .doc(adminIDs[i]['id'].toString())
              .collection('Events')
              .get();
      List<Map<String, dynamic>> oneAdminsDataList =
          snapshotAdminIDs.docs.map((doc) => doc.data()).toList();

      storeAllData.add(oneAdminsDataList);
    }

    // print(storeAllData[][]);

    // List<Map<String, dynamic>> allAdminIDs =
    //     snapshotAdminIDs.docs.map((doc) => doc.data()).toList();

    return storeAllData;
  }
}

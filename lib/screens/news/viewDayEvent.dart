import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:lums_social_app2/models/user.dart';
import 'package:lums_social_app2/screens/Admin/GetDataForEdit.dart';
import 'package:lums_social_app2/services/auth.dart';
import 'package:provider/provider.dart';

class DayEvent extends StatefulWidget {
  const DayEvent({Key? key}) : super(key: key);

  @override
  State<DayEvent> createState() => _DayEventState();
}

class _DayEventState extends State<DayEvent> {
  final AuthService _auth = AuthService();
  List<Map<String, dynamic>> allData = [];
  final List colors = [
    const Color(0xffFB6F92).withOpacity(0.7),
    const Color(0xffB594CA).withOpacity(0.7),
    const Color(0xff85E281).withOpacity(0.7),
    const Color(0xffFFFF01).withOpacity(0.7),
    const Color(0xffABC7A2).withOpacity(0.7)
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
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/newsBG.png'), fit: BoxFit.cover)),
        child: Scaffold(
            backgroundColor: Colors.transparent,

            // body: Align
            // (
            //   alignment: const Alignment(0.2, -0.7),
            //   child: Form
            //   (
            body: ListView(children: <Widget>[
              FormBuilder(
                  child: SingleChildScrollView(
                      padding: const EdgeInsets.all(16),
                      child: AutofillGroup(
                          child: Column(
                        children: [
                          title(),
                          subtitle(),
                          listEvents(context, user)
                        ],
                      ))))
            ])));
  }

  DropdownMenuItem<String> buildMenu(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: const TextStyle(fontSize: 16),
      ));

  Widget title() => Container(
      //alignment: Alignment.topCenter,
      padding: const EdgeInsets.fromLTRB(60, 50, 60, 10),
      child: const Text(
        "View Events",
        style: TextStyle(
            fontSize: 30,
            color: Color(0xFF0e1337),
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500),
      ));

  Widget subtitle() => Container(
      //alignment: Alignment.topCenter,
      padding: const EdgeInsets.fromLTRB(60, 0, 60, 10),
      child: const Text(
        "Discover events now",
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 14,
            color: Color(0xFF4d4b4b),
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500),
      ));

  Widget listEvents(context, user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        height: 150,
        child: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: const Image(
                  image: AssetImage('images/finallogo.png'),
                  // fit: BoxFit.cover,
                  width: 450,
                  height: 400,
                ),
              );
            }
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: allData.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 240,
                    height: 200,
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),

                      shadowColor: Colors.grey.withOpacity(1),

                      // color: Color(0xFFFBF6F0),
                      color: colors[_random.nextInt(4)],

                      child: Container(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    String eventID = allData[index]['eventID'];
                                    // print(eventID);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => GetDataForView(
                                                eventID: eventID,
                                              )),
                                    );
                                  },
                                  child: Column(
                                    children: [
                                      Text(
                                        allData[index]['title'].toString(),
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Text(
                                        allData[index]['start_date']
                                            .toDate()
                                            .toString()
                                            .substring(0, 10),
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.0),
                                      ),
                                    ],
                                  )),
                            ]),
                      ),
                    ),
                  );
                });
          },
          future: getData(user?.uid),
        ),
      );

  Future<bool?> getData(String? uid) async {
    // Get docs from collection reference
    QuerySnapshot<Map<String, dynamic>> mySnapshot;
    mySnapshot = await FirebaseFirestore.instance
        .collection('adminEvents')
        .doc(uid)
        .collection('Events')
        .get();
    allData = mySnapshot.docs.map((doc) => doc.data()).toList();
    return true;
  }
}

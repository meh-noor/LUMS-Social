import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:lums_social_app2/models/user.dart';
import 'package:lums_social_app2/screens/Admin/GetDataForEdit.dart';
import 'package:lums_social_app2/screens/Admin/viewEventAdmin.dart';
import 'package:lums_social_app2/screens/Student/viewEventUser.dart';
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
                          const SizedBox(
                            height: 60,
                          ),
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
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
        height: MediaQuery.of(context).size.height,
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
                scrollDirection: Axis.vertical,
                itemCount: allData.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 240,
                    height: 100,
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
                                          builder: (context) => viewEventUser(
                                              title: allData[index]['title'],
                                              loc: allData[index]['location'],
                                              description: allData[index]
                                                  ['description'],
                                              organiser: allData[index]
                                                  ['organiser'],
                                              start_date: allData[index]
                                                      ['start_date']
                                                  .toDate(),
                                              start_time: allData[index]
                                                      ['start_time']
                                                  .toDate(),
                                              event_type: allData[index]
                                                  ['event_type'],
                                              eventID: allData[index]
                                                  ['eventID'],
                                              imageURL: allData[index]
                                                  ['imageURL'])),
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
          future: getAllAdminsEvents(),
        ),
      );

  Future<List<Map<String, dynamic>>> getAdminIDs() async {
    // QuerySnapshot<Map<String, dynamic>> mySnap;
    QuerySnapshot<Map<String, dynamic>> snapshotAdminIDs =
        await FirebaseFirestore.instance.collection('adminIDs').get();

    List<Map<String, dynamic>> allAdminIDs =
        snapshotAdminIDs.docs.map((doc) => doc.data()).toList();

    return allAdminIDs;
  }

  Future<bool?> getAllAdminsEvents() async {
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

    List<Map<String, dynamic>> allTheData = [];

    for (var i = 0; i < storeAllData.length; i++) {
      storeAllData[i].forEach((element) {
        allTheData.add(element);
      });
    }

    // print(storeAllData[][]);

    // List<Map<String, dynamic>> allAdminIDs =
    //     snapshotAdminIDs.docs.map((doc) => doc.data()).toList();

    allData = allTheData;

    // return storeAllData;
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
}

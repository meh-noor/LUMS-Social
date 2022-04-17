import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lums_social_app2/models/user.dart';
import 'package:lums_social_app2/screens/Student/viewNewsUser.dart';
import 'package:lums_social_app2/services/auth.dart';
import 'package:provider/provider.dart';

class NewsStudent extends StatefulWidget {
  @override
  State<NewsStudent> createState() => _NewsStudentState();
}

class _NewsStudentState extends State<NewsStudent> {
  List<Map<String, dynamic>> allData = [];
  final AuthService _auth = AuthService();
  final List colors = [
    const Color(0xff00e9d8),
    const Color(0xff00d3e0),
    const Color(0xff00bde8),
    const Color(0xff00a7ef),
    const Color(0xff0091f7)
  ];
  final List colorsB = [
    const Color(0xff00e9d8),
    const Color(0xff00d3e0),
    const Color(0xff00bde8),
    const Color(0xff00a7ef),
    const Color(0xff0091f7)
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
            body: Align(
                alignment: const Alignment(0.2, -0.7),
                child: Form(
                    child: SingleChildScrollView(
                        padding: const EdgeInsets.all(16),
                        child: AutofillGroup(
                            child: Column(
                          children: [
                            title(),
                            subtitle(),
                            // box(context, _random, colors, colorsB),
                            // box(context, _random, colors, colorsB),
                            const SizedBox(
                              height: 90,
                            ),
                            box(context, user),
                            //text()
                          ],
                        )))))));
  }

  Widget title() => Container(
      //alignment: Alignment.topCenter,
      padding: const EdgeInsets.fromLTRB(60, 20, 60, 10),
      child: const Text(
        "Weekly News",
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
        "Discover the lastest news",
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 14,
            color: Color(0xFF4d4b4b),
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500),
      ));

  Widget box(context, user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
        height: MediaQuery.of(context).size.height,
        child: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: Image(
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
                                    // String newsID = allData[index]['newsID'];
                                    // print(eventID);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => viewNewsUser(
                                                headline: allData[index]
                                                    ['headline'],
                                                news_author: allData[index]
                                                    ['news_author'],
                                                description: allData[index]
                                                    ['description'],
                                                newsID: allData[index]
                                                    ['newsID'],
                                                imageURL: allData[index]
                                                    ['imageURL'])));
                                  },
                                  child: Column(
                                    children: [
                                      Text(
                                        allData[index]['headline'].toString(),
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Text(
                                        allData[index]['start_date']
                                            .toDate()
                                            .toString()
                                            .substring(0, 10),
                                        style: TextStyle(
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
          future: getAllAdminsNews(),
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

  Future<bool?> getAllAdminsNews() async {
    List<Map<String, dynamic>> adminIDs = await getAdminIDs();
    // print(adminIDs);
    List<List<Map<String, dynamic>>> storeAllData = [];

    for (var i = 0; i < adminIDs.length; i++) {
      QuerySnapshot<Map<String, dynamic>> snapshotAdminIDs =
          await FirebaseFirestore.instance
              .collection('adminEvents')
              .doc(adminIDs[i]['id'].toString())
              .collection('News')
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

    // print(allData[0]['headline']);

    // return storeAllData;
    return true;
  }
}

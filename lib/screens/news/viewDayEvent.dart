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
<<<<<<< HEAD
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

=======
    final user = Provider.of<MyUser?>(context);
>>>>>>> 3ad9417b04703d4e7344cc9e0f4338b014093e7b
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
<<<<<<< HEAD
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
                            child: box(context, _random, colors, colorsB),
                          ),
                          //box(context, _random, colors, colorsB),
                          //box(context, _random, colors, colorsB),
                          //text()
                        ],
                      ))))
            ])));
  }
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

Widget box(context, _random, colors, colorsB) => Container(
    padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
    child: Container(
      width: 350,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Color(0x3f000000),
            blurRadius: 2,
            offset: Offset(0, 4),
          ),
        ],
        color: colors[_random.nextInt(5)],
        //color: const Color(0xFFFBF6F0),
      ),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.only(left: 8, right: 3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  // **************************** FETCH TITLE ***********************
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Text(
                      '“Diplomatic Footprints” Book Launch',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  // **************************** FETCH Date ***********************
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Text(
                      '2022-04-10',
                      //maxLines: 2,
                      //overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        fontSize: 11,
                      ),
                    ),
                  ),

                  // **************************** FETCH Time ***********************
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: Text(
                      '9:00 PM',
                      //maxLines: 2,
                      //overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        fontSize: 11,
                      ),
                    ),
                  ),
                  // **************************** FETCH Location ***********************
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: Text(
                      'SAHSOL SABCR 0-01',
                      //maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        fontSize: 11,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: IconButton(
                onPressed: () {
                  // var async;
                  // async;
                  // {
                  //   Navigator.push(context, MaterialPageRoute(builder: (context) => const EditYear()),);
                  // }
                },
                icon: const Icon(
                  Icons.navigate_next,
                  size: 30,
                  color: Colors.black,
                ),
              ))
        ],
      ),
    ));
=======
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
                child: Image(
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
          future: getData(user?.uid),
        ),
      );

  Future<bool?> getData(String? uid) async {
    print('USER IDDDDD');
    print(uid);
    // Get docs from collection reference
    QuerySnapshot<Map<String, dynamic>> mySnapshot;
    mySnapshot = await FirebaseFirestore.instance
        .collection('adminEvents')
        .doc(uid)
        .collection('Events')
        .get();
    allData = mySnapshot.docs.map((doc) => doc.data()).toList();
    print("HELLOOOOO");
    print(allData);
    return true;
  }
}
>>>>>>> 3ad9417b04703d4e7344cc9e0f4338b014093e7b

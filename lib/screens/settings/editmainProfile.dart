import 'package:flutter/material.dart';
import 'package:lums_social_app2/services/auth.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:lums_social_app2/screens/settings/editNameS.dart';
import 'package:lums_social_app2/screens/settings/editSchoolS.dart';
import 'package:lums_social_app2/screens/settings/editMajorS.dart';
import 'package:lums_social_app2/screens/settings/editYearS.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:lums_social_app2/models/user.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final AuthService _auth = AuthService();
  String name = "";

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
            body: ListView(children: <Widget>[
              FormBuilder(
                  child: SingleChildScrollView(
                      child: Column(
                children: [
                  title(),
                  instructions(),
                  space(),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(40, 10, 0, 35),
                      child: editName(context, user)),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(40, 0, 0, 35),
                      child: displayEmail()),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(40, 0, 0, 35),
                      child: editSchool(context)),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(40, 0, 0, 35),
                      child: editMajor(context)),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                      child: editYear(context)),
                ],
              )))
            ])));
  }

  Widget space() =>
      Container(padding: const EdgeInsets.fromLTRB(15, 15, 15, 10));

  Widget title() => Container(
      //alignment: Alignment.topCenter,
      padding: const EdgeInsets.fromLTRB(60, 70, 60, 0),
      child: const Text(
        "Edit Profile",
        style: TextStyle(
            fontSize: 30,
            color: Color(0xFF0e1337),
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500),
      ));

  Widget instructions() => Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.fromLTRB(30, 120, 10, 10),
      child: const Text(
        "Account Info",
        style:
            TextStyle(fontSize: 20, color: Colors.black, fontFamily: 'Poppins'),
      ));

  Widget editName(context, user) => Row(
        //mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const Icon(Icons.person, size: 50, color: Color(0xFF050A30)),
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.only(left: 8, right: 3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Name:',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  // **************************** FETCH NAME ***********************
                  FutureBuilder(
                    builder: (context, snapshot) {
                      if (snapshot.data != null) {
                        name = snapshot.data.toString();
                        return Text(
                          snapshot.data.toString(),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Color(0xFFA19F9F),
                            fontSize: 18,
                          ),
                        );
                      } else {
                        return Text('Loading');
                      }
                    },
                    future: getDataName(user?.uid),
                  ),
                ],
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 40, 0),
              child: IconButton(
                onPressed: () {
                  var async;
                  async;
                  {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EditName(name)),
                    );
                  }
                },
                //Navigator.push(context, MaterialPageRoute(builder: (context) => const EditName()),); },
                icon: const Icon(
                  Icons.navigate_next,
                  size: 40,
                  color: Colors.black,
                ),
              ))
        ],
      );

  Widget displayEmail() => Row(
        //mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const Icon(Icons.email_outlined, size: 50, color: Color(0xFF050A30)),
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.only(left: 8, right: 3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Text(
                    'Email:',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  // **************************** FETCH EMAIL ***********************
                  Text(
                    '23100275@lums.edu.pk',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Color(0xFFA19F9F),
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );

  Widget editSchool(context) => Row(
        //mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const Icon(Icons.school_rounded, size: 50, color: Color(0xFF050A30)),
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.only(left: 8, right: 3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Text(
                    'School:',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  // **************************** FETCH SCHOOL ***********************
                  Text(
                    'SSE',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Color(0xFFA19F9F),
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 40, 0),
              child: IconButton(
                onPressed: () {
                  var async;
                  async;
                  {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EditSchool()),
                    );
                  }
                },
                icon: const Icon(
                  Icons.navigate_next,
                  size: 40,
                  color: Colors.black,
                ),
              ))
        ],
      );

  Widget editMajor(context) => Row(
        //mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const Icon(Icons.book, size: 50, color: Color(0xFF050A30)),
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.only(left: 8, right: 3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Text(
                    'Major:',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  // **************************** FETCH MAJOR ***********************
                  Text(
                    'Computer Science',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Color(0xFFA19F9F),
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 40, 0),
              child: IconButton(
                onPressed: () {
                  var async;
                  async;
                  {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EditMajor()),
                    );
                  }
                },
                icon: const Icon(
                  Icons.navigate_next,
                  size: 40,
                  color: Colors.black,
                ),
              ))
        ],
      );

  Widget editYear(context) => Row(
        //mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const Icon(Icons.calendar_today, size: 50, color: Color(0xFF050A30)),
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.only(left: 8, right: 3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Text(
                    'Graduating Year:',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  // **************************** FETCH YEAR ***********************
                  Text(
                    '2023',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Color(0xFFA19F9F),
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 40, 0),
              child: IconButton(
                onPressed: () {
                  var async;
                  async;
                  {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const EditYear()),
                    );
                  }
                },
                icon: const Icon(
                  Icons.navigate_next,
                  size: 40,
                  color: Colors.black,
                ),
              ))
        ],
      );

  Future<String> getDataName(String? uid) async {
    // Get docs from collection reference
    List ret = [];
    DocumentSnapshot<Map<String, dynamic>> mySnapshot;
    mySnapshot =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    // DocumentSnapshot querySnapshot = await eventCollection.doc(uid).get();
    // print(querySnapshot.get('title'));
    // Get data from docs and convert map to List
    // final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    return mySnapshot.data()?['name'];

    // return ret;
  }
}

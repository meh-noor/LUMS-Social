import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lums_social_app2/models/user.dart';
import 'package:lums_social_app2/screens/auth/authenticate.dart';
import 'package:lums_social_app2/screens/auth/registerUserDetails.dart';
import 'package:lums_social_app2/screens/auth/sign_in.dart';
import 'package:lums_social_app2/screens/home/home.dart';
import 'package:provider/provider.dart';
import 'package:lums_social_app2/screens/Admin/adminDashboard.dart';

class Wrapper extends StatelessWidget {
  Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser?>(context);

    print('now print use');
    print(user);
    // // return either Home or Authenticate Widget
    // bool temp = true;
    if (user == null) {
      return SignIn();
    } else {
      return FutureBuilder(
        builder: ((context, snapshot) {
          if (snapshot.data == true) {
            return admin();
          } else if (snapshot.data == false) {
            return Home();
          } else {
            return splashScreen();
          }
        }),
        future: getData(user.uid),
      );
    }
  }

  // getDocs(){}

  Future<bool?> getData(uid) async {
    // print(uid);

    DocumentSnapshot<Map<String, dynamic>> x1;
    x1 = await FirebaseFirestore.instance.collection('users').doc(uid).get();

    return x1.data()?['isAdmin'];
  }

  Widget splashScreen() => Scaffold(
        backgroundColor: const Color(0xFF050A30),
        body: Center(
            child: Form(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: AutofillGroup(
              child: Column(
                children: [
                  IconWidget(),
                  const SizedBox(height: 150),
                  // TextWidget(),
                  const CircularProgressIndicator()
                ],
              ),
            ),
          ),
        )),
      );

  Widget TextWidget() => new RichText(
        text: new TextSpan(
          // Note: Styles for TextSpans must be explicitly defined.
          // Child text spans will inherit styles from parent
          style: new TextStyle(
            fontSize: 25.0,
            color: Colors.white,
            fontFamily: 'poppins',
            //  fontWeight: FontWeight.bold,
          ),
          children: <TextSpan>[
            new TextSpan(text: 'LUMS'),
            new TextSpan(text: " "),
            new TextSpan(
                text: 'SOCIAL', style: new TextStyle(color: Color(0xFF5DCAD1))),
          ],
        ),
      );

  // Widget circleLoader()
  // );

  Widget IconWidget() => Container(
        // margin: EdgeInsets.all(50.0),
        child: Image(
          image: AssetImage('images/finallogo.png'),
          // fit: BoxFit.cover,
          width: 450,
          height: 400,
        ),
      );
}

import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lums_social_app2/models/user.dart';
import 'package:lums_social_app2/screens/auth/authenticate.dart';
import 'package:lums_social_app2/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser?>(context);

    // print('now print use');
    // // print(user!.uid);
    // // return either Home or Authenticate Widget
    // bool temp = true;
    if (user == null) {
      return Authenticate();
    } else {
      return FutureBuilder(
        builder: ((context, snapshot) {
          if (snapshot.data == true) {
            return Text('You are an Admin');
          } else if (snapshot.data == false) {
            return Home();
          } else {
            return Text('LMAO WAIT KRO LOSER');
          }
        }),
        future: getData(user.uid),
      );
    }
  }

  // getDocs(){}

  Future<bool> getData(uid) async {
    // print(uid);

    DocumentSnapshot<Map<String, dynamic>> x1;
    x1 = await FirebaseFirestore.instance.collection('users').doc(uid).get();

    return x1.data()?['isAdmin'];
    // // Get docs from collection reference
    // QuerySnapshot querySnapshot = await _collectionRef.get();

    // // Get data from docs and convert map to List
    // final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

    // print(allData);
  }
}

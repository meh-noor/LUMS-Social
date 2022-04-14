import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class addCollection {
  final CollectionReference eventCollection =
      FirebaseFirestore.instance.collection("Events");

  Future<void> addEventtoDatabase(
      String? title,
      String? organiser,
      String? loc,
      String? description,
      DateTime? start_date,
      DateTime? start_time,
      // String? image,
      String? event_type,
      String uid) {
    print("done");
    return eventCollection.doc(uid).set({
      'title': title,
      'Organiser': organiser,
      'location': loc,
      'description': description,
      'start_date': start_date,
      'start_time': start_time,
      'event_type': event_type
    });
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getData(String uid) async {
    // Get docs from collection reference
    List ret = [];
    DocumentSnapshot<Map<String, dynamic>> mySnapshot;
    mySnapshot =
        await FirebaseFirestore.instance.collection('Events').doc(uid).get();
    // DocumentSnapshot querySnapshot = await eventCollection.doc(uid).get();
    // print(querySnapshot.get('title'));
    // Get data from docs and convert map to List
    // final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    return mySnapshot;

    // return ret;
  }
}

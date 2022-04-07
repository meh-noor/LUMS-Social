import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class addCollection {
  // final FirebaseAuth _auth = FirebaseAuth.instance;

  //Add your event to the collection of "Events"

  bool addEvent(uid, event) {
    FirebaseFirestore.instance.collection("Events").doc();
    return true;
  }
}

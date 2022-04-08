import 'package:cloud_firestore/cloud_firestore.dart';

class addCollection {
  final CollectionReference eventCollection =
      FirebaseFirestore.instance.collection("Events");

  Future<void> addEvent(
      String title,
      String organiser,
      String loc,
      String description,
      DateTime start_date,
      DateTime start_time,
      String uid) {
    return eventCollection.doc(uid).set({
      'title': title,
      'Organiser': organiser,
      'location': loc,
      'description': description,
      'start_date': start_date,
      'start_time': start_time,
    });
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class addCollection {
  final CollectionReference eventCollection =
      FirebaseFirestore.instance.collection("adminEvents");

  addEventtoDatabase(
      String? title,
      String? organiser,
      String? loc,
      String? description,
      DateTime? start_date,
      DateTime? start_time,
      // String? image,
      String? event_type,
      String uid) {
    // String eventID = uid + DateTime.now().toString();

    // FirebaseFirestore.instance.collection('adminEvents').doc(uid).update({
    //   "eventID": eventID,
    // });

    String eventID = eventCollection.doc(uid).collection('Events').doc().id;

    eventCollection.doc(uid).collection('Events').doc(eventID).set({
      'title': title,
      'Organiser': organiser,
      'location': loc,
      'description': description,
      'start_date': start_date,
      'start_time': start_time,
      'event_type': event_type,
      'eventID': eventID,
    });
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getNews(String uid) async {
    // Get docs from collection reference
    DocumentSnapshot<Map<String, dynamic>> mySnapshot;
    mySnapshot =
        await FirebaseFirestore.instance.collection('News').doc(uid).get();
    return mySnapshot;
  }

  // String _returnsEventID() {}//TODO
}

class addNewsToCollection {
  addNewsToDatabase(String? headline, String? news_author, String? description,
      DateTime? start_date, String uid) {
    final CollectionReference eventCollection =
        FirebaseFirestore.instance.collection("adminEvents");

    String newsID = eventCollection.doc(uid).collection('News').doc().id;

    eventCollection.doc(uid).collection('News').doc(newsID).set({
      'headline': headline,
      'news_author': news_author,
      'description': description,
      'start_date': start_date,
      'NewsID': newsID,
    });
  }
}

class DeleteNews {
  final CollectionReference newsCollection =
      FirebaseFirestore.instance.collection("adminEvents");

  Future<void> deleteNewsFromDB(String uid, String newsID) {
    return newsCollection.doc(uid).collection('News').doc(newsID).delete();
  }
}

class DeleteEvent {
  final CollectionReference eventCollection =
      FirebaseFirestore.instance.collection("Events");

  Future<void> DeleteEventFromDB(String uid) {
    return eventCollection.doc(uid).delete();
  }
}

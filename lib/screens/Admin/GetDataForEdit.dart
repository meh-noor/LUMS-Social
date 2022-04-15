import 'package:flutter/material.dart';
import 'package:lums_social_app2/screens/Admin/editEvent.dart';
import 'package:lums_social_app2/screens/news/editdeleteNews.dart';
import 'package:provider/provider.dart';
import 'package:lums_social_app2/models/user.dart';
import 'package:lums_social_app2/screens/auth/authenticate.dart';
import 'package:lums_social_app2/screens/home/home.dart';
import 'package:lums_social_app2/services/addToCollection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lums_social_app2/splash.dart';

String? title;
String? headline;
String? news_author;
String? loc;
String? organiser;
String? description;
DateTime? start_date;
DateTime? start_time;
String? image;
String? event_type;
String uid = 'abcdefghij12';

class GetDataForEdit extends StatefulWidget {
  const GetDataForEdit({Key? key}) : super(key: key);

  @override
  State<GetDataForEdit> createState() => _GetDataForEditState();
}

class _GetDataForEditState extends State<GetDataForEdit> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser?>(context);

    // print(user);
    // // return either Home or Authenticate Widget
    // bool temp = true;
    if (uid == null) {
      return Authenticate();
    } else {
      return FutureBuilder(
        builder: ((context, snapshot) {
          if (snapshot.data != null) {
            return EditEvent(
                title: title,
                loc: loc,
                description: description,
                organiser: organiser,
                start_date: start_date,
                start_time: start_time,
                event_type: event_type);
          } else {
            // return Splash();
            return Container(
              // margin: EdgeInsets.all(50.0),
              child: Image(
                image: AssetImage('images/finallogo.png'),
                // fit: BoxFit.cover,
                width: 450,
                height: 400,
              ),
            );
          }
        }),
        future: fetchData(),
      );
    }
  }
}

class GetNewsforEdit extends StatefulWidget {
  const GetNewsforEdit({Key? key}) : super(key: key);

  @override
  State<GetNewsforEdit> createState() => _GetNewsforEditState();
}

class _GetNewsforEditState extends State<GetNewsforEdit> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser?>(context);

    // print(user);
    // // return either Home or Authenticate Widget
    // bool temp = true;
    if (uid == null) {
      return Authenticate();
    } else {
      return FutureBuilder(
        builder: ((context, snapshot) {
          if (snapshot.data != null) {
            return EditNews(
                headline: headline,
                news_author: news_author,
                description: description);
          } else {
            // return Splash();
            return Container(
              // margin: EdgeInsets.all(50.0),
              child: Image(
                image: AssetImage('images/finallogo.png'),
                // fit: BoxFit.cover,
                width: 450,
                height: 400,
              ),
            );
          }
        }),
        future: GetNews(),
      );
    }
  }
}

Future<Object> fetchData() async {
  DocumentSnapshot<Map<String, dynamic>> mySnapshot;
  mySnapshot = await addCollection().getData('abcdefghij123');
  // start_date = mySnapshot.data()?['start_date'];
  title = mySnapshot.data()?['title'];
  description = mySnapshot.data()?['description'];
  loc = mySnapshot.data()?['location'];
  Timestamp date = mySnapshot.data()?['start_date'];
  Timestamp time = mySnapshot.data()?['start_time'];
  start_date = date.toDate();
  start_time = time.toDate();
  organiser = mySnapshot.data()?['Organiser'];
  event_type = mySnapshot.data()?['event_type'];
  return mySnapshot;
}

Future<Object> GetNews() async {
  DocumentSnapshot<Map<String, dynamic>> mySnapshot;
  mySnapshot = await addCollection().getNews('abcd1234');
  headline = mySnapshot.data()?['headline'];
  description = mySnapshot.data()?['description'];
  news_author = mySnapshot.data()?['news_author'];
  return mySnapshot;
}



// ***************************************************************************************************************



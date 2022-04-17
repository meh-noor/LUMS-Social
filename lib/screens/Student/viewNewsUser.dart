//View Event

import 'package:flutter/material.dart';
import 'package:lums_social_app2/screens/Admin/GetDataForEdit.dart';
import 'package:lums_social_app2/services/auth.dart';
import 'package:lums_social_app2/widget/button_widget.dart';
import 'package:intl/intl.dart';

class viewNewsUser extends StatefulWidget {
  String? headline;
  String? news_author;
  String? description;
  String? newsID;
  String? imageURL;
  viewNewsUser(
      {required this.headline,
      required this.news_author,
      required this.description,
      required this.newsID,
      required this.imageURL});

  @override
  State<viewNewsUser> createState() => _viewNewsUserState();
}

class _viewNewsUserState extends State<viewNewsUser> {
  String getTimeFromDateAndTime(String date) {
    DateTime dateTime;
    dateTime = DateTime.parse(date).toLocal();
    return DateFormat.jm().format(dateTime).toString(); //5:08 PM
  }

  String getDateFromDateAndTime(String date) {
    DateTime dateTime;
    dateTime = DateTime.parse(date).toLocal();
    return DateFormat("dd-MM-yyyy").format(dateTime);
  }

  // getTimeFromDateAndTime(widget.start_date);

  // String now = DateFormat("yyyy-MM-dd").format(widget.start_date);
  // String formattedTime = DateFormat.jm().format(start_time);
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    print('isnide viewnewsUser');
    print(widget.imageURL);
    backgroundColor:
    const Color(0xFFFFFFFF);
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
              left: 15.0, right: 15.0, bottom: 5.0, top: 30.0),
          child: image(),
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 15.0, right: 15.0, bottom: 5.0, top: 15.0),
          child: title(),
        ),
        const SizedBox(height: 20),
        // Padding(
        //   padding: const EdgeInsets.only(
        //       left: 15.0, right: 200.0, bottom: 5.0, top: 15.0),
        Padding(
            padding: EdgeInsets.only(left: 25),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: info(),
            )),
        // Text(widget.description.toString()),
        Padding(
            padding: EdgeInsets.only(left: 25),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: des(),
            )),

        // Padding(
        //   padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        //   child: des(),
        // ),
        Padding(
          padding: const EdgeInsets.only(
              left: 15.0, right: 295.0, bottom: 5.0, top: 15.0),
          child: author(),
        ),
        Padding(
            padding: EdgeInsets.only(left: 25),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: authorName(),
            )),
        // Padding(
        //   padding: const EdgeInsets.only(left: 15.0, bottom: 5.0, top: 15.0),
        //   child: authorName(),
        // ),
        // Padding(
        //   padding: const EdgeInsets.only(
        //       left: 15.0, right: 15.0, bottom: 5.0, top: 15.0),
        //   child: editButton(),
        // ),
      ],
    )));
  }

// ********************************** FETCH HEADLINE **********************************
  Widget title() => Container(
          // alignment: Alignment.center,
          // padding: const EdgeInsets.fromLTRB(35, 60, 20, 20),
          child: Text(
        widget.headline.toString(),
        style: TextStyle(
            fontSize: 25,
            color: Color(0xFF050A30),
            fontWeight: FontWeight.w600,
            fontFamily: 'Poppins'),
      ));

  Widget info() => Text(
        'Additional Information',
        style: TextStyle(
          fontSize: 16,
          color: Color(0xffA19F9F),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
      );

  Widget des() => Text(
        widget.description.toString(),
        textAlign: TextAlign.left,
        style: TextStyle(
            fontSize: 18, color: Color(0xFF050A30), fontFamily: 'Poppins'),
      );

// ********************************** FETCH IMAGE **********************************
  Widget image() => Container(
          // alignment: Alignment.topLeft,
          // padding: const EdgeInsets.fromLTRB(25, 0, 0, 20),
          child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(widget.imageURL.toString()),
        // child: const Image(
        //   image: AssetImage('images/20poster1 1.png'),
        //   fit: BoxFit.cover,
        // ),
      ));

// ********************************** FETCH NEWS DESC **********************************

  Widget author() => Text(
        "Author",
        style: TextStyle(
            fontSize: 16, color: Color(0xffA19F9F), fontFamily: 'Poppins'),
      );

// ********************************** FETCH AUTHOR **********************************
  Widget authorName() => Text(
        widget.news_author.toString(),
        style: TextStyle(
            fontSize: 16, color: Color(0xFF000000), fontFamily: 'Poppins'),
      );

  Widget editButton() => Container(
      alignment: Alignment.bottomRight,
      padding: const EdgeInsets.fromLTRB(25, 0, 0, 20),
      child: InkWell(
        onTap: () async {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => GetDataForEdit(
                      eventID: widget.newsID,
                    )),
          );
        },
        child: const Image(
          image: AssetImage('images/editImage.png'),
          fit: BoxFit.cover,
        ),
      ));
}

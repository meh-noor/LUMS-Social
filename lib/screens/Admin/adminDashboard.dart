import 'package:flutter/material.dart';
import 'package:lums_social_app2/services/auth.dart';
import 'package:lums_social_app2/widget/button_widget.dart';
// import 'package:lums_social_app2/widget/email_field_widget.dart';
// import 'package:lums_social_app2/widget/password_field_widget.dart';

class admin extends StatefulWidget {
  @override
  State<admin> createState() => _adminState();
}

class _adminState extends State<admin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: Column(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 30.0, bottom: 10.0, top: 40.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: mainText(),
                )),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, bottom: 10.0, top: 10.0),
              child: greetingRow(),
            ),
          ],
        ));
  }
}

Widget mainText() => RichText(
        text: TextSpan(
            text: ' LUMS ',
            style: TextStyle(
              // alignment: Alignment(-0.85, -0.85),
              fontFamily: 'Poppins',
              color: Color(0xFF050A30),
              fontSize: 25,
            ),
            children: [
          TextSpan(
            text: ' SOCIAL ',
            style: TextStyle(
              fontFamily: 'Poppins',
              color: Colors.blue,
              fontSize: 25,
            ),
            // child: Align(
            //   alignment: Alignment(-0.85, -0.85),
          )
        ]));

Widget greetingRow() => Row(
      children: [
        Icon(Icons.account_circle_rounded, size: 30, color: Color(0xFF050A30)),
        Padding(
            padding: EdgeInsets.all(5.0),
            child: Text(
              'Hello',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Colors.black,
                fontSize: 22,
                // padding: const EdgeInsets.all(15.0),
              ),
            )),
      ],
    );

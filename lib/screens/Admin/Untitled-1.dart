// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:lums_social_app2/services/auth.dart';
import 'package:lums_social_app2/widget/button_widget.dart';

class addEvent extends StatefulWidget {
  @override
  State<addEvent> createState() => adminAddEvent();
}

class adminAddEvent extends State<addEvent> {
  String email = '';

  @override
  Widget blueDecor() => Container(
          child: Image(
        image: AssetImage('images/Ellipse12.png'),
        fit: BoxFit.cover,
        height: 250,
        width: 593,
        alignment: Alignment.topCenter,
      ));

  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            blueDecor(),
            Container(
                alignment: const Alignment(0, -0.65),
                child: Text(
                  ' Add Event ',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.black,
                    fontSize: 34,
                    // fontWeight: FontWeight.bold,
                  ),
                )),
            Container(
                alignment: Alignment(0, -0.27),
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'Please fill in the following details carefully to add your event.',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.black,
                    fontSize: 18,
                  ),
                )),
            SizedBox(height: 5),
            Container(
                width: 400,
                // color: const Color(0xFFFFFFFF),
                padding: const EdgeInsets.all(15.0),
                alignment: Alignment(0.5, -0.05),
                child: TextFormField(
                  validator: (val) => val!.isEmpty ? 'Name of Event' : null,
                  onChanged: (val) {
                    setState(() {
                      email = val;
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Name of Event Here',
                  ),
                  autofocus: false,
                  obscureText: false,
                )),
            Container(
                width: 400,
                // color: const Color(0xFFFFFFFF),
                padding: const EdgeInsets.all(15.0),
                alignment: Alignment(0.5, 0.15),
                child: TextFormField(
                  validator: (val) => val!.isEmpty ? 'Name of Organizer' : null,
                  onChanged: (val) {
                    setState(() {
                      email = val;
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Name of Organizer Here',
                  ),
                  autofocus: false,
                  obscureText: false,
                )),
            Container(
                width: 400,
                // color: const Color(0xFFFFFFFF),
                padding: const EdgeInsets.all(15.0),
                alignment: Alignment(0.5, 0.35),
                child: TextFormField(
                  validator: (val) => val!.isEmpty ? 'Location' : null,
                  onChanged: (val) {
                    setState(() {
                      email = val;
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Location Here',
                  ),
                  autofocus: true,
                  obscureText: false,
                )),
            Container(
                // color: const Color(0xFFFFFFFF),
                padding: const EdgeInsets.all(15.0),
                alignment: Alignment(0.5, 0.55),
                width: 600,
                child: TextFormField(
                  validator: (val) =>
                      val!.isEmpty ? 'Description of Event' : null,
                  onChanged: (val) {
                    setState(() {
                      email = val;
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Description of Event',
                  ),
                  autofocus: false,
                  obscureText: false,
                )),
          ],
        )));
  }
}

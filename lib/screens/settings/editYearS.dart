import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lums_social_app2/services/auth.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:lums_social_app2/screens/settings/editmainProfile.dart';
import 'package:provider/provider.dart';

import '../../models/user.dart';

class EditYear extends StatefulWidget {
  // const EditYear({Key? key}) : super(key: key);
  String oldYear;
  EditYear(this.oldYear);

  @override
  State<EditYear> createState() => _EditYearState();
}

class _EditYearState extends State<EditYear> {
  late TextEditingController _controller;
  final items = [for (var i = 1997; i < 2050; i++) i.toString()];
  String? value;
  //final AuthService _auth = AuthService();
  @override
  void initState() {
    //******************* FETCH Major  *********************/
    _controller = TextEditingController(text: widget.oldYear);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser?>(context);
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/newsBG.png'), fit: BoxFit.cover)),
        child: Scaffold(
            backgroundColor: Colors.transparent,

            // body: Align
            // (
            //   alignment: const Alignment(0.2, -0.7),
            body: ListView(children: <Widget>[
              FormBuilder(
                  child: SingleChildScrollView(
                      child: Column(
                children: [
                  title(),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(90, 100, 60, 0),
                      child: settingTitle()),
                  instructions(),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
                      child: currentYear(_controller)),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                      child: SizedBox(
                          width: 380,
                          child: DropdownButtonFormField<String>(
                            menuMaxHeight: 150,

                            decoration: const InputDecoration(
                                labelText: 'New graduating year',
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.only(left: 15.0)),
                            //value:value,
                            isExpanded: true,
                            isDense: false,
                            icon: const Icon(Icons.arrow_drop_down,
                                color: Colors.black),
                            items: items.map(buildMenu).toList(),
                            //********************* STORE VALUE **********************/
                            onChanged: (value) =>
                                setState(() => this.value = value),
                          ))),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(250, 20, 30, 20),
                      child: updateButton(context, user)),
                ],
              )))
            ])));
  }

  DropdownMenuItem<String> buildMenu(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: const TextStyle(fontSize: 16),
      ));

  Widget title() => Container(
      //alignment: Alignment.topCenter,
      padding: const EdgeInsets.fromLTRB(60, 80, 60, 0),
      child: const Text(
        "Edit Profile",
        style: TextStyle(
            fontSize: 30,
            color: Color(0xFF0e1337),
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500),
      ));

  Widget settingTitle() => Row(
        //mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const Icon(Icons.calendar_today, size: 50, color: Color(0xFF050A30)),
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.only(left: 8, right: 3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Text(
                    "Update Year",
                    style: TextStyle(
                        fontSize: 22,
                        color: Color(0xFF0e1337),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
          ),
        ],
      );

  Widget instructions() => Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.fromLTRB(80, 20, 80, 10),
      child: const Text(
        "Enter current graduating year and revised new year.",
        textAlign: TextAlign.center,
        style:
            TextStyle(fontSize: 14, color: Colors.black, fontFamily: 'Poppins'),
      ));

  Widget currentYear(_controller) => SizedBox(
      width: 380,
      child: TextField(
        readOnly: false,
        enabled: false,
        controller: _controller,
        decoration: const InputDecoration(
          labelText: "Current graduating year",
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.only(left: 15.0),
          //readOnly: true
        ),
      ));

  Widget updateButton(context, user) => ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: const Color(0xFF5DCAD1),
        minimumSize: const Size.fromHeight(45),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      child: const FittedBox(
        child: Text(
          'Update',
          style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              decoration: TextDecoration.underline),
        ),
      ),
      onPressed: () async {
        if (value != null) {
          FirebaseFirestore.instance.collection('users').doc(user?.uid).update({
            'year': value,
          });
        }
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const EditProfile()));
      });
}

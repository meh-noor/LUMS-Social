import 'package:flutter/material.dart';
import 'package:lums_social_app2/services/auth.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class EditName extends StatefulWidget {
  // const EditName({Key? key}) : super(key: key);

  String myOldName;
  EditName(this.myOldName);
  @override
  State<EditName> createState() => _EditNameState();
}

class _EditNameState extends State<EditName> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    print("My old name is");
    print(widget.myOldName);
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
                      child: currentName()),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                      child: newName()),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(250, 20, 30, 20),
                      child: updateButton()),
                ],
              )))
            ])));
  }

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

// Widget settingTitle() => Container
// (
//     //alignment: Alignment.topCenter,
//     padding: const EdgeInsets.fromLTRB(60, 120, 60, 0),
//     child:const Text("Update Name",
//         style: TextStyle(fontSize: 22, color: Color(0xFF0e1337), fontFamily: 'Poppins',  fontWeight: FontWeight.w500),)
// );

  Widget settingTitle() => Row(
        //mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const Icon(Icons.person, size: 50, color: Color(0xFF050A30)),
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.only(left: 8, right: 3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Text(
                    "Update Name",
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
        "Enter current name of profile and revised new name of choice.",
        textAlign: TextAlign.center,
        style:
            TextStyle(fontSize: 14, color: Colors.black, fontFamily: 'Poppins'),
      ));

  Widget currentName() => SizedBox(
      width: 380,
      child: FormBuilderTextField(
        name: 'title',
        decoration: InputDecoration(
            labelText: widget.myOldName,
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.only(left: 15.0)),
      ));

  Widget newName() => SizedBox(
      width: 380,
      child: FormBuilderTextField(
        name: 'title',
        decoration: const InputDecoration(
            labelText: "New name",
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.only(left: 15.0)),
      ));

  Widget updateButton() => ElevatedButton(
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
        onPressed: () async {},
      );
}

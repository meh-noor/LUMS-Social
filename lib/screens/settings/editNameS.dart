import 'package:flutter/material.dart';
import 'package:lums_social_app2/services/auth.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';


class EditName extends StatefulWidget 
{
  const EditName({Key? key}) : super(key: key);

  @override
  State<EditName> createState() => _EditNameState();
}

class _EditNameState extends State<EditName> 
{
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) 
  {
    return Container(
      decoration: const BoxDecoration
      (
          image: DecorationImage
          (
            image: AssetImage('images/newsBG.png'),
            fit: BoxFit.cover
          )
      ),
  
      child: Scaffold
      (
        backgroundColor: Colors.transparent,
        
        // body: Align
        // (
        //   alignment: const Alignment(0.2, -0.7),  
          body: ListView
          (
          children: <Widget>
          [
            FormBuilder
            (
                child: SingleChildScrollView
                (
                    child: Column
                    (children: 
                    [
                      title(),
                      instructions(),
                      //space(),
                    ],
                    )
                )
            )
          ]
          )
      )
    );
  }
}

Widget title() => Container
(
    //alignment: Alignment.topCenter,
    padding: const EdgeInsets.fromLTRB(60, 70, 60, 0),
    child:const Text("Edit Profile",
        style: TextStyle(fontSize: 30, color: Color(0xFF0e1337), fontFamily: 'Poppins',  fontWeight: FontWeight.w500),)  
);

Widget instructions() => Container
(
    alignment: Alignment.topLeft,
    padding: const EdgeInsets.fromLTRB(30, 120, 10, 10),
    child:const Text("Account Info",
        style: TextStyle(fontSize: 20, color: Colors.black, fontFamily: 'Poppins'),)  
);
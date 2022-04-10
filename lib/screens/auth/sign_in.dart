import 'package:flutter/material.dart';
import 'package:lums_social_app2/screens/news/addNews.dart';
import 'package:lums_social_app2/screens/news/noNews.dart';
import 'package:lums_social_app2/services/auth.dart';
import 'package:lums_social_app2/widget/button_widget.dart';
import 'package:lums_social_app2/screens/news/newsButton.dart';
import 'package:lums_social_app2/screens/Admin/adminDashboard.dart';
import 'package:lums_social_app2/screens/Admin/addEvent.dart';

import '../news/editdeleteNews.dart';
// import 'package:lums_social_app2/widget/email_field_widget.dart';
// import 'package:lums_social_app2/widget/password_field_widget.dart';

class SignIn extends StatefulWidget {
  // const SignIn({Key? key}) : super(key: key);
  final Function toggleView;
  SignIn({required this.toggleView});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  //text field state

  String email = '';
  String password = "";
  String error = '';
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF050A30),
      appBar: AppBar(
        backgroundColor: Colors.purple[400],
        elevation: 0.0,
        title: Text('Sign in to LUMS Social'),
        actions: <Widget>[
          TextButton.icon(
            icon: Icon(Icons.person),
            label: Text('Sign up'),
            onPressed: () {
              widget.toggleView();
            },
          )
        ],
      ),
      body: Center(
          // padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),

          child: Form(
        key: _formkey,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: AutofillGroup(
            child: Column(
              children: [
                IconWidget(),
                emailTextBox(),
                const SizedBox(height: 10),
                passwordTextBox(),
                const SizedBox(height: 10),
                buildForgotPassword(),
                buildButton(),
                const SizedBox(height: 100),
                buildNoAccount(),
                ErrorWidget(),
              ],
              // children: <Widget>[
              //   SizedBox(height: 20.0),
              //   TextFormField(
              //       validator: (val) => val!.isEmpty ? 'Enter an email' : null,
              //       onChanged: (val) {
              //         setState(() {
              //           email = val;
              //         });
              //       }),
              //   TextFormField(
              //       obscureText: true,
              //       validator: (val) => val!.length < 6
              //           ? 'Enter a password 6+ chars long'
              //           : null,
              //       onChanged: (val) {
              //         setState(() {
              //           password = val;
              //         });
              //       }),
              //   SizedBox(height: 20.0),
              //   ElevatedButton(
              //     child: Text('Sign in', style: TextStyle(color: Colors.black)),
              //     style: ButtonStyle(
              //         backgroundColor: MaterialStateProperty.all(
              //             Color.fromARGB(255, 243, 243, 243))),
              // onPressed: () async {
              //   if (_formkey.currentState!.validate()) {
              //     dynamic result = await _auth.signInWithEmailAndPassword(
              //         email, password);
              //     if (result == null) {
              //       // email error message
              //       setState(() {
              //         error = 'Could not sign in with those credentials';
              //       });
              //     }
              //   }
              // },
              //   ),
              //   SizedBox(height: 12.0),
              //   Text(
              //     error,
              //     style: TextStyle(color: Colors.red, fontSize: 14.0),
              //   )
              // ],
            ),
          ),
        ),
      )),
    );
  }

//test button
  // Widget buildButton() => ButtonWidget(
  //     //  0xFF5DCAD1
  //     text: 'Test Button',
  //     onClicked: () async {
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(builder: (context) => AddEvent()),
  //       );
  //     });

// Widget mySizedBox()
  // Widget buildButton() => ButtonWidget(
  //       //  0xFF5DCAD1
  //       text: 'Login',

  //       onClicked: () async {
  //         // Navigator.push(
  //         //   context,
  //         //   MaterialPageRoute(builder: (context) => adminDashboard()),
  //         // );
  //         if (_formkey.currentState!.validate()) {
  //           dynamic result =
  //               await _auth.signInWithEmailAndPassword(email, password);
  //           if (result == null) {
  //             // email error message
  //             setState(() {
  //               error = 'Could not sign in with those credentials';
  //             });
  //           }
  //         }
  //       },
  //     );
  Widget buildButton() => ButtonWidget(
      //  0xFF5DCAD1
      text: 'Test Button',
      onClicked: () async {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EditNews()),
        );
      });

  Widget ErrorWidget() => Text(
        error,
        style: TextStyle(color: Colors.red, fontSize: 14.0),
      );

  Widget IconWidget() => Container(
        // margin: EdgeInsets.all(50.0),
        child: Image(
          image: AssetImage('images/finallogo.png'),
          fit: BoxFit.cover,
        ),
      );

  Widget buildNoAccount() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Don\'t have an account?',
              style: TextStyle(color: Color(0xFFFFFFFF))),
          TextButton(
            child: Text(
              'SIGN UP',
              style: TextStyle(decoration: TextDecoration.underline),
            ),
            onPressed: () {},
            style: TextButton.styleFrom(
              primary: Color(0xFFFFFFFF),
              // Text Color
            ),
          ),
        ],
      );

  Widget buildForgotPassword() => Container(
        alignment: Alignment.centerRight,
        child: TextButton(
          child: Text(
            'Forgot Password?',
            style: TextStyle(decoration: TextDecoration.underline),
          ),
          onPressed: () {},
          style: TextButton.styleFrom(
            primary: Color(0xFFFFFFFF),
            // Text Color
          ),
        ),
      );

  Widget emailTextBox() => Container(
      width: 400,
      color: const Color(0xFFFFFFFF),
      child: TextFormField(
        validator: (val) => val!.isEmpty ? 'Enter an email' : null,
        onChanged: (val) {
          setState(() {
            email = val;
          });
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Enter email Here',
          suffixIcon: Icon(Icons.email),
        ),
        autofocus: false,
        obscureText: false,
      ));
  Widget passwordTextBox() => Container(
      width: 400,
      color: const Color(0xFFFFFFFF),
      child: TextFormField(
        validator: (val) =>
            val!.length < 6 ? 'Enter a password 6+ chars long' : null,
        onChanged: (val) {
          setState(() {
            password = val;
          });
        },
        style: TextStyle(color: Color.fromARGB(255, 2, 2, 2)),
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Enter Password Here',
          suffixIcon: Icon(Icons.lock),
        ),
        autofocus: false,
        obscureText: true,
      ));
}

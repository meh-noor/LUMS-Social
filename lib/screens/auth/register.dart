import 'package:flutter/material.dart';
import 'package:lums_social_app2/screens/auth/registerUserDetails.dart';
import 'package:lums_social_app2/screens/auth/sign_in.dart';
import 'package:lums_social_app2/screens/wrapper.dart';
import 'package:lums_social_app2/services/auth.dart';
import 'package:lums_social_app2/widget/next_button.dart';
import 'package:lums_social_app2/widget/button_widget.dart';

class Register extends StatefulWidget {
  // const Register({Key? key}) : super(key: key);

  // final Function toggleView;
  // Register({required this.toggleView});
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();

  String email = "";
  String password = "";
  String error = "";
  String reEnterPassword = "";
  String name = "";
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF050A30),
      body: Center(
          child: Form(
        key: _formkey,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: AutofillGroup(
            child: Column(
              children: [
                IconWidget(),
                CreateAccText(),
                const SizedBox(height: 20),
                nameTextBox(),
                const SizedBox(height: 10),
                emailTextBox(),
                const SizedBox(height: 10),
                passwordTextBox(),
                const SizedBox(height: 10),
                reEnterpasswordTextBox(),
                // buildForgotPassword(),
                const SizedBox(height: 20),
                NextButton(),
                const SizedBox(height: 10),
                toggleToSignIn(),
                const SizedBox(height: 200),
                // NextButton(),
                // ErrorWidget(),
              ],
            ),
          ),
        ),
      )),
    );
  }

  bool getIdx() {
    var idx = 0;
    if (email != null) {
      for (var i = 0; i < email.length; i++) {
        if (email[i] == '@') {
          idx = i;
        }
      }
      if (email.substring(idx, email.length) == "@lums.edu.pk") {
        print((email.substring(idx, email.length)));
        return true;
      }
    }
    return false;
  }

// Widget mySizedBox()
  Widget NextButton() => ButtonWidget(
      //  0xFF5DCAD1
      text: 'Next',
      onClicked: () async {
        if (_formkey.currentState!.validate()) {
          dynamic result =
              await _auth.registerWithEmailAndPassword(email, password, name);

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RegisterDetails()),
          );
          // print(email);
          if (result == null) {
            // print(!getIdx());
            // email error message
            setState(() {
              error = 'Please enter a valid email';
            });
          }
        }
      });

  Widget ErrorWidget() => Text(
        error,
        style: TextStyle(color: Colors.red, fontSize: 14.0),
      );

  Widget IconWidget() => Container(
        // margin: EdgeInsets.all(50.0),
        child: Image(
          image: AssetImage('images/finallogo.png'),
          width: 300,
          height: 250,
          // fit: BoxFit.cover,
        ),
      );

  Widget CreateAccText() => Center(
        child: Text("Create account",
            style: TextStyle(
                color: Colors.white, fontFamily: 'poppins', fontSize: 25)),
        //   SizedBox(height: 10.0),
        //   Text("Title Here",
        //   style:
        //   ,
        //   )
        // ],
      );

  Widget nameTextBox() => Container(
      width: 400,
      color: const Color(0xFFFFFFFF),
      child: TextFormField(
        validator: (val) => val!.isEmpty ? 'Enter Name' : null,
        onChanged: (val) {
          setState(() {
            name = val;
          });
        },
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Name',
            suffixText: '*',
            suffixStyle: TextStyle(color: Colors.red)),
        autofocus: false,
        obscureText: false,
      ));

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
            hintText: 'Email',
            suffixText: '*',
            suffixStyle: TextStyle(color: Colors.red)),
        autofocus: false,
        obscureText: false,
      ));
  Widget passwordTextBox() => Container(
      width: 400,
      color: const Color(0xFFFFFFFF),
      child: TextFormField(
        validator: (val) =>
            val!.length < 6 ? 'Password must be atleast 6 chars long' : null,
        onChanged: (val) {
          setState(() {
            password = val;
          });
        },
        style: TextStyle(color: Color.fromARGB(255, 2, 2, 2)),
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Enter Password',
            suffixText: '*',
            suffixStyle: TextStyle(color: Colors.red)),
        autofocus: false,
        obscureText: true,
      ));

  Widget reEnterpasswordTextBox() => Container(
      width: 400,
      color: const Color(0xFFFFFFFF),
      child: TextFormField(
        validator: (val) => val != password ? 'Passwords do not match' : null,
        onChanged: (val) {
          setState(() {
            reEnterPassword = val;
          });
        },
        style: TextStyle(color: Color.fromARGB(255, 2, 2, 2)),
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Re-enter Password',
            suffixText: '*',
            suffixStyle: TextStyle(color: Colors.red)),
        autofocus: false,
        obscureText: true,
      ));

  Widget toggleToSignIn() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Already have an account?',
              style: TextStyle(color: Color(0xFFFFFFFF))),
          TextButton(
            child: const Text(
              'LOGIN',
              style: TextStyle(decoration: TextDecoration.underline),
            ),
            onPressed: () {
              // widget.toggleView();

              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => SignIn()));
            },
            style: TextButton.styleFrom(
              primary: const Color(0xFFFFFFFF),
              // Text Color
            ),
          ),
        ],
      );
}

mixin string {}

class Int {}

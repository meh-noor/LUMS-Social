import 'package:flutter/material.dart';
import 'package:lums_social_app2/screens/auth/forget_password.dart';
import 'package:lums_social_app2/screens/Admin/editEvent.dart';
import 'package:lums_social_app2/services/auth.dart';
import 'package:lums_social_app2/widget/button_widget.dart';
import 'package:lums_social_app2/screens/news/newsButton.dart';
import 'package:lums_social_app2/screens/Admin/adminDashboard.dart';
import 'package:lums_social_app2/screens/Admin/hashtags.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  final Function toggleView2;
  const SignIn({required this.toggleView, required this.toggleView2});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  // email,password and error are common
  String email = "";
  String password = "";
  String error = "";
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
                LogInText(),
                // const SizedBox(height: 27.5),
                const SizedBox(height: 20),
                emailTextBox(),
                const SizedBox(height: 10),
                passwordTextBox(),
                const SizedBox(height: 10),
                buildForgotPassword(),
                buildButton(),
                const SizedBox(height: 20),
                ErrorWidget(),
                const SizedBox(height: 100),
                buildNoAccount(),
              ],
            ),
          ),
        ),
      )),
    );
  }


  Widget buildButton() => ButtonWidget(
        text: 'Login',
        onClicked: () async {
          if (_formkey.currentState!.validate()) {
            dynamic result =
                await _auth.signInWithEmailAndPassword(email, password);
            if (result == null) {
              // email error message
              setState(() {
                error = 'Could not sign in with those credentials';
              });
            }
          }
        },
      );

  Widget LogInText() => Center(
        child: Text("Enter Credentials",
            style: TextStyle(
                color: Colors.white, fontFamily: 'poppins', fontSize: 25)),
      );

  Widget ErrorWidget() => Text(
        error,
        style: const TextStyle(color: Colors.red, fontSize: 14.0),
      );

  Widget IconWidget() => Container(
        // margin: EdgeInsets.all(50.0),
        child: Image(
          image: AssetImage('images/finallogo.png'),
          // fit: BoxFit.cover,
          width: 300,
          height: 250,
        ),
      );

  Widget buildNoAccount() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Don\'t have an account?',
              style: TextStyle(color: Color(0xFFFFFFFF))),
          TextButton(
            child: const Text(
              'SIGN UP',
              style: TextStyle(decoration: TextDecoration.underline),
            ),
            onPressed: () {
              widget.toggleView();
            },
            style: TextButton.styleFrom(
              primary: const Color(0xFFFFFFFF),
              // Text Color
            ),
          ),
        ],
      );

  Widget buildForgotPassword() => Container(
        alignment: Alignment.centerRight,
        child: TextButton(
          child: const Text(
            'Forgot Password?',
            style: TextStyle(decoration: TextDecoration.underline),
          ),
          onPressed: () {
            return widget.toggleView2();
          },
          style: TextButton.styleFrom(
            primary: const Color(0xFFFFFFFF),
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
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Email',
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
        style: const TextStyle(color: Color.fromARGB(255, 2, 2, 2)),
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Password',
          suffixIcon: Icon(Icons.lock),
        ),
        autofocus: false,
        obscureText: true,
      ));
}

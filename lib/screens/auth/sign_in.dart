import 'package:flutter/material.dart';
import 'package:lums_social_app2/services/auth.dart';
import 'package:lums_social_app2/widget/button_widget.dart';
// import 'package:lums_social_app2/widget/email_field_widget.dart';
// import 'package:lums_social_app2/widget/password_field_widget.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  const SignIn({required this.toggleView});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  // email,password and error are common
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
        title: const Text('Sign in to LUMS Social'),
        actions: <Widget>[
          TextButton.icon(
            icon: const Icon(Icons.person),
            label: const Text('Sign up'),
            onPressed: () {
              widget.toggleView();
            },
          )
        ],
      ),
      body: Center(
          child: Form(
        key: _formkey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: AutofillGroup(
            child: Column(
              children: [
                iconWidget(),
                emailTextBox(),
                const SizedBox(height: 10),
                passwordTextBox(),
                const SizedBox(height: 10),
                buildForgotPassword(),
                buildButton(),
                const SizedBox(height: 100),
                buildNoAccount(),
                errorWidget(),
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

  Widget errorWidget() => Text(
        error,
        style: const TextStyle(color: Colors.red, fontSize: 14.0),
      );

  Widget iconWidget() => const Image(
        image: AssetImage('images/finallogo.png'),
        fit: BoxFit.cover,
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
            onPressed: () {},
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
          onPressed: () {},
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
        style: const TextStyle(color: Color.fromARGB(255, 2, 2, 2)),
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Enter Password Here',
          suffixIcon: Icon(Icons.lock),
        ),
        autofocus: false,
        obscureText: true,
      ));
}

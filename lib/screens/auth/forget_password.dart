import 'package:flutter/material.dart';
import 'package:lums_social_app2/screens/auth/forgetPasswordRedirect.dart';
import 'package:lums_social_app2/screens/auth/sign_in.dart';
import 'package:lums_social_app2/widget/button_widget.dart';
import 'package:lums_social_app2/services/auth.dart';

class ForgotPassword extends StatefulWidget {
  // here toggleView2 is a new toggleView function which will help
  // us navigate between forgot password and sign in screen.
  // final Function toggleView;

  final Function toggleView2;
  final Function toggleView;
  const ForgotPassword({required this.toggleView, required this.toggleView2});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formkey = GlobalKey<FormState>();
  String email = '';
  // String password = "";
  String error = '';
  final AuthService _auth = AuthService();

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
                // LogInText(),
                const SizedBox(height: 17.5),
                forgotPassText(),
                const SizedBox(height: 20),

                IntroText(),
                IntroText2(),
                const SizedBox(height: 30),

                emailTextBox(),
                const SizedBox(height: 10),
                // passwordTextBox(),
                const SizedBox(height: 10),
                // buildForgotPassword(),
                buildButton(),
                const SizedBox(height: 20),
                errorWidget(),
                // const SizedBox(height: 10),
                buildSwitchToSignIn(),
                const SizedBox(height: 112.5),
                // buildNoAccount(),
              ],
            ),
          ),
        ),
      )),
    );
  }

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

  Widget forgotPassText() => const Center(
        child: Text("Reset Password",
            style: TextStyle(
                color: Colors.white, fontFamily: 'poppins', fontSize: 25)),
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

  Widget buildButton() => ButtonWidget(
        text: 'Next',
        onClicked: () async {
          if (_formkey.currentState!.validate()) {
            dynamic result = await _auth.forgotPassword(email);
            if (result == 10) {
              // email error message
              setState(() {
                error = 'Invalid email address';
              });
            } else {
              error = '';
              widget.toggleView2();
              // Navigator.push(
              // context,
              // MaterialPageRoute(builder: (context) => forgetPasswordRedirect(myEmail: email, toggleView: widget.toggleView, toggleView2: widget.toggleView2,)));
              print('reached here');
            }
          }
        },
      );

  Widget IntroText() => const Center(
        child: Text("Enter email associated with your",
        textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontFamily: 'poppins', fontSize: 16)),
      );

  Widget IntroText2() => const Center(
        child: Text("account to change password",
        textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontFamily: 'poppins', fontSize: 16)),
      );

  Widget errorWidget() => Text(
        error,
        style: const TextStyle(color: Colors.red, fontSize: 14.0),
      );

  Widget buildSwitchToSignIn() => Container(
        alignment: Alignment.centerRight,
        child: TextButton(
          child: const Text(
            'Login',
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
}

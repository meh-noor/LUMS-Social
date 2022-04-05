import 'package:flutter/material.dart';
import 'package:lums_social_app2/screens/auth/forget_password.dart';
import 'package:lums_social_app2/screens/auth/register.dart';
import 'package:lums_social_app2/screens/auth/sign_in.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  bool showSignin = true;
  bool showForgotPass = false;
  void toggleView() {
    setState(() {
      showSignin = !showSignin;
    });
  }

  void toggleView2() {
    setState(() {
      showForgotPass = !showForgotPass;
      showSignin = !showSignin;
    });
  }

  Widget build(BuildContext context) {
    if (showSignin) {
      return SignIn(toggleView: toggleView, toggleView2: toggleView2);
    } else if (!showSignin && showForgotPass) {
      return ForgotPassword(toggleView: toggleView, toggleView2: toggleView2);
    } else {
      return Register(toggleView: toggleView);
    }
  }
}

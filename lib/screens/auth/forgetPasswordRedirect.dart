import 'package:flutter/material.dart';
import 'package:lums_social_app2/screens/auth/forget_password.dart';
import 'package:lums_social_app2/screens/auth/sign_in.dart';
import 'package:lums_social_app2/widget/button_widget.dart';
import 'package:lums_social_app2/services/auth.dart';

class forgetPasswordRedirect extends StatefulWidget {
  // here toggleView2 is a new toggleView function which will help
  // us navigate between forgot password and sign in screen.
  // final Function toggleView;

  // final Function toggleView2;
  // final Function toggleView;

  String ? myEmail;

  // forgetPasswordRedirect({required this.myEmail,required this.toggleView, required this.toggleView2});

  forgetPasswordRedirect({required this.myEmail});
  
  // const SignIn({required this.toggleView, required this.toggleView2});
  @override
  State<forgetPasswordRedirect> createState() => _ForgotPasswordStateRedirect();
}

class _ForgotPasswordStateRedirect extends State<forgetPasswordRedirect> {
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
                const SizedBox(height: 130),
                IconWidget(),
                const SizedBox(height: 40),
                textone(),
                const SizedBox(height: 40),
                texttwo(),
                const SizedBox(height: 10),
                textEmail(),
                const SizedBox(height: 50),

                
                // buildSwitchToSignIn(),
                buildButton(),
                const SizedBox(height: 120),

                buildNoAccount(),

              ],
            ),
          ),
        ),
      )),
    );
  }


  Widget IconWidget() => Container(
        // margin: EdgeInsets.all(50.0),
        child: Image(
          image: AssetImage('images/EmailOpen.png'),
          // fit: BoxFit.cover,
          // width: 500,
          // height: 250,
        ),
      );
  
  getEmail(em)
  {
    if(em == null)
    {
      return "";
    }
    else
    {
      return em;
    }
  }

  Widget textone() => Center(
        child: Text("Email Sent!",
            style: TextStyle(
                color: Colors.white, fontFamily: 'poppins', fontSize: 18)),
      );

  Widget texttwo() => Center(
        child: Text("Check your email,",
            style: TextStyle(
                color: Colors.white, fontFamily: 'poppins', fontSize: 22)),
      );

  Widget textEmail() => Center(
        child: Text(getEmail(widget.myEmail),
            style: TextStyle(
                color: Colors.white, fontFamily: 'poppins', fontSize: 22)),
      );

  Widget buildButton() => ButtonWidget(
        text: 'Login',
        onClicked: () async {
              Navigator.push(
              context,
            MaterialPageRoute(builder: (context) => SignIn()));
            }
      );

  Widget buildNoAccount() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Didn\'t recieve the email?',
              style: TextStyle(color: Color(0xFFFFFFFF))),
          TextButton(
            child: const Text(
              'Re-set Password',
              style: TextStyle(decoration: TextDecoration.underline),
            ),
            onPressed: () {
              
              // return widget.toggleView2();
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ForgotPassword()));


            },
            style: TextButton.styleFrom(
              primary: const Color(0xFFFFFFFF),
              // Text Color
            ),
          ),
        ],
      );

}

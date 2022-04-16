import 'package:flutter/material.dart';
import 'package:lums_social_app2/screens/news/addNews.dart';
import 'package:lums_social_app2/screens/news/noNews.dart';
import 'package:lums_social_app2/screens/Admin/addEvent.dart';
import 'package:lums_social_app2/screens/auth/forget_password.dart';
<<<<<<< HEAD
import 'package:lums_social_app2/screens/Admin/editEvent.dart';
=======
import 'package:lums_social_app2/screens/auth/register.dart';
import 'package:lums_social_app2/screens/wrapper.dart';
>>>>>>> 101ad0eaf255dedee516b41df017ad41c3db04a5
import 'package:lums_social_app2/services/auth.dart';
import 'package:lums_social_app2/widget/button_widget.dart';

class SignIn extends StatefulWidget {
  // final Function toggleView;
  // final Function toggleView2;
  // const SignIn({required this.toggleView, required this.toggleView2});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  // email,password and error are common
  String email = "";
  String password = "";
  String error = "";
  bool _isObscure = false;

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
<<<<<<< HEAD
                // bismahTestButton(),
=======
>>>>>>> 101ad0eaf255dedee516b41df017ad41c3db04a5
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

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Wrapper()),
            );
            if (result == null) {
              // email error message
              setState(() {
                error = 'Could not sign in with those credentials';
              });
            }
          }
        },
      );

  Widget LogInText() => const Center(
        child: Text("Enter Credentials",
            style: TextStyle(
                color: Colors.white, fontFamily: 'poppins', fontSize: 25)),
      );
  Widget bismahTestButton() => ButtonWidget(
      //  0xFF5DCAD1
      text: 'Test Button',
      onClicked: () async {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddEvent()),
        );
      });
  Widget ErrorWidget() => Text(
        error,
        style: const TextStyle(color: Colors.red, fontSize: 14.0),
      );

  Widget IconWidget() => Container(
        // margin: EdgeInsets.all(50.0),
        child: const Image(
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
              // widget.toggleView();
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Register()));
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
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ForgotPassword()));

            // return widget.toggleView2();
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
        obscureText: _isObscure,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Password',
          suffixIcon: IconButton(
            icon: Icon(
              _isObscure ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () {
              setState(() {
                _isObscure = !_isObscure;
              });
            },
          ),
        ),
        // autofocus: false,
        // obscureText: true,
      ));
}

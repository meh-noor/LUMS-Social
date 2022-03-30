import 'package:flutter/material.dart';
import 'package:lums_social_app2/services/auth.dart';
import 'package:lums_social_app2/widget/button_widget.dart';
// import 'package:lums_social_app2/widget/email_field_widget.dart';
// import 'package:lums_social_app2/widget/password_field_widget.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  @override
  
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: const Color(0xFF050A30),
      
      // appBar: AppBar(
      //   backgroundColor: const Color(0xFF050A30),
      //   elevation: 0.0,
      //   title: Text('Login to LUMS Social'),
        
      // ),
      
      
      
      // Container(
      //   // margin: EdgeInsets.all(50.0),
        
      //   child: Image(
      //     image: AssetImage('images/finallogo.png'),
          
      //   ),
      // ),

      body: Center(
          child: Form(
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
                  ],
                ),
              ),
            ),
          ),
        ),
      
      
      

      
      // body: Container(
        
      //   padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
      //   child: ElevatedButton(
          
      //     child: Text('Login'),
      //     onPressed: () async {
            
      //       dynamic result = await _auth.signinAnon();
      //       if (result == null) {
      //         print('Error signing in');
      //       } else {
      //         print('Logged in');
      //         print(result);
      //       }
      //     },
      //   ),
      // ),
      
    );
  }
  Widget buildButton() => ButtonWidget(
        //  0xFF5DCAD1
        text: 'Login',
        
        
        onClicked: () async { 
            
            dynamic result = await _auth.signinAnon();
            if (result == null) {
              print('Error signing in');
            } else {
              print('Logged in');
              print(result);
            }
          },
      );
  

  Widget IconWidget() => Container (
      
        // margin: EdgeInsets.all(50.0),
        child: Image(
          image: AssetImage('images/finallogo.png'),fit: BoxFit.cover,
          
        ),
  );

  Widget buildNoAccount() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Don\'t have an account?',
          style: TextStyle(color: Color(0xFFFFFFFF))
          ),
          
          TextButton(
            
            child: Text('SIGN UP',
            style: TextStyle(
              decoration: TextDecoration.underline
            ),),
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

          child: Text('Forgot Password?',style: TextStyle(
              decoration: TextDecoration.underline
            ),),
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
           child: TextField(
                
               decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter email Here',
                suffixIcon: Icon(Icons.email),
                ),
                autofocus: false,
                obscureText: false,
                  )
                );
  Widget passwordTextBox() => Container(
           width: 400,
           color: const Color(0xFFFFFFFF),
           
           child: TextField(
              style: TextStyle(color: Color.fromARGB(255, 2, 2, 2)),
               decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Password Here',
                suffixIcon: Icon(Icons.lock),
                 ),
                autofocus: false,
                obscureText: true,
                

                  )
                );


}

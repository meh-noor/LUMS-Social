import 'package:flutter/material.dart';
import 'package:lums_social_app2/screens/wrapper.dart';

class Splash extends StatefulWidget {
  const Splash ({ Key? key }) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

   _navigatetohome()async{
     await Future.delayed(Duration(milliseconds: 1000), (){});
     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Wrapper()) );
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF050A30),
      body: Center(
          child: Form(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: AutofillGroup(
            child: Column(
              children: [
                IconWidget(),
                const SizedBox(height: 150),
                TextWidget()
              ],
            ),
          ),
        ),
      )),
    );
  }

  Widget TextWidget() => new RichText(
  text: new TextSpan(
    // Note: Styles for TextSpans must be explicitly defined.
    // Child text spans will inherit styles from parent
    style: new TextStyle(
      fontSize: 25.0,
      color: Colors.white,
       fontFamily: 'poppins',
      //  fontWeight: FontWeight.bold,
    ),
    children: <TextSpan>[
      new TextSpan(text: 'LUMS'),
      new TextSpan(text:" "),
      new TextSpan(text: 'SOCIAL', style: new TextStyle(color: Color(0xFF5DCAD1))),
    ],
  ),
 );

  Widget IconWidget() => Container(
        // margin: EdgeInsets.all(50.0),
        child: Image(
          image: AssetImage('images/finallogo.png'),
          // fit: BoxFit.cover,
          width: 450,
          height: 400,
        ),
      );
}
import 'package:flutter/material.dart';
import 'package:lums_social_app2/services/auth.dart';


class NoNews extends StatefulWidget 
{
  @override
  State<NoNews> createState() => _NoNewsState();
}

class _NoNewsState extends State<NoNews> 
{
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) 
  {
    
    return Container(
      decoration: const BoxDecoration
      (
          image: DecorationImage
          (
            image: AssetImage('images/newsBG.png'),
            fit: BoxFit.cover
          )
      ),
  
      child: Scaffold
      (
        backgroundColor: Colors.transparent,
        
        body: Align
        (
          alignment: const Alignment(0.2, -0.7),  
          child: Form
          (
            child: SingleChildScrollView
            (
              padding: const EdgeInsets.all(16),
              child: AutofillGroup
              (
                child: Column
                (
                  children: 
                  [
                    title(),
                    subtitle(),
                    box(),
                    //text()
                  ],
              )
            )
          )
            )
        )
      )
    );
  }
}

Widget title() => Container
(
    //alignment: Alignment.topCenter,
    padding: const EdgeInsets.fromLTRB(60, 20, 60, 10),
    child:const Text("Weekly News",
        style: TextStyle(fontSize: 30, color: Color(0xFF0e1337), fontFamily: 'Poppins',  fontWeight: FontWeight.w500),)  
);

Widget subtitle() => Container
(
    //alignment: Alignment.topCenter,
    padding: const EdgeInsets.fromLTRB(60, 0, 60, 10),
    child:const Text("Discover the lastest news", textAlign: TextAlign.center,
        style: TextStyle(fontSize: 14, color: Color(0xFF4d4b4b), fontFamily: 'Poppins',  fontWeight: FontWeight.w500),)  
);


Widget box() => Container
(
  padding: const EdgeInsets.fromLTRB(0, 240, 0, 0),

  child: Container
  (
    width: 313,
    height: 100,
   decoration: BoxDecoration
   (
      borderRadius: BorderRadius.circular(10),
      boxShadow: const 
      [
          BoxShadow(
              color: Color(0x3f000000),
              blurRadius: 2,
              offset: Offset(0, 4),
          ),
      ],
      color: const Color(0xFFFBF6F0),
  ),
          
  child: const Center
  (
     
    child: Text(
      "No recent news available. \n Check in later!", textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 18,
        color: Color(0xFF000000),
      ),
     
    ),
  ),
)
);

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lums_social_app2/services/auth.dart';


class NewsStudent extends StatefulWidget 
{
  @override
  State<NewsStudent> createState() => _NewsStudentState();
}

class _NewsStudentState extends State<NewsStudent> 
{
  

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) 
  {
    final List colors = 
    [
      const Color(0xffDDFFE7),
      const Color(0xff98D7C2),
      const Color(0xffc8e1cc),
      const Color(0xffe0f0e3),
      const Color(0xffABC7A2)

    ];

final List colorsB = 
[
   const Color(0xffa4dded),
   const Color(0xffa7d8de),
   const Color(0xffb0e0e6),
   const Color(0xfface5ee),
   const Color(0xffc9e5ee),
];

final _random = Random();
    
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
                    box(context, _random, colors, colorsB),
                    box(context, _random, colors, colorsB),
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


Widget box(context, _random, colors, colorsB) => Container
(
  padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),

  child: Container
  (
    width: 380,
    height: 120,
   decoration: BoxDecoration
   (
      borderRadius: BorderRadius.circular(10),
      boxShadow: const 
      [
          BoxShadow
          (
              color: Color(0x3f000000),
              blurRadius: 2,
              offset: Offset(0, 4),
          ),
      ],
      color: colors[_random.nextInt(4)],
      //color: const Color(0xFFFBF6F0),
  ),

child:Row
(
    //mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>
    [
      Expanded(
        flex: 2,
        child: Container(
          padding: const EdgeInsets.only(left: 8, right: 3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>
            [
              // **************************** FETCH TITLE ***********************
               Padding
              (
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                child:Text
              (
                'L’Oreal Brandstorm 2022',
                style: TextStyle (fontFamily: 'Poppins', color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600 ),
              ),
              ),
              // **************************** FETCH Author ***********************
              Padding
              (
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Text
                  (
                    'Career Services Office',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle (fontFamily: 'Poppins', color: Colors.black,fontSize: 14,),
                  ),
              ),
            ],
          ),
        ),
      ),
       Padding
      (
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          // **************************** FETCH Picture ***********************
           child: ClipRRect
            (
            borderRadius: BorderRadius.circular(10),
            child: const Image
            (
                image: AssetImage('images/dummyImage.jpg'),
                height: 83,
                width: 83,
                    fit: BoxFit.fill,
            ),
            )
      ),
       Padding
      (
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      
          child: IconButton
          (
            onPressed: ()  
            { 
              // var async;
              // async; 
              // {
              //   Navigator.push(context, MaterialPageRoute(builder: (context) => const EditYear()),);
              // }
            } , 
            icon: const Icon
            (
              Icons.navigate_next, size: 30, color: Colors.black,
              
            ), 
          )
      )
    ],
  ),
)
);

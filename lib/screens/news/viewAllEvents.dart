import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:lums_social_app2/services/auth.dart';



class AllEvents extends StatefulWidget 
{
  @override
  State<AllEvents> createState() => _AllEventsState();
}

class _AllEventsState extends State<AllEvents> 
{
  final items = 
  [ 'Academic', 'Non-Academic'];
  String? value;

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) 
  {
    final List colors = 
    [
      const Color(0xffFB6F92).withOpacity(0.7),
      const Color(0xffB594CA).withOpacity(0.7),
      const Color(0xff85E281).withOpacity(0.7),
      const Color(0xffFFFF01).withOpacity(0.7),
      const Color(0xffABC7A2).withOpacity(0.7)

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
        
        // body: Align
        // (
        //   alignment: const Alignment(0.2, -0.7),  
        //   child: Form
        //   (
          body: ListView
          (
          children: <Widget>
          [
            FormBuilder
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
                        Padding
                        (
                          padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
                          child:searhBar(),
                        ),
                        Padding
                        (
                            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                            child:SizedBox
                            (
                              width:150,
                            child: DropdownButtonFormField<String> 
                            (
                              menuMaxHeight: 150,

                              decoration: const InputDecoration
                              (labelText: 'Filter',
                                //border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.only(left: 15.0)),
                              //value:value,
                              isExpanded: true,
                              isDense: false,
                              icon: const Icon(Icons.arrow_drop_down, color:Colors.black),
                              items: items.map(buildMenu).toList(),
                              //********************* STORE VALUE **********************/
                              onChanged:(value) => setState(()=> this.value = value),
                            )
                            )
                        ),
                        Padding
                        (
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child:box(context, _random, colors, colorsB),

                        ),
                        //box(context, _random, colors, colorsB),
                        //box(context, _random, colors, colorsB),
                        //text()
                      ],
                  )
                )
            )
          
          )
          ]
            
        )
      )
    );
  }
}

DropdownMenuItem<String> buildMenu (String item)=>DropdownMenuItem
(
  value: item, 
  child: Text
  (
    item,
    style: const TextStyle(fontSize: 16),

  )
);

Widget title() => Container
(
    //alignment: Alignment.topCenter,
    padding: const EdgeInsets.fromLTRB(60, 50, 60, 10),
    child:const Text("View all Events",
        style: TextStyle(fontSize: 30, color: Color(0xFF0e1337), fontFamily: 'Poppins',  fontWeight: FontWeight.w500),)  
);

Widget subtitle() => Container
(
    //alignment: Alignment.topCenter,
    padding: const EdgeInsets.fromLTRB(60, 0, 60, 10),
    child:const Text("Discover all events now", textAlign: TextAlign.center,
        style: TextStyle(fontSize: 14, color: Color(0xFF4d4b4b), fontFamily: 'Poppins',  fontWeight: FontWeight.w500),)  
);

Widget searhBar() =>Container
(
  
  width: double.infinity,
  height: 40,
  color: Colors.white,
  child: const Center
  (
    child: TextField
    (
      decoration: InputDecoration
      (
          hintText: 'Search For...',
          prefixIcon: Icon(Icons.search),
          
          //suffixIcon: Icon(Icons.filter)
      ),
      
    ),
  ),
);



Widget box(context, _random, colors, colorsB) => Container
(
  padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),

  child: Container
  (
    width: 350,
    height: 100,
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
      color: colors[_random.nextInt(5)],
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
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child:Text
              (
                '“Diplomatic Footprints” Book Launch',
                style: TextStyle (fontFamily: 'Poppins', color: Colors.black,fontSize: 12,fontWeight: FontWeight.w600 ),
              ),
              ),
              // **************************** FETCH Date ***********************
              Padding
              (
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Text
                  (
                    '2022-04-10',
                    //maxLines: 2,
                    //overflow: TextOverflow.ellipsis,
                    style: TextStyle (fontFamily: 'Poppins', color: Colors.black,fontSize: 11,),
                  ),
              ),

              // **************************** FETCH Time ***********************
              Padding
              (
                padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                child: Text
                  (
                    '9:00 PM',
                    //maxLines: 2,
                    //overflow: TextOverflow.ellipsis,
                    style: TextStyle (fontFamily: 'Poppins', color: Colors.black,fontSize:11,),
                  ),
              ),
              // **************************** FETCH Location ***********************
               Padding
              (
                padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                child: Text
                  (
                    'SAHSOL SABCR 0-01',
                    //maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle (fontFamily: 'Poppins', color: Colors.black,fontSize:11,),
                  ),
              ),
            ],
          ),
        ),
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


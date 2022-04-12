import 'package:flutter/material.dart';
import 'package:lums_social_app2/services/auth.dart';
import 'package:lums_social_app2/widget/button_widget.dart';

class newsButton extends StatefulWidget 
{
  //final Function toggleView;
  //newsButton({required this.toggleView});

  @override
  State<newsButton> createState() => _newsButtonState();
}

class _newsButtonState extends State<newsButton> 
{
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      backgroundColor: const Color(0xFFFFFFFF),
      
      body: Align(
        alignment: const Alignment(0.2, -0.7),
        
          
          child: Form(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: AutofillGroup(
            child: Column(
              children: 
              [
                title(),
                date(),
                //time(),
                image(),
                text(),
                author(),
                authorName(),
                editButton()
              ],
            )
          )
        )
          )
      )
    );
  }
}
// ********************************** FETCH HEADLINE **********************************
Widget title() => Container
(
    alignment: Alignment.topLeft,
    padding: const EdgeInsets.fromLTRB(35, 60, 20, 20),
    child:const Text("L’Oreal Brandstorm 2022: Registeration deadline extended",
        style: TextStyle(fontSize: 25, color: Color(0xFF5DCAD1), fontWeight: FontWeight.bold, fontFamily: 'Poppins'),)  
);

// ********************************** FETCH DATE **********************************
Widget date() => Container
(
    alignment: Alignment.topLeft,
    padding: const EdgeInsets.fromLTRB(35, 0, 0, 5),
    child:const Text("7/03/2022",
        style: TextStyle(fontSize: 14, color: Color(0xffA19F9F), fontFamily: 'Poppins'),)  
);

// // FETCH TIME
// Widget time() => Container
// (
//     alignment: Alignment.topLeft,
//     padding: const EdgeInsets.fromLTRB(35, 0, 0, 20),
//     child:const Text("11:10 AM",
//         style: TextStyle(fontSize: 14, color: Color(0xffA19F9F), fontFamily: 'Poppins'),)  
// );

// ********************************** FETCH IMAGE **********************************
Widget image() => Container
(
  alignment: Alignment.topLeft,
  
  padding: const EdgeInsets.fromLTRB(25, 0, 0, 20),
  child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
  child: const Image
  (
      image: AssetImage('images/dummyImage.jpg'),
      fit: BoxFit.cover,
  ),
  )
);


// ********************************** FETCH NEWS DESC **********************************
Widget text() => Container
(
    alignment: Alignment.topLeft,
    padding: const EdgeInsets.fromLTRB(50, 0, 0, 50),
    child:const Text("Good news Brandstormers – you now have three more days to register yourselves on the  Brandstorm 2022 portal AND submit your idea in the form of 3 slides.  For any questions, help or feedback please reach out to the Brandstorm Manager -  Zoha Arif at zoha.arif@loreal.com",
        style: TextStyle(fontSize: 12, color: Color(0xFF000000),  fontFamily: 'Poppins', height: 4),)  
);

Widget author() => Container
(
    alignment: Alignment.topLeft,
    padding: const EdgeInsets.fromLTRB(35, 0, 0, 5),
    child:const Text("Author",
        style: TextStyle(fontSize: 14, color: Color(0xffA19F9F), fontFamily: 'Poppins'),)  
);

// ********************************** FETCH AUTHOR **********************************
Widget authorName() => Container
(
    alignment: Alignment.topLeft,
    padding: const EdgeInsets.fromLTRB(35, 0, 0, 0),
    child:const Text("Career Services Office",
        style: TextStyle(fontSize: 14, color: Color(0xFF000000), fontFamily: 'Poppins'),)  
);


Widget editButton() => Container
(
  alignment: Alignment.bottomRight,
  
  padding: const EdgeInsets.fromLTRB(25, 0, 0, 20),
  child: InkWell(
              onTap: () {},
  
  child: const Image
  (
      image: AssetImage('images/editImage.png'),
      fit: BoxFit.cover,
      
      
  ),
  )
  
  
);
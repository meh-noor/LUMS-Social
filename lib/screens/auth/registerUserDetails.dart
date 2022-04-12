import 'package:flutter/material.dart';
import 'package:lums_social_app2/services/auth.dart';
import 'package:lums_social_app2/widget/next_button.dart';
import 'package:lums_social_app2/widget/button_widget.dart';

import '../../widget/dropDown.dart';
import '../home/home.dart';

class RegisterDetails extends StatefulWidget {
  // const RegisterDetais({Key? key}) : super(key: key);

  // final Function toggleView;
  // RegisterDetails({required this.toggleView});
  @override
  State<RegisterDetails> createState() => _RegisterStateDetails();
}

class _RegisterStateDetails extends State<RegisterDetails> {
  final AuthService _auth = AuthService();

  String email = "";
  String password = "";
  String error = "";
  String reEnterPassword = "";
  String name = "";
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
                const SizedBox(height: 80),

                IconWidget(),
                const SizedBox(height: 20),

                CreateAccText(),
                const SizedBox(height: 70),
                schoolText(),
                const SizedBox(height: 10),

                schoolTextBox(),
                const SizedBox(height: 20),
                gradYearText(),
                const SizedBox(height: 10),

                graduatingYearTextBox(),
                const SizedBox(height: 20),
                majorText(),
                const SizedBox(height: 10),

                majorTextBox(),
                const SizedBox(height: 10),
                // reEnterpasswordTextBox(),
                // buildForgotPassword(),
                const SizedBox(height: 20),
                NextButton(),
                const SizedBox(height: 10),
                // toggleToSignIn(),
                const SizedBox(height: 200),
                // NextButton(),
                // ErrorWidget(),
              ],
            ),
          ),
        ),
      )),
    );
  }

// Widget mySizedBox()
  Widget NextButton() => ButtonWidget(
      //  0xFF5DCAD1
      text: 'Next',
      onClicked: ()  {
        Navigator.push(
          
        context,
        MaterialPageRoute(builder: (context) => Home()));
      });

  Widget ErrorWidget() => Text(
        error,
        style: TextStyle(color: Colors.red, fontSize: 14.0),
      );

  Widget IconWidget() => Container(
        // margin: EdgeInsets.all(50.0),
        child: Image(
          image: AssetImage('images/Tune.png'), 
          // width: 500,
          // height: 500,
          fit: BoxFit.fill,
        ),
      );

  Widget schoolText() => Container(
        child: Text("Select School: ",
            style: TextStyle(
                color: Colors.white, fontFamily: 'poppins', fontSize: 18)),
                alignment: Alignment.centerLeft,
                
      );
  
   Widget gradYearText() => Container(
        child: Text("Select Graduating Year: ",
            style: TextStyle(
                color: Colors.white, fontFamily: 'poppins', fontSize: 18)),
                alignment: Alignment.centerLeft,

      );
    
    Widget majorText() => Container(
        child: Text("Select Current/Intended Major: ",
            style: TextStyle(
                color: Colors.white, fontFamily: 'poppins', fontSize: 18)),
                alignment: Alignment.centerLeft,

      );

  Widget CreateAccText() => Center(
        child: Text("Help Us Customize!",
            style: TextStyle(
                color: Colors.white, fontFamily: 'poppins', fontSize: 22)),
       
      );

  final gradYear = [for (var i = 1997; i < 2050; i++) (i).toString()];

  final majors = ['Accounting and Finance','Management Sciences', 'English','History','Anthropology and Sociology'
  ,'Economics','Economics and Mathemetics','Political Science','Politics and Economics','Biology','Chemical Engineering', 'Chemistry','Computer Science','Electrical Engineering','Mathemetics','Physics','LLB'];

  final schoolList = [ 'MGHSS', 'SAHSOL', 'SDSB' , 'SOE',  'SSE'];
  
  String? value;
  DropdownMenuItem<String> buildMenu (String item)=>DropdownMenuItem
  (
    value: item, 
    child: Text
    (
      item,
      style: const TextStyle(fontSize: 16),

    )
    
  );

  Widget schoolTextBox() => 
  Container(
    color: Colors.white,
  child:Form(
    child: SizedBox
    (
      width:380,
    child: DropdownButtonFormField<String> 
    (
      menuMaxHeight: 200,

      decoration: const InputDecoration
      (
        hintText: 'New School',
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.only(left: 15.0)),
      //value:value,
      isExpanded: true,
      isDense: false,
      
      icon: const Icon(Icons.arrow_drop_down, color:Colors.black),
      items: schoolList.map(buildMenu).toList(),
      
      validator: (val) => val!.isEmpty ? 'Enter School' : null,
      
     
      onChanged:(value) => setState(()=> this.value = value),
      
    )
    )));
  
  Widget graduatingYearTextBox() => 
  Container(
     color: const Color(0xFFFFFFFF),
    
  child:SizedBox
    (
      
      width:380,
    
    child: DropdownButtonFormField<String> 
    (
      // style: Colors.white,
      menuMaxHeight: 200,
      
      decoration: const InputDecoration
      (
        hintText: 'Graduating Year',
        
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.only(left: 15.0)),
      //value:value,
      isExpanded: true,
      isDense: false,
      
      icon: const Icon(Icons.arrow_drop_down, color:Colors.black),
      items: gradYear.map(buildMenu).toList(),
      onChanged:(value) => setState(()=> this.value = value),
    )
    ));

  Widget majorTextBox() =>
  Container(
    color: Colors.white,
  child:SizedBox
    (
      width:380,
    
    child: DropdownButtonFormField<String> 
    (
      
      menuMaxHeight: 200,
      
      decoration: const InputDecoration
      
      (
        hintText: 'Major',
        
      // fillColor: Colors.white,
        border: OutlineInputBorder(),
        
      contentPadding: EdgeInsets.only(left: 15.0)),
      isExpanded: true,
      isDense: false,
      
      icon: const Icon(Icons.arrow_drop_down, color:Colors.black),
      items: majors.map(buildMenu).toList(),
      onChanged:(value) => setState(()=> this.value = value),
    )
    ));
}

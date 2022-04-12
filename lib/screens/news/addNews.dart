import 'package:flutter/material.dart';
import 'package:lums_social_app2/services/auth.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:lums_social_app2/widget/upload_widget.dart';

class upload 
{
  Future uploadImageToFirebase(BuildContext context) async 
  {
    final XFile? image =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child("images/" + DateTime.now().toString());
    UploadTask uploadTask = ref.putFile(File(image!.path));
    uploadTask.then((res) {
      res.ref.getDownloadURL();
    });
  }
}
class AddNews extends StatefulWidget 
{
  @override
  State<AddNews> createState() => _AddNewsState();
}

class _AddNewsState extends State<AddNews> 
{
  final imageFile = upload();
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
        
        // body: Align
        // (
        //   alignment: const Alignment(0.2, -0.7),  
          body: ListView
          (
          children: <Widget>
          [
            FormBuilder
            (
                child: SingleChildScrollView
                (
                    child: Column
                    (children: 
                    [
                      title(),
                      instructions(),
                      newsHeadline(),
                      space(),
                      newsAuthor(),
                      space(),
                      newsDesc(),
                      space(),
                      calImage(),
                      dateField(),
                      //space(),
                      //uploadImage(),
                      Row
                      (
                        children: 
                        [
                          Expanded
                        (
                          child: Padding
                          (
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child:uploadImage()
                          )
                          
                        ),
                        Expanded
                        (
                          child: Padding
                          (
                            padding: const EdgeInsets.fromLTRB(30, 8, 15, 4),
                              child: UploadWidget
                              (
                                text: 'upload',
                                onClicked: () => 
                                //************************************  ADD PICTURE in db ************************************ */
                                  imageFile.uploadImageToFirebase(context),
                              )
                            )
                            
                        )
                        ]
                      ),
                      Padding
                      (
                        padding: const EdgeInsets.fromLTRB(15, 8, 15, 4),
                        child: finalButton()
                      )
                    ],
                    )
                )
            )
          ]
          )
      )
    );
  }
}

Widget space() => Container
(
  padding: const EdgeInsets.fromLTRB(15, 15, 15, 10)                   
);


Widget title() => Container
(
    //alignment: Alignment.topCenter,
    padding: const EdgeInsets.fromLTRB(60, 70, 60, 0),
    child:const Text("Add News",
        style: TextStyle(fontSize: 30, color: Color(0xFF0e1337), fontFamily: 'Poppins',  fontWeight: FontWeight.w500),)  
);

Widget instructions() => Container
(
    //alignment: Alignment.topCenter,
    padding: const EdgeInsets.fromLTRB(10, 100, 10, 20),
    child:const Text("Please fill in the following details carefully to add your news.",
        style: TextStyle(fontSize: 18, color: Colors.black, fontFamily: 'Poppins'),)  
);

//************************************  ADD HEADLINE in db ************************************ */
Widget newsHeadline() => SizedBox
(
  width: 380,
    child: FormBuilderTextField(
      name: 'title',
      decoration: const InputDecoration
      (
          labelText: "Enter News Headline",
          border: OutlineInputBorder(),
           contentPadding: EdgeInsets.only(left: 15.0)
      ),
    )
);

//************************************  ADD AUTHOR in db ************************************ */

Widget newsAuthor() => SizedBox
(
  width: 380,
    child: FormBuilderTextField(
      name: 'title',
      decoration: const InputDecoration
      (
          labelText: "Enter Name of Author",
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.only(left: 15.0)
      ),
    )
);

//************************************  ADD DESC in db ************************************ */

Widget newsDesc() => SizedBox
(
  width: 380,
    child: FormBuilderTextField(
      name: 'title',
      decoration: const InputDecoration
      (
          labelText: "Add description",
          border: OutlineInputBorder(),
          //contentPadding: const EdgeInsets.only(left: 15.0)
          contentPadding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
      ),
    )
);


Widget calImage() => Row
(
  children: 
  const [
    
    Icon(Icons.calendar_today, size: 30, color: Color(0xFF050A30)),
    Padding(
        padding: EdgeInsets.all(5.0),
        child: Text(
          'Published on:',
          style: TextStyle
          (
            fontFamily: 'Poppins',
            color: Colors.black,
            fontSize: 15,
            // padding: const EdgeInsets.all(15.0),
          ),
        )),
  ],
);

//************************************  ADD CURRENT DATE in db ************************************ */

Widget dateField() => Container
(
  alignment: Alignment.topLeft,
  padding: const EdgeInsets.fromLTRB(35, 0, 0, 5),
  child: Text(DateFormat("dd-MM-yyyy").format(DateTime.now()),
  style: const TextStyle(fontSize: 16, color: Color(0xFF616161), fontFamily: 'Poppins')),
     
);


Widget uploadImage() => Row
(
  children: 
  const 
  [
    
    Icon(Icons.image, size: 30, color: Color(0xFF050A30)),
    Padding
    (
      padding: EdgeInsets.all(5.0),
      child: Text('Upload image:',
            style: TextStyle (fontFamily: 'Poppins', color: Colors.black,fontSize: 15,),)
    ),
  ],
);


Widget finalButton() => ElevatedButton
(
    style: ElevatedButton.styleFrom(
      primary: const Color(0xFF5DCAD1),
      minimumSize: const Size.fromHeight(50),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
    ),
    child: const FittedBox
    (
      child: Text('Add Event',
      style: TextStyle(fontSize: 20, color: Colors.white, decoration: TextDecoration.underline),
      ),
    ),
    onPressed: () async {},
);
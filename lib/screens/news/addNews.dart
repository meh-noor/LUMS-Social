import 'package:flutter/material.dart';
import 'package:lums_social_app2/screens/Admin/adminDashboard.dart';
import 'package:lums_social_app2/services/auth.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:lums_social_app2/widget/button_widget.dart';
import 'package:lums_social_app2/widget/upload_widget.dart';
import 'package:lums_social_app2/services/addToCollection.dart';
import 'package:provider/provider.dart';
import 'package:lums_social_app2/models/user.dart';

class upload {
  Future<String?> uploadImageToFirebase(BuildContext context) async {
    final XFile? image =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child("news/" + DateTime.now().toString());
    UploadTask uploadTask = ref.putFile(File(image!.path));
    String downloadURL = await (await uploadTask).ref.getDownloadURL();
    // print(downloadURL);
    // uploadTask.then((res) {
    //   print(res.ref.getDownloadURL());
    // });
    return downloadURL;
  }
}

String? headlines;
String? news_author;
String? description;
DateTime? start_date = DateTime.now();
String? imageURL;
bool imageUploadComplete = false;

class AddNews extends StatefulWidget {
  @override
  State<AddNews> createState() => _AddNewsState();
}

class _AddNewsState extends State<AddNews> {
  // final imageFile = upload();
  final imageFile = upload();
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser?>(context);

    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/newsBG.png'), fit: BoxFit.cover)),
        child: Scaffold(
            backgroundColor: Colors.transparent,

            // body: Align
            // (
            //   alignment: const Alignment(0.2, -0.7),
            body: ListView(children: <Widget>[
              FormBuilder(
                  child: SingleChildScrollView(
                      child: Column(
                children: [
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
                  Row(
                    children: [
                      Expanded(
                          child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 15.0,
                                  right: 15.0,
                                  bottom: 4.0,
                                  top: 8.0),
                              child: AddImage())),
                      Expanded(
                          child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 30.0,
                                  right: 15.0,
                                  bottom: 4.0,
                                  top: 8.0),
                              child: ButtonWidget(
                                  text: 'Upload',
                                  onClicked: () async => {
                                        imageURL = await imageFile
                                            .uploadImageToFirebase(context),
                                        print('ye wala'),
                                        print(imageURL),
                                        imageUploadComplete = true,
                                      }))),
                    ],
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(15, 8, 15, 4),
                      child: finalButton(user))
                ],
              )))
            ])));
  }

  Widget AddImage() => Row(
        children: [
          Icon(Icons.photo, size: 30, color: Color(0xFF050A30)),
          Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                'Upload Image',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.black,
                  fontSize: 18,
                  // padding: const EdgeInsets.all(15.0),
                ),
              )),
        ],
      );

  Widget space() =>
      Container(padding: const EdgeInsets.fromLTRB(15, 15, 15, 10));

  Widget title() => Container(
      //alignment: Alignment.topCenter,
      padding: const EdgeInsets.fromLTRB(60, 70, 60, 0),
      child: const Text(
        "Add News",
        style: TextStyle(
            fontSize: 30,
            color: Color(0xFF0e1337),
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500),
      ));

  Widget instructions() => Container(
      //alignment: Alignment.topCenter,
      padding: const EdgeInsets.fromLTRB(10, 100, 10, 20),
      child: const Text(
        "Please fill in the following details carefully to add your news.",
        style:
            TextStyle(fontSize: 18, color: Colors.black, fontFamily: 'Poppins'),
      ));

//************************************  ADD HEADLINE in db ************************************ */
  Widget newsHeadline() => SizedBox(
      width: 380,
      child: FormBuilderTextField(
          name: 'title',
          decoration: const InputDecoration(
              labelText: "Enter News Headline",
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.only(left: 15.0)),
          validator: (val) => val!.isEmpty ? "Please enter headline" : null,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: (val) => {headlines = val}));

//************************************  ADD AUTHOR in db ************************************ */

  Widget newsAuthor() => SizedBox(
      width: 380,
      child: FormBuilderTextField(
          name: 'news_author',
          decoration: const InputDecoration(
              labelText: "Enter Name of Author",
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.only(left: 15.0)),
          validator: (val) => val!.isEmpty ? "Please enter author name" : null,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: (val) => {news_author = val}));

//************************************  ADD DESC in db ************************************ */

  Widget newsDesc() => SizedBox(
      width: 380,
      child: FormBuilderTextField(
          name: 'news_story',
          decoration: const InputDecoration(
            labelText: "Add description",
            border: OutlineInputBorder(),
            //contentPadding: const EdgeInsets.only(left: 15.0)
            contentPadding:
                EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
          ),
          validator: (val) => val!.isEmpty ? "Please enter news story" : null,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: (val) => {description = val}));

  Widget calImage() => Row(
        children: const [
          Icon(Icons.calendar_today, size: 30, color: Color(0xFF050A30)),
          Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                'Published on:',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.black,
                  fontSize: 15,
                  // padding: const EdgeInsets.all(15.0),
                ),
              )),
        ],
      );

//************************************  ADD CURRENT DATE in db ************************************ */

  Widget dateField() => Container(
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.fromLTRB(35, 0, 0, 5),
        child: Text(DateFormat("dd-MM-yyyy").format(DateTime.now()),
            style: const TextStyle(
                fontSize: 16, color: Color(0xFF616161), fontFamily: 'Poppins')),
      );

  Widget uploadImage() => Row(
        children: const [
          Icon(Icons.image, size: 30, color: Color(0xFF050A30)),
          Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                'Upload image:',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.black,
                  fontSize: 15,
                ),
              )),
        ],
      );

  Widget finalButton(user) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: const Color(0xFF5DCAD1),
          minimumSize: const Size.fromHeight(50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        child: const FittedBox(
          child: Text(
            'Add News',
            style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                decoration: TextDecoration.underline),
          ),
        ),
        onPressed: () async {
          if (headlines!.isNotEmpty &&
              news_author!.isNotEmpty &&
              description!.isNotEmpty &&
              imageUploadComplete) {
            addNewsToCollection().addNewsToDatabase(headlines, news_author,
                description, DateTime.now(), user?.uid, imageURL);
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => admin()));
          } else if (imageUploadComplete != true) {
            Text('Please wait for the picture to upload');
          }
        },
      );
}

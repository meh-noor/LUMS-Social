import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:lums_social_app2/screens/Admin/hashtags.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lums_social_app2/widget/button_widget.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class upload {
  Future uploadImageToFirebase(BuildContext context) async {
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

class EditEvent extends StatefulWidget {
  @override
  State<EditEvent> createState() => _EditEventState();
}

class _EditEventState extends State<EditEvent> {
  String email = '';
  final imageFile = upload();

  // List tags = new List(5);
  final _formKey = GlobalKey<FormBuilderState>();
  final _globalKey = GlobalKey<TagsState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: ListView(children: <Widget>[
          FormBuilder(
              child: SingleChildScrollView(
            child: Column(children: [
              blueDecor(),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, bottom: 10.0, top: 15.0),
                child: subText(),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, bottom: 4.0, top: 15.0),
                child: nameField(),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, bottom: 4.0, top: 15.0),
                child: OrganiserField(),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, bottom: 4.0, top: 15.0),
                child: LocationField(),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, bottom: 4.0, top: 15.0),
                child: DescriptionField(),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, bottom: 4.0, top: 15.0),
                child: FilterCategory(),
              ),
              Row(
                children: [
                  Expanded(
                      child: Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, right: 15.0, bottom: 4.0, top: 8.0),
                          child: DateField())),
                  Expanded(
                      child: Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, right: 15.0, bottom: 4.0, top: 8.0),
                          child: TimeField())),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, right: 15.0, bottom: 4.0, top: 8.0),
                          child: AddImage())),
                  Expanded(
                      child: Padding(
                          padding: const EdgeInsets.only(
                              left: 30.0, right: 15.0, bottom: 4.0, top: 8.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFF5DCAD1),
                              minimumSize: Size.fromHeight(30),
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(5.0),
                              ),
                            ),
                            child: FittedBox(
                              child: Text(
                                'Upload',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                            onPressed: () =>
                                imageFile.uploadImageToFirebase(context),
                          ))),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, right: 15.0, bottom: 15.0, top: 8.0),
                          child: EditButton())),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(
                        left: 30.0, right: 15.0, bottom: 15.0, top: 8.0),
                    child: deleteButton(),
                  )),
                ],
              ),
              const SizedBox(height: 10),
            ]),
          ))
        ]));
  }
}

Widget blueDecor() => Image(
      image: AssetImage('images/editbackground.png'),
      fit: BoxFit.cover,
      height: 250,
      width: 600,
      alignment: Alignment.topCenter,
    );

Widget subText() => Text(
      'Please fill in the following details carefully to add your event.',
      style: TextStyle(
        fontFamily: 'Poppins',
        color: Colors.black,
        fontSize: 18,
        // padding: const EdgeInsets.all(15.0),
      ),
    );

Widget nameField() => FormBuilderTextField(
      name: 'title',
      decoration: InputDecoration(
          hintText: "Enter Event Name",
          border: OutlineInputBorder(),
          contentPadding: const EdgeInsets.only(left: 15.0)),
    );
Widget OrganiserField() => FormBuilderTextField(
      name: 'title',
      decoration: InputDecoration(
          hintText: "Enter Organizer Name",
          border: OutlineInputBorder(),
          contentPadding: const EdgeInsets.only(left: 15.0)),
    );
Widget LocationField() => FormBuilderTextField(
      name: 'title',
      decoration: InputDecoration(
          hintText: "Enter Location",
          border: OutlineInputBorder(),
          contentPadding: const EdgeInsets.only(left: 15.0)),
    );
Widget DescriptionField() => FormBuilderTextField(
      name: 'title',
      maxLines: 6,
      minLines: 1,
      decoration: InputDecoration(
          hintText: "Enter Description",
          border: OutlineInputBorder(),
          contentPadding: const EdgeInsets.only(left: 15.0)),
    );

Widget DateField() => FormBuilderDateTimePicker(
    name: 'date',
    initialValue: DateTime.now(),
    fieldHintText: "Add Date",
    inputType: InputType.date,
    decoration: InputDecoration(
      labelText: "Select Date",
      labelStyle: TextStyle(fontSize: 22),
      border: InputBorder.none,
      prefixIcon:
          Icon(Icons.calendar_today, size: 30, color: Color(0xFF050A30)),
      // contentPadding: const EdgeInsets.only(left: 15.0)),
    ));

Widget TimeField() => FormBuilderDateTimePicker(
    name: 'time',
    initialTime: TimeOfDay(hour: 8, minute: 0),
    fieldHintText: "Add Date",
    inputType: InputType.time,
    decoration: InputDecoration(
      labelText: "Select Time",
      labelStyle: TextStyle(fontSize: 22),
      border: InputBorder.none,
      prefixIcon:
          Icon(Icons.watch_later_rounded, size: 30, color: Color(0xFF050A30)),
      // contentPadding: const EdgeInsets.only(left: 15.0)),
    ));

Widget FilterCategory() => FormBuilderChoiceChip(
      name: 'choice_chip',
      padding: EdgeInsets.all(2.0),
      // runSpacing: 2.0,
      selectedColor: Color(0xFF5DCAD1),
      decoration: InputDecoration(
          labelText: 'Select an option', labelStyle: TextStyle(fontSize: 22)),
      labelPadding: EdgeInsets.all(2.0),
      options: [
        FormBuilderFieldOption(value: 'Test', child: Text('Academic')),
        FormBuilderFieldOption(value: 'Test 1', child: Text('Non-Academic')),
      ],
    );
//
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
Widget EditButton() => ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Color(0xFF5DCAD1),
        minimumSize: Size.fromHeight(40),
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(5.0),
        ),
      ),
      child: FittedBox(
        child: Text(
          'Update',
          style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              decoration: TextDecoration.underline),
        ),
      ),
      onPressed: () async {},
    );

Widget deleteButton() => ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.red,
        minimumSize: Size.fromHeight(40),
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(5.0),
        ),
      ),
      child: FittedBox(
        child: Text(
          'Delete',
          style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              decoration: TextDecoration.underline),
        ),
      ),
      onPressed: () async {},
    );

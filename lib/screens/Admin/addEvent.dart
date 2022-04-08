import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:lums_social_app2/screens/Admin/hashtags.dart';
import 'package:image_picker/image_picker.dart';

class AddEvent extends StatefulWidget {
  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  String email = '';
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
              Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, bottom: 4.0, top: 8.0),
                  child: SizedBox(
                    height: size.height,
                    width: size.width,
                    child: Hashtags(),
                  )),
            ]),
          ))
        ]));
  }
}

Widget blueDecor() => Image(
      image: AssetImage('images/background.png'),
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

// Widget DateTime() {
//   return Row(
//     children: [DateField(), TimeField()],
//   );
// }

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

Widget ImageUpload() => Container();
//       

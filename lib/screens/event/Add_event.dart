import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

class add_event extends StatefulWidget {
  const add_event({Key? key}) : super(key: key);

  @override
  State<add_event> createState() => _add_eventState();
}

class _add_eventState extends State<add_event> {
  final _formKey = GlobalKey<FormBuilderState>();
  String? title = "";
  // String title = "";
  // String title = "";
  // String title = "";0
  // String title = "";
  // String title = "";
  // String title = "";
  // String title = "";
  // String title = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Event"),
        leading: IconButton(
          icon: Icon(
            Icons.clear,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Center(
            child: ElevatedButton(
              style: ButtonStyle(backgroundColor:
                  MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) return Colors.green;
                return Colors.red;
              })),
              onPressed: () async {
                //Save to firebase
              },
              child: Text("Save Event"),
            ),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          FormBuilder(
              child: Column(
            children: [
              FormBuilderTextField(
                name: 'Title',
                decoration: InputDecoration(
                    hintText: "Add Title",
                    contentPadding: const EdgeInsets.only(left: 48.0)),
                validator: (val) => val!.isEmpty ? 'Enter Title' : null,
                onChanged: (val) => {
                  setState(
                    () {
                      title = val;
                    },
                  )
                },
              ),
              Divider(),
              FormBuilderTextField(
                name: "Description",
                maxLines: 7,
                decoration: InputDecoration(
                    hintText: "Add event description",
                    prefixIcon: Icon(Icons.short_text)),
              ),
              Divider(),
              FormBuilderDateTimePicker(
                name: "Start Date",
                firstDate: DateTime.now(),
                initialValue: DateTime.now(),
                fieldHintText: "Add Event Start Date",
                inputType: InputType.date,
                format: DateFormat('EEEE,dd,MMMM,yyyy'),
                decoration: InputDecoration(
                    labelText: "Event Start Date",
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.calendar_today_sharp)),
              ),
              Divider(),
              FormBuilderDateTimePicker(
                name: "End Date",
                firstDate: DateTime.now(),
                initialValue: DateTime.now(),
                fieldHintText: "Add Event End Date",
                inputType: InputType.date,
                format: DateFormat('EEEE,dd,MMMM,yyyy'),
                decoration: InputDecoration(
                    labelText: "Event End Date",
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.calendar_today_sharp)),
              ),
              Divider(),
              FormBuilderDateTimePicker(
                name: "Event Time",
                fieldHintText: "Add Event Time",
                inputType: InputType.time,
                format: DateFormat('HH:mm'),
                initialTime: TimeOfDay(hour: 5, minute: 5),
                decoration: InputDecoration(
                    labelText: "Event Time",
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.timelapse_sharp)),
              )
            ],
          ))
        ],
      ),
    );
  }
}

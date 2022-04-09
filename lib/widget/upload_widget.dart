import 'package:flutter/material.dart';

class UploadWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const UploadWidget({
    Key? key,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Color(0xFF5DCAD1),
          minimumSize: Size.fromHeight(30),
          shape: new RoundedRectangleBorder(
               borderRadius: new BorderRadius.circular(4.0),
              ),
        ),

        child: FittedBox(
          child: Text(
            text,
            style: TextStyle(fontSize: 16, color: Colors.white,
            decoration: TextDecoration.underline),
          ),
        ),
        onPressed: onClicked,
      );
}
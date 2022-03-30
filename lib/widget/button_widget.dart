import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    Key? key,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Color(0xFF5DCAD1),
          minimumSize: Size.fromHeight(50),
          shape: new RoundedRectangleBorder(
               borderRadius: new BorderRadius.circular(10.0),
              ),
        ),

        child: FittedBox(
          child: Text(
            text,
            style: TextStyle(fontSize: 20, color: Colors.white,
            decoration: TextDecoration.underline),
          ),
        ),
        onPressed: onClicked,
      );
}
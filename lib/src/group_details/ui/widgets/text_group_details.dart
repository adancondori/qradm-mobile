import 'package:flutter/material.dart';

class TextGroupDetails extends StatelessWidget{

  String details = "Details";
  TextGroupDetails(this.details);

  Widget build(BuildContext context) {
    final text = Container(
      child: Text(
        details,
        style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontFamily: "Lato"
        ),
      ),
    );
    return text;
  }
}
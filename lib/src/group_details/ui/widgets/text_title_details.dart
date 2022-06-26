import 'package:flutter/material.dart';

class TextGroupTitle extends StatelessWidget{

  String title = "Title";
  TextGroupTitle(this.title);

  Widget build(BuildContext context) {
    final text = Container(
      child: Text(
        title,
        style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontFamily: "Lato",
            fontWeight: FontWeight.bold,
        ),
      ),
    );
    return text;
  }
}
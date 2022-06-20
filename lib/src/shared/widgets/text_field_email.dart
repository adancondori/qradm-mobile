import 'package:flutter/material.dart';

class TextFieldEmail extends StatelessWidget{

  Widget build(BuildContext context) {

    final password = Padding(
      padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 25.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.indigo,
          borderRadius: BorderRadius.circular(25),
        ),
        child: const Padding(
          padding: EdgeInsets.only(left: 15.0),
          child: TextField(
            style: TextStyle(
              fontSize: 15.0,
              fontFamily: "Lato",
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Code',
            ),
          ),
        ),
      ),
    );
    return password;
  }
}
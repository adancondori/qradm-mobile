import 'package:flutter/material.dart';

class TextLogin extends StatelessWidget {
  Widget build(BuildContext context) {
    final text = Container(
      margin: EdgeInsets.only(left: 0, right: 0, top: 40),
      child: Text(
        "LOGIN",
        style: TextStyle(
            color: Colors.white,
            fontSize: 40,
            fontFamily: "Lato",
            fontWeight: FontWeight.bold),
      ),
    );
    return text;
  }
}

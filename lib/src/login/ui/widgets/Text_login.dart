import 'package:flutter/material.dart';

class Text_Login extends StatelessWidget{

  Widget build(BuildContext context) {

    final text = Container(
      child: Text(
        "LOGIN",
        style: TextStyle(
            color: Colors.white,
            fontSize: 40,
            fontFamily: "Lato",
            fontWeight: FontWeight.bold
        ),
      ),
    );
    return text;
  }
}
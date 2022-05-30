import 'package:flutter/material.dart';

class TextFieldPassword extends StatelessWidget{

  Widget build(BuildContext context) {

    final password = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.indigo,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 15.0),
          child: TextField(
            style: const TextStyle(
                fontSize: 15.0,
                fontFamily: "Lato",
            ),
            obscureText: true,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Contraseña',
            ),
          ),
        ),
      ),
    );
    return password;
  }
}
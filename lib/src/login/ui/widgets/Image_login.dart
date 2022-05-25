import 'package:flutter/material.dart';

class Image_Login extends StatelessWidget{

  Widget build(BuildContext context) {

    final img = Container(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: Image.asset(
        "lib/assets/img/login.png",
        height: 200,
        width: 200,
      ),
    );
    return img;
  }
}
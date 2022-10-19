import 'package:flutter/material.dart';

class ImageLogin extends StatelessWidget {
  Widget build(BuildContext context) {
    final img = Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Image.asset(
        "lib/assets/img/logo_event.png",
        height: 250,
        width: 250,
      ),
    );
    return img;
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsPhoto extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 115,
          width: 115,
          child: Stack(
            fit: StackFit.expand,
            children: [
              CircleAvatar(
                  backgroundImage: AssetImage("lib/assets/img/login.png")
              ),
            ],
          ),
        ),
      ],
    );
  }

}
import 'package:flutter/material.dart';

class GradientBack extends StatelessWidget{
  
  int color1, color2;

  GradientBack(this.color1,this.color2);

  Widget build(BuildContext context) {

    return Container(
      height: 80.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(color1),
              Color(color2),
          ],
            begin: FractionalOffset.topLeft,
            end: FractionalOffset.bottomRight,
            tileMode: TileMode.clamp
        )
      ),
    );
  }

}
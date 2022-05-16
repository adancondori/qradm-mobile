import 'package:flutter/material.dart';
import 'gradientBack.dart';
import 'contentAppBar.dart';

class HeaderAppBar extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    final sBaner = Stack(
      children: <Widget>[

        GradientBack(0xFF652880,0xFFff1a05),
        ContentAppBar("Favorites"),

      ],
    );
    return sBaner;
  }

}
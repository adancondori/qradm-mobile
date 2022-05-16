import 'package:flutter/material.dart';

class ContentAppBar extends StatelessWidget{
  
  String title ="Favorites";

  ContentAppBar(this.title);

  Widget build(BuildContext context) {
    
    final hamburguerMenu = Container(
      margin: const EdgeInsets.only(
        top: 40.0,
        left: 20.0
      ),
      child: const Icon(
        Icons.menu,
         color: Colors.white,
         ),
    );

    final titleMenu = Container(
      margin: const EdgeInsets.only(
        top: 40.0,
        left: 30.0,
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.bold,
          fontFamily: "Roboto"
        ),
      ),
    );

    return Row(
      children: <Widget>[
        hamburguerMenu,
        titleMenu
      ],
    );
  }
  
}
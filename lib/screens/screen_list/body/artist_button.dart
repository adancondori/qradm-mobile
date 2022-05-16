import 'package:flutter/material.dart';

class ArtistButton extends StatelessWidget{

  Widget build(BuildContext context) {
    
    final loveButton = Container(
      margin: const EdgeInsets.only(
        top: 20.0,
        left: 20
      ),
      
      height: 50,
      width: 50,

      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.pink,
      ),
      child: const Icon(
        Icons.favorite,
        color: Colors.white,
      ),

    );

    return loveButton;
  }

}
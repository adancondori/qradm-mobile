import 'package:flutter/material.dart';

class ArtistPhoto extends StatelessWidget{

  String pathImage="";

  ArtistPhoto(this.pathImage);

  Widget build(BuildContext context) {
    final photo = Container(
      margin: EdgeInsets.only(
        top: 10.0,
        left: 0.0,
        bottom: 10
      ),
      height: 80.0,
      width: 80.0,

      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(pathImage)
        )
      ),
    );
    
    return photo;
  }

}
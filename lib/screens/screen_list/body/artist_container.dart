import 'package:flutter/material.dart';
import 'artist_button.dart';
import 'artist_information.dart';
import 'artist_photo.dart';
import 'artist_arrow.dart';

class ArtistContainer extends StatelessWidget{ 
  String photoPath;
  String artName, artDetails;

  ArtistContainer(this.photoPath, this.artName, this.artDetails);

  Widget build(BuildContext context) {

    final artCont =  Card(
      margin: EdgeInsets.only(
        top: 10, 
      ),
       child: Column(
         mainAxisSize: MainAxisSize.max,
         children: <Widget> [
           ListTile(
             leading: ArtistPhoto(photoPath),
             title: ArtistInformation(artName, artDetails),
             trailing: ArrowButton(),
           )
         ]
       ),
      );
    return artCont;
  }

}
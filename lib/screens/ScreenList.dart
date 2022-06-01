import 'package:flutter/material.dart';
import 'package:qradm/screens/screen_list/appBar.dart';
import 'package:qradm/src/punishments/widgets/artist_container.dart';
import 'Opinion.dart';

class ScreenList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.white,
      child:  Stack(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(
              top: 50,
            ),
            child: ListView(
              children: <Widget>[
                ArtistContainer("lib/assets/icon/icon.png", "The Do", "40 Canciones"),
                ArtistContainer("lib/assets/icon/icon.png", "Kero Kero Bonito", "57 Canciones"),
                ArtistContainer("lib/assets/icon/icon.png", "Frankie Cosmos", "41 Canciones"),
                ArtistContainer("lib/assets/icon/icon.png", "Alvvays", "19 Canciones"),
                ArtistContainer("lib/assets/icon/icon.png", "Bjork", "17 Canciones"),
                ArtistContainer("lib/assets/icon/icon.png", "Blink 182", "13 Canciones"),
                ArtistContainer("lib/assets/icon/icon.png", "Crumb", "8 Canciones"),
                ArtistContainer("lib/assets/icon/icon.png", "Ghostemane", "10 Canciones"),
                ArtistContainer("lib/assets/icon/icon.png", "Myrkur", "20 Canciones"),
                ArtistContainer("lib/assets/icon/icon.png", "Lindsey Stirling", "31 Canciones"),
              ],
            ),
          ),
          HeaderAppBar()
        ],
      ),
    );
  }

}
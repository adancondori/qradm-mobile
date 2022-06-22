import 'package:flutter/material.dart';
import 'package:qradm/src/punishments/widgets/artist_container.dart';

class ListViewSanciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.white,
      child:  Stack(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(
              top: 10,
            ),
            child: ListView(
              children: <Widget>[
                ArtistContainer("lib/assets/icon/warning.png", "Sanción 1", "Mas información..."),
                ArtistContainer("lib/assets/icon/warning.png", "Sanción 2", "Mas información..."),
                ArtistContainer("lib/assets/icon/warning.png", "Sanción 3", "Mas información..."),
                ArtistContainer("lib/assets/icon/warning.png", "Sanción 4", "Mas información..."),
                ArtistContainer("lib/assets/icon/warning.png", "Sanción 5", "Mas información..."),
                ArtistContainer("lib/assets/icon/warning.png", "Sanción 6", "Mas información..."),
                ArtistContainer("lib/assets/icon/warning.png", "Sanción 7", "Mas información..."),
                ArtistContainer("lib/assets/icon/warning.png", "Sanción 8", "Mas información..."),
                ArtistContainer("lib/assets/icon/warning.png", "Sanción 9", "Mas información..."),
                ArtistContainer("lib/assets/icon/warning.png", "Sanción 10", "Mas información..."),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
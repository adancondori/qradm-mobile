import 'package:flutter/material.dart';
import 'package:qradm/screens/screen_list/appBar.dart';
import 'package:qradm/screens/screen_list/body/arstist.dart';

import 'package:qradm/src/punishments/widgets/artist_container.dart';
import 'Opinion.dart';
class ScreenList extends StatelessWidget {

  List<Artist> artists = [];
  List<Widget> artistsWidgest = [];
/*  final List<Artist> place = [
    Artist(id: 1,
        name: "",
        detail: "",
        url_path: "")
  ];*/

  void generateListArtist() {
    artists = [];
    for(var i = 0 ; i < 20; i++ ) {
      var artist = Artist(id: 1,
          name: "Hola ${i}",
          detail: "description ${i}",
          url_path: "lib/assets/icon/icon.png");
      artists.add(artist);
    }
  }

  void generateWidgetArtist() {
    artistsWidgest = [];
    artists.forEach((element) {
      artistsWidgest.add(ArtistContainer("lib/assets/icon/icon.png", "The Do", "40 Canciones"));
    });
  }

  @override
  Widget build(BuildContext context) {


    generateListArtist();
    //generateWidgetArtist();

    // TODO: implement build
    return Container(
      color: Colors.white,
      child:  Stack(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(
              top: 50,
            ),
            child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: artists.length,
                itemBuilder: (BuildContext context, int index) {
                  return ArtistContainer(artists[index].url_path, artists[index].name, artists[index].detail);
                }
            ),
          ),
          HeaderAppBar()
        ],
      ),
    );
  }

}
import 'package:flutter/material.dart';
import 'package:qradm/src/guest/model/guest.dart';
import 'package:qradm/src/guest/ui/widgets/appBar.dart';
import 'package:qradm/src/guest/ui/widgets/guest_container.dart';

class GuestList extends StatelessWidget {
  List<Guest> artists = [];
  List<Widget> artistsWidgest = [];

  void generateListArtist() {
    artists = [];
    for (var i = 0; i < 20; i++) {
      var artist = Guest(
          id: 1,
          name: "Hola ${i}",
          detail: "description ${i}",
          url_path: "lib/assets/icon/icon.png");
      artists.add(artist);
    }
  }

  void generateWidgetArtist() {
    artistsWidgest = [];
    artists.forEach((element) {
      artistsWidgest.add(
          GuestContainer("lib/assets/icon/icon.png", "The Do", "40 Canciones"));
    });
  }

  @override
  Widget build(BuildContext context) {
    generateListArtist();
    //generateWidgetArtist();

    // TODO: implement build
    return Container(
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(
              top: 150,
            ),
            child:
            ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: artists.length,
                itemBuilder: (BuildContext context, int index) {
                  return GuestContainer(artists[index].url_path,
                      artists[index].name, artists[index].detail);
                },
            ),
          ),
          HeaderAppBar()
        ],
      ),
    );
  }
}

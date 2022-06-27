import 'package:flutter/material.dart';
import 'package:qradm/src/guest/ui/widgets/guest_arrow.dart';
import 'package:qradm/src/guest/ui/widgets/guest_information.dart';
import 'package:qradm/src/guest/ui/widgets/guest_photo.dart';

class GuestContainer extends StatelessWidget {
  String photoPath;
  String artName, artDetails;

  GuestContainer(this.photoPath, this.artName, this.artDetails);

  Widget build(BuildContext context) {
    final artCont = Card(
      margin: EdgeInsets.only(
        top: 10,
      ),
      child: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
        ListTile(
          leading: GuestPhoto(photoPath),
          title: GuestInformation(artName, artDetails),
          trailing: GuestButton(),
        )
      ]),
    );
    return artCont;
  }
}

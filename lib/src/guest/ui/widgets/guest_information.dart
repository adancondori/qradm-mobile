import 'package:flutter/material.dart';

class GuestInformation extends StatelessWidget {
  String name;
  String details;

  GuestInformation(this.name, this.details);

  Widget build(BuildContext context) {
    final artistName = Container(
      margin: const EdgeInsets.only(
        top: 25,
        left: 10,
      ),
      child: Text(
        name,
        style: const TextStyle(
          fontFamily: "Roboto",
          fontSize: 18,
          fontWeight: FontWeight.w900,
          color: Colors.black,
        ),
        // textAlign: TextAlign.left,
      ),
    );

    final information = Container(
      margin: const EdgeInsets.only(top: 0, left: 10, bottom: 25),
      child: Text(
        details,
        style: const TextStyle(
          fontFamily: "Roboto",
          fontSize: 16,
          fontWeight: FontWeight.w300,
          color: Colors.grey,
        ),
        // textAlign: TextAlign.left,
      ),
    );

    final info = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[artistName, information],
    );

    return info;
  }
}

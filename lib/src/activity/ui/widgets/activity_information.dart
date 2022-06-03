import 'package:flutter/material.dart';
class ActivityInformation extends StatelessWidget{
  String name;
  String details;
  ActivityInformation(this.name, this.details);
  Widget build(BuildContext context) {
    final Name = Container(
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
      ),
    );
    final Details = Container(
      margin: const EdgeInsets.only(
          top: 0,
          left: 10,
          bottom: 25
      ),
      child: Text(
        details,
        style: const TextStyle(
          fontFamily: "Roboto",
          fontSize: 16,
          fontWeight: FontWeight.w300,
          color: Colors.grey,
        ),
      ),
    );
    final info = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Name,
        Details
      ],
    );
    return info;
  }

}
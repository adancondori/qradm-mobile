import 'package:flutter/material.dart';
import 'package:qradm/src/extra_point/model/extra_point.dart';
class ExtraPointInformation extends StatelessWidget{
  ExtraPoint extraPoint;
  ExtraPointInformation(this.extraPoint, {Key? key}) : super(key: key);
  Widget build(BuildContext context) {
    final Name = Container(
      margin: const EdgeInsets.only(
        top: 25,
        left: 10,
      ),
      child: Text(
        extraPoint.name,
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
        extraPoint.description,
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
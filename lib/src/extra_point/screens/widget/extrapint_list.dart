import 'package:flutter/material.dart';
import 'package:qradm/src/extra_point/model/extra_point.dart';
import 'package:qradm/src/extra_point/screens/widget/extrapoint_information.dart';

class ExtraPointList extends StatelessWidget{
  ExtraPoint extraPoint;
  ExtraPointList(this.extraPoint, {Key? key}) : super(key: key);
  Widget build(BuildContext context) {
    final Content =  Card(
      margin: const EdgeInsets.only(
        top: 10,
      ),
      child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget> [
            ListTile(
              title: ExtraPointInformation(extraPoint),
            )
          ]
      ),
    );
    return Content;
  }

}
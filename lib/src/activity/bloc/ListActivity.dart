import 'package:flutter/material.dart';
import 'activity_Information.dart';


class ListActivity extends StatelessWidget{
  String actInfo;
  String actDetails;
  ListActivity(this.actInfo,this.actDetails);

  Widget build(BuildContext context) {

    final artCont =  Card(
      margin: EdgeInsets.only(
        top: 10,
      ),
      child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget> [
            ListTile(
              title: ActivityInformation(actInfo,actDetails),
            )
          ]
      ),
    );
    return artCont;
  }

}
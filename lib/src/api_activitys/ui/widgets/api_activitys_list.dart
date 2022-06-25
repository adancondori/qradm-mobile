import 'package:flutter/material.dart';
import 'package:qradm/src/api_activitys/model/api_activitys.dart';
import 'package:qradm/src/api_activitys/ui/widgets/api_activitys_informations.dart';

class ApiActivitysList extends StatelessWidget{
  ApiActivitys apiActivitys;
  ApiActivitysList(this.apiActivitys, {Key? key}) : super(key: key);
  Widget build(BuildContext context) {
    final Content =  Card(
      margin: const EdgeInsets.only(
        top: 10,
      ),
      child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget> [
            ListTile(
              title: ApiActivitysInformations(apiActivitys),
            )
          ]
      ),
    );
    return Content;
  }

}
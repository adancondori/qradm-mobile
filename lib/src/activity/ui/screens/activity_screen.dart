import 'package:flutter/material.dart';
import 'package:qradm/src/activity/bloc/list_activity.dart';
class ActivityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.white,
      child:  Stack(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(
              top: 50,
            ),
            child: ListView(
              children: <Widget>[
                ListActivity("Actividad 1", "primera actividad"),
                ListActivity("Actividad 2", "Segunda actividad"),
                ListActivity("Actividad 3", "tercera actividad"),
                ListActivity("Actividad 4", "cuarta actividad"),
                ListActivity("Actividad 5", "quinta actividad"),
                ListActivity("Actividad 6", "sexta actividad"),
                ListActivity("Actividad 7", "septima actividad"),
                ListActivity("Actividad 8", "octava actividad"),
                ListActivity("Actividad 9", "novena actividad"),
                ListActivity("Actividad 10", "decima actividad"),
                ListActivity("Actividad 11", "ondeava actividad"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
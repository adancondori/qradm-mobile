import 'package:flutter/material.dart';
import 'package:qradm/screens/Detail.dart';
import 'package:qradm/screens/Search.dart';
import 'package:qradm/screens/GradientBack.dart';
import 'package:qradm/screens/ListOpinion.dart';
import 'package:qradm/screens/card_image_list.dart';
import 'package:qradm/screens/header_appbar.dart';
import 'package:qradm/screens/home.dart';
import 'package:qradm/src/navigation/NavigationScreen.dart';
import 'package:qradm/src/punishments/widgets/listview_sanciones.dart';
import 'package:qradm/screens/ScreenList.dart';

class PunishmentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Sanciones')),
      body: ListViewSanciones(),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:qradm/src/extra_point/model/extra_point.dart';
import 'package:qradm/src/extra_point/screens/widget/extrapoint_information.dart';

class ExtraPointList extends StatefulWidget {
  ExtraPoint extraPoint;
  final Function(ExtraPoint) onPress;
  ExtraPointList(this.extraPoint, {Key? key, required this.onPress})
      : super(key: key);

  @override
  State<ExtraPointList> createState() => _ExtraPointListState();
}

class _ExtraPointListState extends State<ExtraPointList> {
  Widget build(BuildContext context) {
    final Content = Card(
      margin: const EdgeInsets.only(
        top: 10,
      ),
      child: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
        ListTile(
            title: ExtraPointInformation(widget.extraPoint),
            onTap: (){
              widget.onPress(widget.extraPoint);
            }
         ),
      ]),
    );
    return Content;
  }
}

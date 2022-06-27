import 'package:flutter/material.dart';
import 'package:qradm/src/api_activitys/model/api_activitys.dart';
import 'package:qradm/src/api_activitys/ui/widgets/api_activitys_informations.dart';

class ApiActivitysList extends StatefulWidget {
  ApiActivitys apiActivitys;
  final Function(ApiActivitys) onPress;
  ApiActivitysList(this.apiActivitys, {Key? key, required this.onPress})
      : super(key: key);

  @override
  State<ApiActivitysList> createState() => _ApiActivitysListState();
}

class _ApiActivitysListState extends State<ApiActivitysList> {
  Widget build(BuildContext context) {
    final Content = Card(
      margin: const EdgeInsets.only(
        top: 10,
      ),
      child: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
        ListTile(
          title: ApiActivitysInformations(widget.apiActivitys),
          onTap: () {
            widget.onPress(widget.apiActivitys);
          },
        )
      ]),
    );
    return Content;
  }
}

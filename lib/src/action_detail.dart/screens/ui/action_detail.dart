import 'package:flutter/material.dart';
import 'package:qradm/src/model_generic/group_action.dart';

class MyActionDetail extends StatelessWidget {
  GroupAction groupAction;

  MyActionDetail(this.groupAction);

  @override
  Widget build(BuildContext context) {
    final star_fill = Container(
      margin: const EdgeInsets.only(top: 20.0, right: 3.0),
      child: const Icon(
        Icons.star,
        color: Color(0xFFf2C611),
      ),
    );

    final title_start = Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Text(groupAction.getName(),
                style: const TextStyle(
                  fontSize: 24.0,
                  fontFamily: "Lato",
                  fontWeight: FontWeight.w900,
                  decoration: TextDecoration.none,
                ),
                textAlign: TextAlign.left),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 5.0, left: 20.0, right: 20.0),
          child: Row(
            children: <Widget>[star_fill, star_fill, star_fill],
          ),
        )
      ],
    );

    final description = Container(
      margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
      child: Text(
        groupAction.getDescription(),
        style: const TextStyle(
            fontSize: 18, fontFamily: 'Lato', color: Colors.black),
      ),
    );

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Detalle",
        ),
      ),
      body: ListView(
          // shrinkWrap: true,
          children: <Widget>[
            Container(
                color: Colors.white,
                child: Column(
                  children: [
                    title_start,
                    description,
                  ],
                ))
          ]),
    );
  }
}

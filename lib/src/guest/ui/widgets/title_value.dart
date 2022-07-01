import 'package:flutter/material.dart';

class TitleValue extends StatefulWidget {
  String title = "";
  String value = "";
  TitleValue(this.title, this.value);

  @override
  State<TitleValue> createState() => _TitleValueState();
}

class _TitleValueState extends State<TitleValue> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              color: Color.fromARGB(255, 240, 140, 110),
              child: ListTile(
                title: Text(
                  widget.title,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Color.fromARGB(255, 97, 214, 243),
              child: ListTile(
                title: Text(
                  widget.value,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

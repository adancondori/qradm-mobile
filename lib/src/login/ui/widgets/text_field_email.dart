import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qradm/src/login/bloc/login_bloc.dart';

class TextFieldEmail extends StatelessWidget {
  final TextEditingController controller;

  TextFieldEmail({required this.controller});

  @override
  Widget build(BuildContext context) {
    final password = Padding(
      padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 25.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.indigo,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 15.0),
          child: TextFormField(
            controller: controller,
            style: const TextStyle(
              fontSize: 15.0,
              fontFamily: "Lato",
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Code',
            ),
          ),
        ),
      ),
    );
    return password;
  }
}

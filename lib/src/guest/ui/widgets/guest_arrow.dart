import 'package:flutter/material.dart';

class GuestButton extends StatelessWidget {
  Widget build(BuildContext context) {
    final arrowButton = Container(
      margin: const EdgeInsets.only(top: 20.0, left: 20),
      height: 50,
      width: 50,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.red,
      ),
      child: const Icon(
        Icons.arrow_forward,
        color: Colors.white,
      ),
    );

    return arrowButton;
  }
}

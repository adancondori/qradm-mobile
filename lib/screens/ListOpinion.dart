import 'package:flutter/material.dart';
import 'Opinion.dart';

class ListOpinion extends StatelessWidget {
  static const y = 1;
  static const aux = "";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Opinion("lib/assets/icon/icon.png", "Hola mundo 1", "1 review · 5 photos", "There is an amazing place in Sri Lanka"),
        Opinion("lib/assets/icon/icon.png", "Hola mundo 2", "2 review · 5 photos", "There is an amazing place in Sri Lanka"),
        Opinion("lib/assets/icon/icon.png", "Hola mundo 3", "2 review · 2 photos", "There is an amazing place in Sri Lanka"),
        Opinion("lib/assets/icon/icon.png", "Hola mundo 3", "2 review · 2 photos", "There is an amazing place in Sri Lanka"),
        Opinion("lib/assets/icon/icon.png", "Hola mundo 3", "2 review · 2 photos", "There is an amazing place in Sri Lanka"),
        Opinion("lib/assets/icon/icon.png", "Hola mundo 3", "2 review · 2 photos", "There is an amazing place in Sri Lanka"),
        Opinion("lib/assets/icon/icon.png", "Hola mundo 3", "2 review · 2 photos", "There is an amazing place in Sri Lanka"),
        Opinion("lib/assets/icon/icon.png", "Hola mundo 3", "2 review · 2 photos", "There is an amazing place in Sri Lanka"),
        Opinion("lib/assets/icon/icon.png", "Hola mundo 3", "2 review · 2 photos", "There is an amazing place in Sri Lanka"),
        Opinion("lib/assets/icon/icon.png", "Hola mundo 3", "2 review · 2 photos", "There is an amazing place in Sri Lanka"),
        Opinion("lib/assets/icon/icon.png", "Hola mundo 3", "2 review · 2 photos", "There is an amazing place in Sri Lanka"),
        Opinion("lib/assets/icon/icon.png", "Hola mundo 3", "2 review · 2 photos", "There is an amazing place in Sri Lanka"),
        Opinion("lib/assets/icon/icon.png", "Hola mundo 3", "2 review · 2 photos", "There is an amazing place in Sri Lanka"),
        Opinion("lib/assets/icon/icon.png", "Hola mundo 3", "2 review · 2 photos", "There is an amazing place in Sri Lanka"),

      ],
    );
  }

}
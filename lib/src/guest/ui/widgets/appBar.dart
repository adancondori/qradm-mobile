import 'package:flutter/material.dart';
import 'package:qradm/screens/GradientBack.dart';
import 'package:qradm/screens/screen_list/contentAppBar.dart';

class HeaderAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sBaner = Stack(
      children: <Widget>[
        ContentAppBar("Favorites"),
        Container(
          height: 150.0,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color(0xFF4268D3),
                    Color(0xFF584CD1)
                  ],
                  begin: FractionalOffset(0.2, 0.0),
                  end: FractionalOffset(1.0, 0.6),
                  stops: [0.0, 0.6],
                  tileMode: TileMode.clamp
              )
          ),


          child: const Text(
            "Mis Actividades",
            style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontFamily: "Lato",
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none
            ),
          ),
          alignment: const Alignment(-0.7, -0.4),
        ),
      ],
    );
    return sBaner;
  }
}

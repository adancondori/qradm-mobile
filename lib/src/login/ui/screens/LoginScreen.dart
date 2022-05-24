import 'package:flutter/material.dart';
import 'package:qradm/screens/Detail.dart';
import 'package:qradm/screens/GradientBack.dart';
import 'package:qradm/screens/ListOpinion.dart';
import 'package:qradm/screens/card_image_list.dart';
import 'package:qradm/screens/header_appbar.dart';
import 'package:qradm/screens/home.dart';
import 'package:qradm/src/shared/widgets/button_purple.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xff584CD1),
                  Color(0xcc584CD1),
                  Color(0xcc4268D3),
                  Color(0xff4268D3),
                ]
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold
              ),
            ),
            Image.asset(
              "lib/assets/img/login.png",
              height: 200,
              width: 200,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 25.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.indigo,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Correo electrónico',
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 25.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.indigo,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Contraseña',
                    ),
                  ),
                ),
              ),
            ),
            ButtonPurple("Ingresar"),
          ],
        ),
      ),
    );
  }
}

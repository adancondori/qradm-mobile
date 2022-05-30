import 'package:flutter/material.dart';
import 'package:qradm/src/shared/widgets/button_purple.dart';
import 'package:qradm/src/shared/widgets/text_field_password.dart';
import 'package:qradm/src/shared/widgets/text_field_email.dart';
import 'package:qradm/src/login/ui/widgets/image_login.dart';
import 'package:qradm/src/login/ui/widgets/text_login.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
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
            TextLogin(),
            ImageLogin(),
            TextFieldEmail(),
            TextFieldPassword(),
            ButtonPurple("Ingresar"),
          ],
        ),
      ),
    );
  }
}

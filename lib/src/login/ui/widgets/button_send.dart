import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qradm/src/activity/ui/screens/activity_screen.dart';
import 'package:qradm/src/login/bloc/login_bloc.dart';
import 'package:qradm/src/navigation/navigation_screen.dart';


class ButtonSend extends StatelessWidget {

  String buttonText = "Navigate";

  // final VoidCallback onPressed;
  final TextEditingController controller;

  ButtonSend({Key? key, required this.buttonText, required this.controller});

  @override
  Widget build(BuildContext context) {
    final loginBloc = BlocProvider.of<LoginBloc>(context);

    return InkWell(
      onTap: () => {
        loginBloc.add(SignInRequested(this.controller.value.text))
      }, //onPressed,
      child: Container(
        margin: const EdgeInsets.only(
            top: 30.0,
            left: 20.0,
            right: 20.0
        ),
        height: 50.0,
        width: 180.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            gradient: const LinearGradient(
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

        child: Center(
          child: Text(
            buttonText,
            style: const TextStyle(
                fontSize: 18.0,
                fontFamily: "Lato",
                color: Colors.white
            ),
          ),
        ),
      ),
    );
  }

}
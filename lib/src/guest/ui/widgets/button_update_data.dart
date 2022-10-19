import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qradm/src/guest/bloc/guest_detail_bloc.dart';
import 'package:qradm/src/login/bloc/login_bloc.dart';
import 'package:qradm/src/login/model/user.dart';

class ButtonUpdateData extends StatefulWidget {
  String buttonText = "Navigate";

  ButtonUpdateData({Key? key, required this.buttonText});

  @override
  State<ButtonUpdateData> createState() => _ButtonUpdateState();
}

class _ButtonUpdateState extends State<ButtonUpdateData> {
  goUpdate() {
    final guestDetailBloc = BlocProvider.of<GuestDetailBloc>(context);
    LoginBloc stateDetailGroup = BlocProvider.of<LoginBloc>(context);
    User user = User();
    user.id = 0;
    if (stateDetailGroup.state is Authenticated) {
      user = (stateDetailGroup.state as Authenticated).user;
    }
    guestDetailBloc.add(RequestAPIGD(user));
  }

  @override
  Widget build(BuildContext context) {
    return getButton();
  }

  InkWell getButton() {
    return InkWell(
      onTap: () => {goUpdate()}, //onPressed,
      child: Container(
        margin: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
        height: 50.0,
        width: 180.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            gradient: const LinearGradient(
                colors: [Color(0xFF4268D3), Color(0xFF584CD1)],
                begin: FractionalOffset(0.2, 0.0),
                end: FractionalOffset(1.0, 0.6),
                stops: [0.0, 0.6],
                tileMode: TileMode.clamp)),
        child: Center(
          child: Text(
            widget.buttonText,
            style: const TextStyle(
                fontSize: 18.0, fontFamily: "Lato", color: Colors.white),
          ),
        ),
      ),
    );
  }
}

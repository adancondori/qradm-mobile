import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qradm/src/guest/ui/screens/guest_detail.dart';
import 'package:qradm/src/login/bloc/login_bloc.dart';
import 'package:qradm/src/login/model/user.dart';
import 'package:qradm/src/navigation/navigation_screen.dart';
import 'package:qradm/src/login/ui/widgets/button_send.dart';
import 'package:qradm/src/login/ui/widgets/text_field_email.dart';
import 'package:qradm/src/login/ui/widgets/image_login.dart';
import 'package:qradm/src/login/ui/widgets/text_login.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController myController =
      TextEditingController(text: '7728987');

  goHome() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NavigationScreen()),
    );
  }

  goMyDetails(User user) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GuestDetailScreen(user: user)),
    );
  }

  @override
  void dispose() {
    // myController.dispose();
    super.dispose();
  }

  void shoDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text("Mensaje"),
        content: Text(message),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: Text("Aceptar"),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is Authenticated) {
            if (state.user.type_role == "GUEST") {
              goMyDetails(state.user);
            } else {
              goHome();
            }
          }
          if (state is AuthError) {
            // Showing the error message if the user has entered invalid credentials
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
            shoDialog(state.error);
          }
        },
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            if (state is Loading) {
              // Showing the loading indicator while the user is signing in
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is UnAuthenticated ||
                state is AuthError ||
                state is Authenticated) {
              // Showing the sign in form if the user is not authenticated
              return Body(myController: myController);
            }
            return Container();
          },
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.myController,
  }) : super(key: key);

  final TextEditingController myController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Color(0xff584CD1),
            Color(0xcc584CD1),
            Color(0xcc4268D3),
            Color(0xff4268D3),
          ])),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextLogin(),
          ImageLogin(),
          TextFieldEmail(controller: myController),
          ButtonSend(buttonText: "Ingresar", controller: myController)
        ],
      ),
    );
  }
}

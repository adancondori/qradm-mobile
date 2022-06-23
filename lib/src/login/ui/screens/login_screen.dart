import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:qradm/src/login/ui/model/user.dart';
import 'package:qradm/src/navigation/navigation_screen.dart';
import 'package:qradm/src/service/api_client.dart';
import 'package:qradm/src/service/api_response.dart';
import 'package:qradm/src/service/api_route.dart';
import 'package:qradm/src/service/interceptors/auth_interceptor.dart';
import 'package:qradm/src/service/interceptors/log_interceptor.dart';
import 'package:qradm/src/shared/widgets/button_send.dart';
import 'package:qradm/src/shared/widgets/text_field_email.dart';
import 'package:qradm/src/login/ui/widgets/image_login.dart';
import 'package:qradm/src/login/ui/widgets/text_login.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late APIClient client;
  TextEditingController myController = TextEditingController();

  goHome() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NavigationScreen()),
    );
  }

  void onPress() async {
    final result = await fetchLogin();
    if (result.type=="SUCCESSFULLY") {
      final user = result.payload;
      goHome();
    } else {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text("Mensaje"),
          content: Text("Ocurrio un error al intentar conectarse con se servidor."),
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

  }

  @override
  void initState() {
    super.initState();
    Map<String, dynamic> headers = {'CODE': 'USER220600001'};
    client = APIClient( options:
        BaseOptions(
          connectTimeout: 10000,
          receiveTimeout: 10000,
          baseUrl: 'https://www.eventsadm.space/api/v1/mobile',
          headers: headers,
        )
    );
    final interceptors = [
      AuthInterceptor(client, AuthToken(expiredTime: 1616142369958)),
      APILogInterceptor(),
    ];
    client.instance.interceptors.addAll(interceptors);
  }

  Future<APIResponse> fetchLogin() async {
    final result = await client.request<APIResponse<User>>(
        route: APIRoute(APIType.api_login_user, routeParams: ''),
        create: () => APIResponse(create: () => User())
    );
    return result.payload;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                ]
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextLogin(),
            ImageLogin(),
            TextFieldEmail(),
            ButtonSend(buttonText: "Ingresar", onPressed: onPress),
          ],
        ),
      ),
    );
  }
}


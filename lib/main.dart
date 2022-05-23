import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:qradm/screens/Detail.dart';
import 'package:qradm/screens/GradientBack.dart';
import 'package:qradm/screens/ListOpinion.dart';
import 'package:qradm/screens/Navigation.dart';
import 'package:qradm/screens/ScreenList.dart';
import 'package:qradm/screens/header_appbar.dart';
import 'package:qradm/src/activity/ui/screens/ActivityScreen.dart';
import 'package:qradm/src/login/bloc/bloc_login.dart';
import 'package:qradm/src/login/ui/screens/LoginScreen.dart';

void main() {
  runApp(const MyApp2());
}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const String description =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. \n\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.";

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          //body: new Detail("Bahamas", 4, description),
          //body: GradientBack(),//new Detail("Bahamas", 4, description),
          body: Navigation(),
/*
        body: Stack(
          children: <Widget>[
            ListView(
              children: <Widget>[
                Detail("Bahamas", 4, description),
                ListOpinion()
              ],
            ),
            HeaderAppBar()
          ],
        ),
        */
        ));
  }
}

class MyApp2 extends StatelessWidget {
  const MyApp2({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          //home: PlatziTripsCupertino(),
          home: ActivityScreen(),
        ),
        bloc: LoginBloc());
  }
}
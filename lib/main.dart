import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qradm/screens/Navigation.dart';
import 'package:qradm/src/detail_group/bloc/group_bloc.dart';
import 'package:qradm/src/guest/bloc/guest_detail_bloc.dart';
import 'package:qradm/src/guest_list/ui/bloc/bloc_list_bloc.dart';
import 'package:qradm/src/login/bloc/login_bloc.dart';
import 'package:qradm/src/login/model/user.dart';
import 'package:qradm/src/login/ui/screens/login_screen.dart';
import 'package:qradm/src/read_qr/bloc/qr_bloc.dart';
import 'package:qradm/src/service/auth_repository.dart';

void main() {
  runApp(AppState());
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

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
        create: (context) => AuthRepository(),
        child: MultiBlocProvider(providers: [
          BlocProvider<LoginBloc>(
              create: (context) => LoginBloc(
                  authRepository:
                      RepositoryProvider.of<AuthRepository>(context))),
          BlocProvider<QrBloc>(
              create: (context) => QrBloc(
                  authRepository:
                      RepositoryProvider.of<AuthRepository>(context))),
          BlocProvider<GroupBloc>(
              create: (context) => GroupBloc(
                  authRepository:
                      RepositoryProvider.of<AuthRepository>(context))),
          BlocProvider<GuestDetailBloc>(
              create: (context) => GuestDetailBloc(
                  authRepository:
                      RepositoryProvider.of<AuthRepository>(context))),
          BlocProvider<ListGuestBloc>(
              create: (context) => ListGuestBloc(
                  authRepository:
                      RepositoryProvider.of<AuthRepository>(context))),
        ], child: MyApp2()));
  }
}

class MyApp2 extends StatelessWidget {
  final userStream = new StreamController<User>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder<User?>(
          stream: userStream.stream,
          builder: (context, snapshot) {
            // If the snapshot has user data, then they're already signed in. So Navigating to the Dashboard.
            if (snapshot.hasData) {
              return Navigation();
            }
            // Otherwise, they're not signed in. Show the sign in page.
            return LoginScreen();
          }),
    );
  }
}

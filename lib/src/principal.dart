import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:qradm/screens/ScreenList.dart';
import 'package:qradm/src/login/ui/screens/login_screen.dart';
import 'package:qradm/src/read_qr/ui/screens/read_qr.dart';

class Principal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      bottomNavigationBar: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.indigo), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.search, color: Colors.indigo), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.indigo), label: ""),
        ]),
        tabBuilder: (BuildContext context, int index) {
          switch (index) {
            case 0:
              return CupertinoTabView(
                builder: (BuildContext context) {
                  return ScreenList();
                },
              );
              break;
            case 1:
              return CupertinoTabView(
                builder: (BuildContext context) => ScreenList(),
              );
              break;
            case 2:
              return CupertinoTabView(
                builder: (BuildContext context) {
                  return LoginScreen();
                },
              );
              break;

            default:
              {
                return CupertinoTabView(
                  builder: (BuildContext context) => ScreenList(),
                );
              }
              break;
          }
        },
      ),
    );
  }
}

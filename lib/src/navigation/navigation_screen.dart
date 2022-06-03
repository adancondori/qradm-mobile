import 'package:flutter/material.dart';
import 'package:qradm/screens/ScreenList.dart';
import 'package:qradm/screens/Search.dart';
import 'package:qradm/screens/home.dart';
import 'package:qradm/src/activity/ui/screens/activity_screen.dart';
import 'package:qradm/src/navigation/test.dart';
import 'package:qradm/src/punishments/ui/screens/punishment_screen.dart';

class NavigationScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NavigationScreen();
  }

}

class _NavigationScreen extends State<NavigationScreen> {
  int indexTap = 0;
  final List<Widget> widgetsChildren = [
    ActivityScreen(),
    //Search(),
    //ScreenList(),
    PunishmentScreen(),
    TestAPI(),
  ];

  void onTapTapped(int index){

    setState(() {
      indexTap = index;
    });

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build


    return  Scaffold(
      body: widgetsChildren[indexTap],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
            canvasColor: Colors.white,
            primaryColor: Colors.purple
        ),
        child: BottomNavigationBar(
            onTap: onTapTapped,
            currentIndex: indexTap,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: ""
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: ""
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: ""
              ),
              // BottomNavigationBarItem(
              //     icon: Icon(Icons.person),
              //     label: ""
              // ),
            ]
        ),
      ),
    );
  }
}
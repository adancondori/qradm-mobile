import 'package:flutter/material.dart';
import 'package:qradm/src/api_activitys/ui/screens/screen_api_activitys.dart';
import 'package:qradm/src/extra_point/screens/ui/extra_point_screen.dart';
import 'package:qradm/src/sanction/ui/screens/view_api_users.dart';

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
    //Search(),
    //ScreenList(),
    ApiActivitysScreen(),
    // PunishmentScreen(),
    ViewSanctions(),
    //TestAPI(),
    ExtraPointScreen()
  ];

  void onTapTapped(int index) {
    setState(() {
      indexTap = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      body: widgetsChildren[indexTap],
      bottomNavigationBar: Theme(
        data: Theme.of(context)
            .copyWith(canvasColor: Colors.white, primaryColor: Colors.purple),
        child: BottomNavigationBar(
            onTap: onTapTapped,
            currentIndex: indexTap,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.emoji_events_rounded,
                    color: Colors.blueAccent,
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.taxi_alert,
                    color: Colors.blueAccent,
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.work,
                    color: Colors.blueAccent,
                  ),
                  label: ""),
              // BottomNavigationBarItem(
              //     icon: Icon(Icons.person),
              //     label: ""
              // ),
            ]),
      ),
    );
  }
}

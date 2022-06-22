import 'package:flutter/material.dart';
import 'package:qradm/src/activity/ui/widgets/list_activity.dart';
import '../../model/Activity.dart';
class ActivityScreen extends StatelessWidget {
  List<Activity> activitys =[];

  void generateListActivity() {
    activitys = [];
    for(var i = 0 ; i < 20; i++ ) {
      var activity = Activity(id: 1,
          name: "Actividad ${i}",
          detail: "description de la actividad ${i}");
      activitys.add(activity);
    }
  }
  @override
  Widget build(BuildContext context) {
    generateListActivity();
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Actividades')),
      body: Container(
        color: Colors.white,
        child:  Stack(
          children: <Widget>[
            Container(
              child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: activitys.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListActivity(activitys[index].name, activitys[index].detail);
                  }
              ),
            ),
          ],
        ),
      ),
    );

  }
}
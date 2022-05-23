import 'package:flutter/material.dart';

class ListView_sanciones extends StatelessWidget {
  ListView_sanciones(String s);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: const ListTile(
                title: Text("Sancion 1"),
                subtitle: Text ("motivos: "),
                leading: Icon(
                  Icons.warning,
                  color: Colors.yellow,
                ),
              ),

            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: const ListTile(
                title: Text("Sancion 2"),
                subtitle: Text ("motivos: "),
                leading: Icon(
                  Icons.warning,
                  color: Colors.yellow,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: const ListTile(
                title: Text("Sancion 3"),
                subtitle: Text ("motivos: "),
                leading: Icon(
                  Icons.warning,
                  color: Colors.yellow,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: const ListTile(
                title: Text("Sancion 4"),
                subtitle: Text ("motivos: "),
                leading: Icon(
                  Icons.warning,
                  color: Colors.yellow,

                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: const ListTile(
                title: Text("Sancion 5"),
                subtitle: Text ("motivos: "),
                leading: Icon(
                  Icons.warning,
                  color: Colors.yellow,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: const ListTile(
                title: Text("Sancion 6"),
                subtitle: Text ("motivos: "),
                leading: Icon(
                  Icons.warning,
                  color: Colors.yellow,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: const ListTile(
                title: Text("Sancion 7"),
                subtitle: Text ("motivos: "),
                leading: Icon(
                  Icons.warning,
                  color: Colors.yellow,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: const ListTile(
                title: Text("Sancion 8"),
                subtitle: Text ("motivos: "),
                leading: Icon(
                  Icons.warning,
                  color: Colors.yellow,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: const ListTile(
                title: Text("Sancion 9"),
                subtitle: Text ("motivos: "),
                leading: Icon(
                  Icons.warning,
                  color: Colors.yellow,
                ),
              ),
            )
          ],
        )
    );;
  }
}
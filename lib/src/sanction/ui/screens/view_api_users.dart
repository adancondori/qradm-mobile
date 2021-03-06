import 'package:flutter/material.dart';
import 'package:qradm/src/read_qr/ui/screens/read_qr.dart';
import 'package:qradm/src/sanction/model/sanction_api.dart';
import 'package:qradm/src/sanction/services/consume_api.dart';

class ViewSanctions extends StatefulWidget {
  const ViewSanctions({Key? key}) : super(key: key);

  @override
  _ViewUsersState createState() => _ViewUsersState();
}

class _ViewUsersState extends State<ViewSanctions> {
  List<Sanctions>? sanctions = [];
  var isLoaded = false;
  onPressed(Sanctions sanctions) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ReadQR(groupaction: sanctions)),
    );
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    sanctions = await SanctionService().getSanctions();
    if (sanctions != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sanctions'),
      ),
      body: Visibility(
        visible: isLoaded,
        child: ListView.builder(
          itemCount: sanctions?.length,
          itemBuilder: (context, index) {
            return bodyList(index);
          },
        ),
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  Container bodyList(int index) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: GestureDetector(
        onTap: () {
          onPressed(sanctions![index]);
        },
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                image: const DecorationImage(
                    image: AssetImage('lib/assets/icon/exclamation.png')),
                borderRadius: BorderRadius.circular(24),
                color: Colors.grey[300],
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    sanctions![index].name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    sanctions![index].description,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

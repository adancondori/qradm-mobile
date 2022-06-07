import 'package:flutter/material.dart';
import 'package:qradm/src/details_qr/ui/widgets/body_details.dart';
import 'package:qradm/src/details_qr/ui/widgets/details_information.dart';
class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile",
            ),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column (
            children: <Widget> [
              DetailsPhoto(),
              BodyDetails("Nombre"),
              BodyDetails("Apellido"),
              BodyDetails("Direccion"),
              BodyDetails("Telefono"),
            ],
          ),
        ),
      ),

    );

  }
  
}
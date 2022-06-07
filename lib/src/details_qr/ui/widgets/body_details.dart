import 'package:flutter/material.dart';
import 'package:qradm/src/details_qr/ui/widgets/details_information.dart';
class BodyDetails extends StatelessWidget{
  @override
  String content ="";

  BodyDetails(this.content);
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              color: Colors.grey,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 37, vertical: 25),
            child: Column(
              children:<Widget> [
                Text(content,
                    style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: "Lato",
                    ),

                ),

              ],
            ),
            ),
          ),

      ],
    );
  }

}
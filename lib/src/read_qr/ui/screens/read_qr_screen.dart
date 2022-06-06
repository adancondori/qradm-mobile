import 'package:flutter/material.dart';
import 'package:qradm/src/read_qr/ui/widgets/qr_scanner.dart';

class ReadQR extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const QRViewExample(),
            ));
          },
          child: const Text('Lector de QR'),
        ),
      ),
    );
  }
}
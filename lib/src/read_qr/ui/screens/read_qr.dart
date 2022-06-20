import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qradm/src/read_qr/ui/screens/qr_overlay.dart';
import 'package:qradm/src/read_qr/ui/screens/scan_qr.dart';

class ReadQR extends StatefulWidget {
  @override
  _ReadQRState createState() => _ReadQRState();
}

class _ReadQRState extends State<ReadQR> {

  @override
  Widget build(BuildContext context) {
    MobileScannerController cameraController = MobileScannerController();
    return Scaffold(
        appBar: AppBar(
          title: const Text('QR Scanner'),
          actions: [
            IconButton(
              color: Colors.white,
              icon: ValueListenableBuilder(
                valueListenable: cameraController.torchState,
                builder: (context, state, child) {
                  switch (state as TorchState) {
                    case TorchState.off:
                      return const Icon(Icons.flash_off, color: Colors.grey);
                    case TorchState.on:
                      return const Icon(Icons.flash_on, color: Colors.yellow);
                  }
                },
              ),
              iconSize: 32.0,
              onPressed: () => cameraController.toggleTorch(),
            ),
            IconButton(
              color: Colors.white,
              icon: ValueListenableBuilder(
                valueListenable: cameraController.cameraFacingState,
                builder: (context, state, child) {
                  switch (state as CameraFacing) {
                    case CameraFacing.front:
                      return const Icon(Icons.camera_front);
                    case CameraFacing.back:
                      return const Icon(Icons.camera_rear);
                  }
                },
              ),
              iconSize: 32.0,
              onPressed: () => cameraController.switchCamera(),
            ),
          ],
        ),
        body: Stack(
          children: [
            MobileScanner(
              allowDuplicates: false,
              controller: cameraController,
              onDetect: (Barcode barcode,
                  MobileScannerArguments? args) {
                if (barcode.rawValue == null) {
                  debugPrint('Failed to scan Barcode');
                } else {
                  final String code = barcode.rawValue!;
                  debugPrint('Barcode found! $code');
                }
              },
            ),
            QRScannerOverlay(overlayColour: Colors.black.withOpacity(0.5))
          ]//QRScannerOverlay(overlayColour: null,)
          // Column(
          //   // mainAxisAlignment: MainAxisAlignment.center,
          //   // crossAxisAlignment: CrossAxisAlignment.stretch,
          //   children: [
          //     //Display Image
          //     Image(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQyYwscUPOH_qPPe8Hp0HAbFNMx-TxRFubpg&usqp=CAU")),
          //     TextButton(
          //         style: ButtonStyle(
          //           foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          //         ),
          //         onPressed: () {
          //           Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ScanQR()));
          //         },
          //         child: const Text("Scan QR Code",style: TextStyle(color: Colors.indigo),)
          //     ),
          //     //First Button
          //     FlatButton(
          //       padding: EdgeInsets.all(15),
          //       onPressed: (){
          //         Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ScanQR()));
          //       },
          //       child: const Text("Scan QR Code",style: TextStyle(color: Colors.indigo),),
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(20),
          //         side: BorderSide(color: Colors.indigo),
          //       ),
          //     ),
          //     //Second Button
          //     TextButton(
          //       style: ButtonStyle(
          //         foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          //       ),
          //       onPressed: () {
          //         Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ScanQR()));
          //       },
          //       child: const Text("Scan QR Code",style: TextStyle(color: Colors.indigo),)
          //     ),
          //     FlatButton(
          //       padding: EdgeInsets.all(15),
          //       onPressed: (){
          //         Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
          //             ScanQR()));
          //       },
          //       child: Text("Generate QR Code", style: TextStyle(color: Colors.indigo[900]),),
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(20),
          //         side: BorderSide(color: Colors.indigo),
          //       ),
          //     ),
          //   ],
          // ),
        )
    );
  }
}
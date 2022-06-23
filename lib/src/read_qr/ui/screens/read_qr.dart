import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qradm/src/detail_group/model/group.dart';
import 'package:qradm/src/detail_group/screens/ui/screen_group.dart';
import 'package:qradm/src/extra_point/model/extra_point.dart';
import 'package:qradm/src/model_generic/group_action.dart';
import 'package:qradm/src/read_qr/bloc/qr_bloc.dart';
import 'package:qradm/src/read_qr/ui/screens/qr_overlay.dart';

class ReadQR extends StatefulWidget {
  GroupAction groupaction;
  ReadQR({Key? key, required this.groupaction}) : super(key: key);
  @override
  _ReadQRState createState() => _ReadQRState();
}

class _ReadQRState extends State<ReadQR> {
  goGroupDetail(Group group) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ScreenGroup(
                group: group,
                groupaction: widget.groupaction,
              )),
    );
  }

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
      body: BlocListener<QrBloc, QrState>(
        listener: (context, state) {
          if (state is RedirectGroup) {
            goGroupDetail(
              state.group,
            );
          }
          // if (state is AuthError) {
          //   // Showing the error message if the user has entered invalid credentials
          //   ScaffoldMessenger.of(context)
          //       .showSnackBar(SnackBar(content: Text(state.error)));
          //   shoDialog(state.error);
          // }
        },
        child: BlocBuilder<QrBloc, QrState>(
          builder: (context, state) {
            if (state is Loading) {
              // Showing the loading indicator while the user is signing in
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is QrInitial ||
                state is AuthError ||
                state is RedirectGroup) {
              // Showing the sign in form if the user is not authenticated
              return Body(cameraController: cameraController);
            }
            return Container();
          },
        ),
      ),
    );
    // return Scaffold(
    //     appBar: AppBar(
    //       title: const Text('QR Scanner'),
    //       actions: [
    //         IconButton(
    //           color: Colors.white,
    //           icon: ValueListenableBuilder(
    //             valueListenable: cameraController.torchState,
    //             builder: (context, state, child) {
    //               switch (state as TorchState) {
    //                 case TorchState.off:
    //                   return const Icon(Icons.flash_off, color: Colors.grey);
    //                 case TorchState.on:
    //                   return const Icon(Icons.flash_on, color: Colors.yellow);
    //               }
    //             },
    //           ),
    //           iconSize: 32.0,
    //           onPressed: () => cameraController.toggleTorch(),
    //         ),
    //         IconButton(
    //           color: Colors.white,
    //           icon: ValueListenableBuilder(
    //             valueListenable: cameraController.cameraFacingState,
    //             builder: (context, state, child) {
    //               switch (state as CameraFacing) {
    //                 case CameraFacing.front:
    //                   return const Icon(Icons.camera_front);
    //                 case CameraFacing.back:
    //                   return const Icon(Icons.camera_rear);
    //               }
    //             },
    //           ),
    //           iconSize: 32.0,
    //           onPressed: () => cameraController.switchCamera(),
    //         ),
    //       ],
    //     ),
    //     body: Stack(children: [
    //       MobileScanner(
    //         allowDuplicates: false,
    //         controller: cameraController,
    //         onDetect: (Barcode barcode, MobileScannerArguments? args) {
    //           if (barcode.rawValue == null) {
    //             debugPrint('Failed to scan Barcode');
    //           } else {
    //             final String code = barcode.rawValue!;
    //             debugPrint('Barcode found! $code');
    //           }
    //         },
    //       ),
    //       QRScannerOverlay(overlayColour: Colors.black.withOpacity(0.5))
    //     ])
    //     );
  }
}

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.cameraController,
  }) : super(key: key);

  final MobileScannerController cameraController;

  @override
  Widget build(BuildContext context) {
    final scanQR = BlocProvider.of<QrBloc>(context);
    return Stack(children: [
      MobileScanner(
        allowDuplicates: false,
        controller: cameraController,
        onDetect: (Barcode barcode, MobileScannerArguments? args) {
          if (barcode.rawValue == null) {
            debugPrint('Failed to scan Barcode');
          } else {
            final String code = barcode.rawValue!;
            scanQR.add(RequestAPI(code));
            debugPrint('Barcode found! $code');
          }
        },
      ),
      QRScannerOverlay(overlayColour: Colors.black.withOpacity(0.5))
    ]);
  }
}

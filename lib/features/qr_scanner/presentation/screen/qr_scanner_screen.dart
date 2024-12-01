import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:split_bill/core/extensions/media_query_extension.dart';
import 'package:split_bill/features/qr_scanner/presentation/widgets/qr_scanner_overlay.dart';

class QrScannerScreen extends StatefulWidget {
  const QrScannerScreen({super.key});

  @override
  State<QrScannerScreen> createState() => _QrScannerScreenState();
}

class _QrScannerScreenState extends State<QrScannerScreen> {
  MobileScannerController cameraController = MobileScannerController();

  @override
  void initState() {
    cameraController.start();
    super.initState();
  }

  @override
  void dispose() {
    cameraController.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = context.width;
    final height = context.height;
    final scanWindowWidth = context.width * 0.8;
    final scanWindowHeight = scanWindowWidth;
    final left = (width - scanWindowWidth) / 2;
    final top = (height - scanWindowHeight) / 3;

    return Scaffold(
      body: Stack(
        children: [
          MobileScanner(
            controller: cameraController,
            overlayBuilder: (context, constraints) {
              return const QRScannerOverlay(overlayColour: Colors.black38);
            },
            onDetect: (barcodes) {
              context.go('/room');
            },
            scanWindow: Rect.fromLTWH(left, top, scanWindowWidth, scanWindowHeight),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: SafeArea(
              child: IconButton(
                onPressed: () {
                  context.pop();
                },
                color: Colors.white,
                icon: const Icon(Icons.arrow_back_ios),
              ),
            ),
          )
        ],
      ),
    );
  }
}

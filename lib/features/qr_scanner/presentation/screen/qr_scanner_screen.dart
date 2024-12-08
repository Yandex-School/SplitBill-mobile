import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';
import 'package:split_bill/core/extensions/media_query_extension.dart';
import 'package:split_bill/features/event_room/presentation/provider/event_room_provider.dart';
import 'package:split_bill/features/qr_scanner/presentation/widgets/qr_scanner_overlay.dart';

class QrScannerScreen extends StatefulWidget {
  const QrScannerScreen({super.key});

  @override
  State<QrScannerScreen> createState() => _QrScannerScreenState();
}

class _QrScannerScreenState extends State<QrScannerScreen> {
  MobileScannerController cameraController = MobileScannerController();
  late final EventRoomProvider eventProvider;

  @override
  void initState() {
    eventProvider = context.read<EventRoomProvider>();
    cameraController.start();
    eventProvider.addListener(_initListener);
    super.initState();
  }

  void _initListener() {
    if (eventProvider.failure != null) {
      context.scaffoldMessage.showSnackBar(const SnackBar(content: Text('Something went error')));
    }

    if (eventProvider.isJoined != null && eventProvider.isJoined == true) {
      context.go('/event-rooms/room/${eventProvider.currentRoomId}');
    }
  }

  @override
  void dispose() {
    eventProvider.removeListener(_initListener);
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
            onDetect: (barcode) {
              eventProvider.setRoomId(barcode.barcodes.first.displayValue!);
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

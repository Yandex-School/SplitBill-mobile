import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:split_bill/core/extensions/media_query_extension.dart';
import 'package:split_bill/core/theme/app_colors.dart';

class ScanRoomScreen extends StatelessWidget {
  final String? id;
  const ScanRoomScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.SCAFFOLD_BACKGROUND_COLOR,
        foregroundColor: Colors.white,
        title: const Text('Split Bills'),
        centerTitle: true,
      ),
      backgroundColor: AppColors.SCAFFOLD_BACKGROUND_COLOR,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: QrImageView(
                  data: id ?? 'null',
                  size: context.width * 0.8,
                  eyeStyle: const QrEyeStyle(eyeShape: QrEyeShape.square, color: Colors.white),
                  dataModuleStyle: const QrDataModuleStyle(
                    dataModuleShape: QrDataModuleShape.square,
                    color: Colors.white,
                  ),
                  version: 4,
                ),
              ),
              const Gap(10),
            ],
          ),
        ),
      ),
    );
  }
}

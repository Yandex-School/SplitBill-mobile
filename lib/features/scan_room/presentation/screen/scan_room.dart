import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:split_bill/core/extensions/media_query_extension.dart';

class ScanRoomScreen extends StatelessWidget {
  final String? id;

  const ScanRoomScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.primaryColor,
        foregroundColor: theme.appBarTheme.iconTheme?.color ?? Colors.white,
        title: Text(
          'Split Bills',
          style: theme.appBarTheme.titleTextStyle,
        ),
        centerTitle: true,
      ),
      backgroundColor: theme.scaffoldBackgroundColor,
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
                  eyeStyle: QrEyeStyle(
                    eyeShape: QrEyeShape.square,
                    color: theme.textTheme.bodyLarge?.color ?? Colors.white,
                  ),
                  dataModuleStyle: QrDataModuleStyle(
                    dataModuleShape: QrDataModuleShape.square,
                    color: theme.textTheme.bodyLarge?.color ?? Colors.white,
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

import 'dart:math';

import 'package:flutter/material.dart';

class UiKitPieChartPainter extends CustomPainter {
  final List<UiKitPieCharItemData> data;

  UiKitPieChartPainter({required this.data});

  double get dataSum => data.fold(0, (previousValue, element) => previousValue + element.value);

  @override
  void paint(Canvas canvas, Size size) {
    const strokeWidth = 16.0;
    final diameter = min(size.width - strokeWidth, size.height - strokeWidth);
    final radius = diameter / 2;
    double startAngle = 0;

    for (final item in data) {
      final sweepAngle = (item.value / dataSum) * 2 * pi;

      final paint = Paint()
        ..color = item.color
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth;
      canvas.drawArc(
        Rect.fromCircle(center: size.center(Offset.zero), radius: radius),
        startAngle,
        sweepAngle,
        false,
        paint,
      );
      startAngle += sweepAngle;
    }
  }

  @override
  bool shouldRepaint(UiKitPieChartPainter oldDelegate) => data != oldDelegate.data;
}

class UiKitPieCharItemData {
  final Color color;
  final num value;
  final String itemName;
  final String itemValueMetricsName;

  UiKitPieCharItemData({
    required this.color,
    required this.value,
    required this.itemName,
    this.itemValueMetricsName = '%',
  });
}

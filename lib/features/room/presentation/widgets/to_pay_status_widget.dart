import 'package:flutter/material.dart';
import 'package:split_bill/core/extensions/media_query_extension.dart';
import 'package:split_bill/core/theme/app_diemens.dart';

class TotalPaymentStatus extends StatelessWidget {
  final double toPayPercent;

  const TotalPaymentStatus({
    super.key,
    required this.toPayPercent,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: AnimatedContainer(
            width: context.width * toPayPercent,
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppDimens.BORDER_RADIUS_20),
              color: const Color(0xff00d09e),
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            "${toPayPercent * 100} %",
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
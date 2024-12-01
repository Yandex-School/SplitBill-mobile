
import 'package:flutter/material.dart';
import 'package:split_bill/core/theme/app_diemens.dart';

class PaymentInfoStatusWidget extends StatelessWidget {
  final double toPay;
  final double paid;

  const PaymentInfoStatusWidget({
    super.key,
    required this.toPay,
    required this.paid,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.PADDING_16),
      sliver: SliverToBoxAdapter(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text.rich(
              TextSpan(
                text: "\$ $toPay ",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                children: const [
                  TextSpan(
                    text: 'Отправлено',
                    style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            Text.rich(
              TextSpan(
                text: "\$ $paid ",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                children: const [
                  TextSpan(
                    text: 'Получено',
                    style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:split_bill/core/theme/app_theme.dart';


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
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      sliver: SliverToBoxAdapter(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text.rich(
              TextSpan(
                text: "\$ $toPay ",
                style: AppTheme.paymentTextStyle(context), 
                children: [
                  TextSpan(
                    text: 'Отправлено',
                    style: AppTheme.paymentSubTextStyle(context), 
                  ),
                ],
              ),
            ),
            Text.rich(
              TextSpan(
                text: "\$ $paid ",
                style: AppTheme.paymentTextStyle(context), 
                children: [
                  TextSpan(
                    text: 'Получено',
                    style: AppTheme.paymentSubTextStyle(context), 
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

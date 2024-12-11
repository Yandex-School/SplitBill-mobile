// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:split_bill/core/enums/enums.dart';
import 'package:split_bill/core/extensions/media_query_extension.dart';
import 'package:split_bill/core/theme/app_diemens.dart';

class GuestItem extends StatelessWidget {
  final String name;
  final String? amount;
  final String? payStatus;
  final String? percentage;
  final void Function()? onAssignPayment;
  final void Function()? onTap;

  const GuestItem({
    super.key,
    required this.name,
    this.amount,
    this.payStatus,
    this.percentage,
    this.onAssignPayment,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    int randomizeImage() => Random().nextInt(6);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: context.height * 0.12,
        margin: const EdgeInsets.all(AppDimens.MARGIN_10),
        padding: const EdgeInsets.all(AppDimens.PADDING_12),
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(AppDimens.BORDER_RADIUS_40),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: theme.primaryColor,
                  foregroundImage: AssetImage('assets/png/person-${randomizeImage()}.png'),
                ),
                const Gap(10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  "сумма к оплате ",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  "$amount",
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

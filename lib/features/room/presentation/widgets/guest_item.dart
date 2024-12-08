import 'dart:math';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:split_bill/core/enums/enums.dart';
import 'package:split_bill/core/extensions/media_query_extension.dart';
import 'package:split_bill/core/theme/app_diemens.dart';
import 'package:split_bill/features/person/pages/person.dart';

class GuestItem extends StatelessWidget {
  final String name;
  final PayStatus payStatus;
  final String? amount;
  final String? percentage;
  final void Function()? onAssignPayment;

  const GuestItem({
    super.key,
    required this.name,
    required this.payStatus,
    this.amount,
    this.percentage,
    this.onAssignPayment,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    int randomizeImage() => Random().nextInt(6);

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Profile1(
              onToggleTheme: () {},
              isDarkMode: false,
            ),
          ),
        );
      },
      child: Container(
        height: context.height * 0.12,
        margin: const EdgeInsets.all(AppDimens.MARGIN_10),
        padding: const EdgeInsets.all(AppDimens.PADDING_12),
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.dark
              ? const Color.fromRGBO(6, 32, 54, 1) // Темный фон
              : theme.primaryColor, // Светлый фон (не ярко-белый)
          borderRadius: BorderRadius.circular(AppDimens.BORDER_RADIUS_40),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  foregroundImage: AssetImage(
                    'assets/png/person-${randomizeImage()}.png',
                  ),
                  radius: 37.5,
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
                    if (percentage != null)
                      Text.rich(
                        TextSpan(
                          text: '$percentage % ',
                          style: TextStyle(
                            color: payStatus == PayStatus.PAID ? theme.colorScheme.secondary : theme.colorScheme.error,
                            fontSize: 14,
                          ),
                          children: [
                            TextSpan(
                              text: payStatus.name,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.textTheme.bodyMedium?.color?.withOpacity(0.6),
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

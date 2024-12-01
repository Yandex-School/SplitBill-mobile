import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:split_bill/core/enums/enums.dart';
import 'package:split_bill/core/extensions/media_query_extension.dart';
import 'package:split_bill/core/theme/app_colors.dart';
import 'package:split_bill/core/theme/app_diemens.dart';

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
    return Container(
      height: context.height * 0.12,
      margin: const EdgeInsets.all(AppDimens.MARGIN_10),
      padding: const EdgeInsets.all(AppDimens.PADDING_12),
      decoration: BoxDecoration(
        color: const Color(0xff1f2a3c),
        borderRadius: BorderRadius.circular(AppDimens.BORDER_RADIUS_40),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(),
              const Gap(10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  percentage == null
                      ? const SizedBox()
                      : Text.rich(
                          TextSpan(
                            text: '$percentage % ',
                            style: TextStyle(
                              color: payStatus == PayStatus.PAID ? Colors.green : Colors.red,
                              fontSize: 14,
                            ),
                            children: [
                              TextSpan(
                                text: payStatus.name,
                                style: const TextStyle(
                                  color: Colors.grey,
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
          payStatus == PayStatus.INITAL
              ? ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(AppColors.PRIMARY_COLOR),
                    foregroundColor: WidgetStatePropertyAll(Colors.black),
                  ),
                  onPressed: () {},
                  child: const Text('Добавить сумму'),
                )
              : Text(
                  "\$ $amount",
                  style: TextStyle(
                    color: payStatus == PayStatus.PAID ? Colors.green : Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                )
        ],
      ),
    );
  }
}

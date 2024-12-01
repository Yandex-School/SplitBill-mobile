import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:split_bill/core/enums/enums.dart';
import 'package:split_bill/core/extensions/media_query_extension.dart';
import 'package:split_bill/core/theme/app_colors.dart';
import 'package:split_bill/core/theme/app_diemens.dart';
import 'package:split_bill/features/room/presentation/widgets/guest_item.dart';
import 'package:split_bill/features/room/presentation/widgets/payment_info_status_widget.dart';

import '../widgets/to_pay_status_widget.dart';

class RoomScreen extends StatelessWidget {
  const RoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(5, 19, 38, 1),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: false,
            backgroundColor: AppColors.PRIMARY_COLOR,
            expandedHeight: context.height * 0.4,
            title: const Text("Бобур"),
            actions: [
              const CircleAvatar(),
              const SizedBox(width: 10),
              IconButton.outlined(
                onPressed: () {},
                icon: const Icon(Icons.notifications_none_rounded),
              ),
              const SizedBox(width: 10),
            ],
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(AppDimens.BORDER_RADIUS_20),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 150,
                      height: 150,
                      child: PieChart(
                        PieChartData(
                          sections: [
                            PieChartSectionData(),
                            PieChartSectionData(),
                            PieChartSectionData(),
                            PieChartSectionData(),
                            PieChartSectionData(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(AppDimens.PADDING_16),
              child: Text(
                "Статус оплаты",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: AppDimens.PADDING_16),
              width: context.width,
              height: context.height * 0.05,
              decoration: BoxDecoration(
                color: const Color(0xff010d1e),
                borderRadius: BorderRadius.circular(AppDimens.BORDER_RADIUS_20),
              ),
              child: const TotalPaymentStatus(
                toPayPercent: 0.6,
              ),
            ),
          ),
          const SliverGap(10),
          const PaymentInfoStatusWidget(
            paid: 540,
            toPay: 140,
          ),
          const SliverGap(10),
          SliverList.builder(
            itemCount: 100,
            itemBuilder: (context, index) {
              return const GuestItem(
                name: 'Bobur',
                payStatus: PayStatus.INITAL,
              );
            },
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go('/event-rooms/scan-room/123123'),
        backgroundColor: AppColors.PRIMARY_COLOR,
        child: const Icon(Icons.qr_code_2_rounded),
      ),
    );
  }
}

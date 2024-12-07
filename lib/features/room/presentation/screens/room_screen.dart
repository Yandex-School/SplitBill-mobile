import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:split_bill/core/enums/enums.dart';
import 'package:split_bill/core/extensions/media_query_extension.dart';
import 'package:split_bill/core/theme/app_diemens.dart';
import 'package:split_bill/features/room/presentation/widgets/guest_item.dart';
import 'package:split_bill/features/room/presentation/widgets/payment_info_status_widget.dart';
import '../widgets/to_pay_status_widget.dart';

class RoomScreen extends StatelessWidget {
  const RoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: false,
            backgroundColor: theme.primaryColor,
            expandedHeight: context.height * 0.4,
            title: Text(
              "Bobur",
              style: theme.textTheme.titleLarge?.copyWith(
                color: theme.primaryTextTheme.titleLarge?.color,
              ),
            ),
            actions: [
              IconButton.outlined(
                onPressed: () {},
                icon: const Icon(Icons.notifications_none_rounded, color: Colors.black),
              ),
            ],
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(AppDimens.BORDER_RADIUS_20),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: 150,
                  height: 150,
                  child: PieChart(
                    PieChartData(
                      pieTouchData: PieTouchData(),
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
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(AppDimens.PADDING_16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      context.go('/event-rooms/room/sqlite-screen'); // Navigate to SQLiteScreen
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.primaryColor,
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppDimens.BORDER_RADIUS_20),
                      ),
                    ),
                    child: const Text(
                      "Общий счет",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Статус оплаты",
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.textTheme.titleLarge?.color ?? Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: AppDimens.PADDING_16),
              width: context.width,
              height: context.height * 0.05,
              decoration: BoxDecoration(
                color: theme.cardColor,
                borderRadius: BorderRadius.circular(AppDimens.BORDER_RADIUS_20),
              ),
              child: const TotalPaymentStatus(toPayPercent: 0.6),
            ),
          ),
          const SliverGap(10),
          const PaymentInfoStatusWidget(paid: 540, toPay: 140),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go('/event-rooms/scan-room/123123'),
        backgroundColor: theme.primaryColor,
        child: const Icon(Icons.qr_code_2_rounded, color: Colors.black),
      ),
    );
  }
}

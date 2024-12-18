import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:split_bill/core/enums/enums.dart';
import 'package:split_bill/core/extensions/media_query_extension.dart';
import 'package:split_bill/core/theme/app_diemens.dart';
import 'package:split_bill/features/event_room/presentation/provider/event_room_provider.dart';
import 'package:split_bill/features/room/presentation/provider/room_provider.dart';
import 'package:split_bill/features/room/presentation/widgets/guest_item.dart';
import 'package:split_bill/features/room/presentation/widgets/payment_info_status_widget.dart';

import '../widgets/to_pay_status_widget.dart';

class RoomScreen extends StatefulWidget {
  final String? roomId;

  const RoomScreen({super.key, required this.roomId});

  @override
  State<RoomScreen> createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
  late final EventRoomProvider eventRoomProvider;
  late final RoomProvider roomProvider;

  @override
  void initState() {
    eventRoomProvider = context.read<EventRoomProvider>();
    roomProvider = context.read<RoomProvider>();
    roomProvider.initData(widget.roomId!);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    eventRoomProvider.closeRoom();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    log(widget.roomId.toString());

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Consumer<RoomProvider>(
        builder: (context, roomProvider, child) {
          if (roomProvider.status == Status.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: false,
                backgroundColor: theme.primaryColor,
                // expandedHeight: context.height * 0.4,
                title: Text(
                  roomProvider.roomInfo?.name ?? 'null',
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: theme.primaryTextTheme.titleLarge?.color,
                  ),
                ),

                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(AppDimens.BORDER_RADIUS_20),
                  ),
                ),
              ),
              const SliverGap(10),
              SliverToBoxAdapter(
                child: Center(
                  child: Text(
                    " Сумма: ${roomProvider.roomInfo?.totalPrice.toString()} ",
                    style: context.theme.textTheme.bodyLarge,
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
                          context.go('/event-rooms/room/${widget.roomId}/products');
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
              SliverPadding(
                padding: const EdgeInsets.all(16),
                sliver: SliverToBoxAdapter(
                  child: Text("Количество участников: ${roomProvider.roomInfo?.totalMembers}"),
                ),
              ),
              SliverList.builder(
                itemCount: roomProvider.userData?.data.length ?? 0,
                itemBuilder: (context, index) {
                  final item = roomProvider.userData?.data[index];
                  return GuestItem(
                    name: item?.fullName ?? "",
                    amount: item?.amount.toString() ?? '',
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => SimpleDialog(
                          insetPadding: EdgeInsets.zero,
                          contentPadding: const EdgeInsets.all(16),
                          children: item?.products
                                  .map(
                                    (e) => Container(
                                      margin: const EdgeInsets.symmetric(vertical: 16),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            e.name,
                                            style: context.theme.textTheme.bodyLarge,
                                          ),
                                          Column(
                                            children: [
                                              Text(e.price.toString()),
                                              Text(e.status),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                  .toList() ??
                              [],
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go('/event-rooms/room/${widget.roomId}/scan-room/123123'),
        backgroundColor: theme.primaryColor,
        child: const Icon(Icons.qr_code_2_rounded, color: Colors.black),
      ),
    );
  }
}

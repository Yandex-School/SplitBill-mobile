import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:split_bill/core/theme/app_diemens.dart';
import 'package:split_bill/core/utils/text_utils.dart';
import 'package:split_bill/features/event_room/presentation/provider/event_room_provider.dart';

class CustomSpeedDial extends StatefulWidget {
  const CustomSpeedDial({super.key});

  @override
  State<CustomSpeedDial> createState() => _CustomSpeedDialState();
}

class _CustomSpeedDialState extends State<CustomSpeedDial> {
  final TextEditingController _textEditingController = TextEditingController();
  bool _isDialOpen = false; // Track if the SpeedDial is open or closed

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ClipRRect(
      borderRadius:
          BorderRadius.circular(16), // Adjust this value for corner roundness
      child: SpeedDial(
        backgroundColor: theme.primaryColor,
        foregroundColor: Colors.black,
        overlayColor: theme.scaffoldBackgroundColor,
        overlayOpacity: 0.5,
        spacing: 12,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16), // Ensure rounded corners
        ),
        spaceBetweenChildren: 12,
        onOpen: () {
          setState(() {
            _isDialOpen = true;
          });
        },
        onClose: () {
          setState(() {
            _isDialOpen = false;
          });
        },
        children: [
          SpeedDialChild(
            child: const Icon(Icons.add, color: Colors.black),
            backgroundColor: theme.primaryColor,
            label: 'Create Room',
            labelStyle: theme.textTheme.bodyLarge?.copyWith(fontSize: 16),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    insetPadding: const EdgeInsets.symmetric(
                        horizontal: AppDimens.MARGIN_16),
                    child: Container(
                      padding: const EdgeInsets.all(AppDimens.PADDING_16),
                      height: 200,
                      child: Column(
                        children: [
                          const Text("Enter room name"),
                          const Gap(10),
                          TextField(
                            controller: _textEditingController,
                            decoration: const InputDecoration(
                              hintText: "Enter name",
                              labelStyle: TextStyle(
                                color: TextUtils.grey,
                                fontSize: 14,
                              ),
                              prefixIcon:
                                  Icon(Icons.lock, color: TextUtils.grey),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              context.read<EventRoomProvider>().createRoom(
                                    _textEditingController.text,
                                    (roomId) =>
                                        context.go('/event-rooms/room/$roomId'),
                                  );
                            },
                            child: const Text('Join'),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
          SpeedDialChild(
            child: const Icon(Icons.qr_code, color: Colors.black),
            backgroundColor: theme.primaryColor,
            label: 'Join Room',
            labelStyle: theme.textTheme.bodyLarge?.copyWith(fontSize: 16),
            onTap: () {
              context.go('/event-rooms/qr-scanner');
            },
          ),
        ],
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: Icon(
            _isDialOpen ? Icons.clear : Icons.add,
            key: ValueKey<bool>(_isDialOpen),
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Future<dynamic> _showDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: AppDimens.MARGIN_16),
          child: Container(
            padding: const EdgeInsets.all(AppDimens.PADDING_16),
            height: 200,
            child: Column(
              children: [
                const Text("Введите названия комнаты"),
                const Gap(10),
                TextField(
                  controller: _textEditingController,
                  decoration: const InputDecoration(
                    hintText: "Введите названия",
                    labelStyle: TextStyle(
                      color: TextUtils.grey,
                      fontSize: 14,
                    ),
                    prefixIcon: Icon(Icons.lock, color: TextUtils.grey),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await context.read<EventRoomProvider>().createRoom(
                          _textEditingController.text,
                          (roomId) => context.go('/event-rooms/room/$roomId'),
                        );

                    if (mounted) {
                      context.pop();
                    }
                  },
                  child: const Text('Войти'),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

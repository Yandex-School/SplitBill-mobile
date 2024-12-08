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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SpeedDial(
      animatedIcon: AnimatedIcons.add_event,
      backgroundColor: theme.primaryColor,
      foregroundColor: Colors.black,
      overlayColor: theme.scaffoldBackgroundColor,
      overlayOpacity: 0.5,
      spacing: 12,
      spaceBetweenChildren: 12,
      children: [
        SpeedDialChild(
          child: const Icon(Icons.add, color: Colors.black),
          backgroundColor: theme.primaryColor,
          label: 'Создать счет ',
          labelStyle: theme.textTheme.bodyLarge?.copyWith(fontSize: 16),
          onTap: () {
            showDialog(
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
                          onPressed: () {
                            context.read<EventRoomProvider>().createRoom(
                                  _textEditingController.text,
                                  (roomId) => context.go('/event-rooms/room/$roomId'),
                                );
                          },
                          child: const Text('Войти'),
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
          label: 'Присоединиться ',
          labelStyle: theme.textTheme.bodyLarge?.copyWith(fontSize: 16),
          onTap: () {
            context.go('/event-rooms/qr-scanner');
          },
        ),
      ],
    );
  }
}

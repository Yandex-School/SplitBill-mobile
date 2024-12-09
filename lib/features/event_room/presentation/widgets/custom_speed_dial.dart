import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:split_bill/core/theme/app_colors.dart';
import 'package:split_bill/core/theme/app_diemens.dart';
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
  void dispose() {
    _textEditingController.dispose(); // Освобождаем ресурс контроллера
    super.dispose();
  }

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
          child: const Icon(
            Icons.add,
            color: Colors.black,
          ),
          backgroundColor: theme.primaryColor,
          label: 'Создать счет',
          labelStyle: theme.textTheme.bodyLarge?.copyWith(fontSize: 16),
          onTap: () async {
            await _showDialog(context); // Вызов диалогового окна
          },
        ),
        SpeedDialChild(
          child: const Icon(Icons.qr_code, color: Colors.black),
          backgroundColor: theme.primaryColor,
          label: 'Присоединиться',
          labelStyle: theme.textTheme.bodyLarge?.copyWith(fontSize: 16),
          onTap: () {
            context.go('/event-rooms/qr-scanner'); // Переход на страницу сканера QR-кодов
          },
        ),
      ],
    );
  }

  Future<dynamic> _showDialog(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 16.0),
          backgroundColor: isDarkMode ? AppColors.darkBackground : AppColors.lightBackground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Container(
            padding: const EdgeInsets.all(16.0),
            height: 240,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Введите название комнаты",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? AppColors.darkText : AppColors.lightText,
                  ),
                ),
                const Gap(12),
                TextField(
                  controller: _textEditingController,
                  decoration: InputDecoration(
                    hintText: "Введите название",
                    hintStyle: TextStyle(
                      color: isDarkMode ? AppColors.darkSubText : AppColors.lightSubText,
                    ),
                    labelStyle: TextStyle(
                      color: isDarkMode ? AppColors.darkSubText : AppColors.lightSubText,
                      fontSize: 14,
                    ),
                    prefixIcon: Icon(
                      Icons.text_fields,
                      color: isDarkMode ? AppColors.darkSubText : AppColors.lightSubText,
                    ),
                    filled: true,
                    fillColor: isDarkMode ? AppColors.darkBackground.withOpacity(0.6) : Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: isDarkMode ? AppColors.darkSubText : AppColors.lightSubText,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: theme.primaryColor,
                      ),
                    ),
                  ),
                  style: TextStyle(
                    color: isDarkMode ? AppColors.darkText : AppColors.lightText,
                  ),
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () async {
                      await context.read<EventRoomProvider>().createRoom(
                            _textEditingController.text,
                            (roomId) => context.go('/event-rooms/room/$roomId'),
                          );

                      if (mounted) {
                        context.pop();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.primaryColor,
                      foregroundColor: isDarkMode ? AppColors.darkText : AppColors.lightText,
                    ),
                    child: const Text('Создать'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

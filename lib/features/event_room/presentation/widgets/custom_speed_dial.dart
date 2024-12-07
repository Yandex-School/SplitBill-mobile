import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../domain/controllers/list_controller.dart';

class CustomSpeedDial extends StatelessWidget {
  const CustomSpeedDial({Key? key}) : super(key: key);

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
          onTap: () => context.read<ListController>().addNewItem(),
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

import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:split_bill/core/theme/app_colors.dart';
import 'package:split_bill/features/onboarding/presentation/screen/on_boarding_screen.dart';
import '../../domain/controllers/list_controller.dart';

class CustomSpeedDial extends StatelessWidget {
  const CustomSpeedDial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      animatedIcon: AnimatedIcons.add_event,
      backgroundColor: Colors.orange,
      foregroundColor: AppColors.SCAFFOLD_BACKGROUND_COLOR,
      overlayColor: AppColors.SCAFFOLD_BACKGROUND_COLOR,
      overlayOpacity: 0.5,
      spacing: 12,
      spaceBetweenChildren: 12,
      children: [
        SpeedDialChild(
          child: const Icon(Icons.add, color: Color(0xff051326)),
          backgroundColor: AppColors.PRIMARY_COLOR,
          label: 'Создать счет ',
          labelStyle: const TextStyle(fontSize: 16),
          onTap: () => context.read<ListController>().addNewItem(),
        ),
        SpeedDialChild(
          child: const Icon(Icons.qr_code, color: Color(0xff051326)),
          backgroundColor: AppColors.PRIMARY_COLOR,
          label: 'Присоединиться ',
          labelStyle: const TextStyle(fontSize: 16),
          onTap: () {
            context.go('/event-rooms/qr-scanner');
          },
        ),
      ],
    );
  }
}

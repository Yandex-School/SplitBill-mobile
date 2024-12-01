import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:provider/provider.dart';
import '../../domain/controllers/list_controller.dart';

class CustomSpeedDial extends StatelessWidget {
  const CustomSpeedDial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      animatedIcon: AnimatedIcons.add_event,
      backgroundColor: Colors.yellow, 
      foregroundColor: Color(0xff051326), 
      overlayColor: Color(0xff051326),
      overlayOpacity: 0.5,
      spacing: 12,
      spaceBetweenChildren: 12,
      children: [
        SpeedDialChild(
          child: const Icon(Icons.add, color: Color(0xff051326)),
          backgroundColor: Colors.yellow, 
          label: 'Создать счет ',
          labelStyle: const TextStyle(fontSize: 16),
          onTap: () => context.read<ListController>().addNewItem(),
        ),
        SpeedDialChild(
          child: const Icon(Icons.qr_code, color: Color(0xff051326)),
          backgroundColor: Colors.yellow, 
          label: 'Присоединиться ',
          labelStyle: const TextStyle(fontSize: 16),
          onTap: () {
        
          },
        ),
      ],
    );
  }
}

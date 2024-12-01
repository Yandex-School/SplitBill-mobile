import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:split_bill/features/event_room/data/repositories/mock_repository.dart';
import 'package:split_bill/features/event_room/domain/controllers/list_controller.dart';
import 'package:split_bill/presentation/login_page/domain/providers/login_provider.dart';

class ProviderScope extends StatelessWidget {
  final Widget child;
  const ProviderScope({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ListController(MockRepository()),
        ),
        ChangeNotifierProvider(
          create: (_) => LoginProvider(),
        ),
      ],
      child: child,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:split_bill/core/DI/dependencies_config.dart';
import 'package:split_bill/core/theme/theme_notifier.dart';
import 'package:split_bill/features/event_room/presentation/provider/event_room_provider.dart';
import 'package:split_bill/features/login/presentation/provider/login_provider.dart';

class ProviderScope extends StatelessWidget {
  final Widget child;
  const ProviderScope({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => getIt<EventRoomProvider>(),
        ),
        ChangeNotifierProvider(
          create: (_) => LoginProvider(),
        ),
        ChangeNotifierProvider(create: (_) => ThemeNotifier()),
      ],
      child: child,
    );
  }
}

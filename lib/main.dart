import 'package:flutter/material.dart';
import 'package:split_bill/core/DI/dependencies_config.dart';
import 'package:split_bill/core/router/app_router.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependencies();
  runApp(SplitBills());
}

class SplitBills extends StatelessWidget {
  SplitBills({super.key});

  final AppRouter router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router.router,
    );
  }
}

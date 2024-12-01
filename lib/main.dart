import 'package:flutter/material.dart';
import 'package:split_bill/core/router/app_router.dart';
import 'package:split_bill/core/scope/provider_scope.dart';

void main(List<String> args) {
  runApp(ProviderScope(child: SplitBills()));
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

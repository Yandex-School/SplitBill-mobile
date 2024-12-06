import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:split_bill/core/DI/dependencies_config.dart';
import 'package:split_bill/core/router/app_router.dart';
import 'package:split_bill/core/scope/provider_scope.dart';
import 'package:split_bill/core/theme/theme_notifier.dart';
import 'package:get_it/get_it.dart';
import 'package:split_bill/features/login/presentation/provider/login_provider.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependencies();

  runApp(
    ProviderScope(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ThemeNotifier()),
          ChangeNotifierProvider(create: (_) => GetIt.instance<LoginProvider>()),
        ],
        child: SplitBills(),
      ),
    ),
  );
}

class SplitBills extends StatelessWidget {
  SplitBills({super.key});

  final AppRouter router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, themeNotifier, _) {
        return MaterialApp.router(
          routerConfig: router.router,
          theme: themeNotifier.currentTheme,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
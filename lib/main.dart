import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:split_bill/core/DI/dependencies_config.dart';
import 'package:split_bill/core/router/app_router.dart';
import 'package:split_bill/core/scope/provider_scope.dart';
import 'package:split_bill/core/theme/theme_notifier.dart';
import 'package:get_it/get_it.dart';

import 'package:split_bill/features/login/presentation/provider/login_provider.dart';

Future<void> main(List<String> args) async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await setupDependencies();

  FlutterNativeSplash.remove();

  runApp(
    ProviderScope(child: SplitBills()),
    ProviderScope(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ThemeNotifier()),
          ChangeNotifierProvider(
              create: (_) => GetIt.instance<LoginProvider>()),
        ],
        child: const SplitBills(),
      ),
    ),
  );
}

class SplitBills extends StatelessWidget {
  const SplitBills({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, themeNotifier, _) {
        return MaterialApp.router(
          routerConfig: getIt.get<AppRouter>().router,
          theme: themeNotifier.currentTheme,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}

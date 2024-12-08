import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:split_bill/core/DI/dependencies_config.dart';
import 'package:split_bill/core/local_data/shared_preferences.dart';

import 'package:split_bill/core/utils/const.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateAfterDelay();
  }

  Future<void> _navigateAfterDelay() async {
    await Future.delayed(const Duration(milliseconds: 300));

    final sharedPrefsService = getIt<SharedPrefsService>();
    final passedOnboarding = sharedPrefsService.getBool(Constants.PASSED_ON_BOARDING);

    // ignore: unrelated_type_equality_checks
    if (passedOnboarding == true) {
      // ignore: use_build_context_synchronously
      context.go('/login');
    // ignore: unrelated_type_equality_checks
    } else if(passedOnboarding != true){
      // ignore: use_build_context_synchronously
      context.go('/on_boarding');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff051326), // Use your app's primary color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Your app logo or splash screen content
            FlutterLogo(size: 100),
            SizedBox(height: 20),
            CircularProgressIndicator(
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

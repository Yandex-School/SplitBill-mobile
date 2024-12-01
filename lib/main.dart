import 'package:flutter/material.dart';
import 'package:split_bill/core/scope/provider_scope.dart';
import 'package:split_bill/presentation/event_room/presentation/pages/list_page.dart';
import 'package:split_bill/presentation/login_page/pages/login_page.dart';
import 'package:split_bill/presentation/login_page/pages/signup_page.dart';
import 'package:split_bill/presentation/logo_page/animation.dart';

void main() {
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SplitBill',
      initialRoute: '/',
      routes: {
        '/': (context) => const ConcentricAnimationOnboarding(),
        '/list': (context) => const ListPage(),
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignUpPage(),
      },
    );
  }
}

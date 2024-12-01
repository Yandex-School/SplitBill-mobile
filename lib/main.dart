import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:split_bill/presentation/event_room/data/repositories/mock_repository.dart';
import 'package:split_bill/presentation/event_room/domain/controllers/list_controller.dart';
import 'package:split_bill/presentation/event_room/presentation/pages/list_page.dart';
import 'package:split_bill/presentation/login_page/domain/providers/login_provider.dart';
import 'package:split_bill/presentation/login_page/pages/login_page.dart';
import 'package:split_bill/presentation/login_page/pages/signup_page.dart';
import 'package:split_bill/presentation/logo_page/animation.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SplitBill',
        theme: ThemeData(primarySwatch: Colors.blue),
        initialRoute: '/',
        routes: {
          '/': (context) => const ConcentricAnimationOnboarding(),
          '/list': (context) => const ListPage(),
          '/login': (context) => const LoginPage(),
          '/signup': (context) => const SignUpPage(),
        },
      ),
    );
  }
}


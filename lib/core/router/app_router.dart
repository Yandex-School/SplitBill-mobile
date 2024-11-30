import 'package:go_router/go_router.dart';
import 'package:split_bill/features/home/presentation/screens/home_screen.dart';

class AppRouter {
  AppRouter();

  GoRouter get router => _router;

  final _router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeScreen(),
      ),
    ],
  );
}

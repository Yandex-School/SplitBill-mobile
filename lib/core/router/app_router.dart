import 'package:go_router/go_router.dart';
import 'package:split_bill/features/room/presentation/screens/home_screen.dart';
import 'package:split_bill/features/qr_scanner/presentation/screen/qr_scanner_screen.dart';

class AppRouter {
  AppRouter();

  GoRouter get router => _router;

  final _router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const RoomScreen(),
        routes: [
          GoRoute(
            path: '/qr-scanner',
            builder: (context, state) => const QrScannerScreen(),
          ),
        ],
      ),
    ],
  );
}

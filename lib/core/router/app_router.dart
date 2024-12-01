import 'package:go_router/go_router.dart';
import 'package:split_bill/features/event_room/presentation/pages/events_screen.dart';
import 'package:split_bill/features/onboarding/presentation/on_boarding_screen.dart';
import 'package:split_bill/features/qr_scanner/presentation/screen/qr_scanner_screen.dart';
import 'package:split_bill/features/scan_room/presentation/screen/scan_room.dart';

class AppRouter {
  AppRouter();

  GoRouter get router => _router;

  final _router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const ConcentricAnimationOnboarding(),
        routes: [
          GoRoute(
            path: '/event-rooms',
            builder: (context, state) => EventScreen(),
            routes: [
              GoRoute(
                path: '/scan-room/:id',
                builder: (context, state) => ScanRoomScreen(
                  id: state.pathParameters['id'],
                ),
              ),
              GoRoute(
                path: '/qr-scanner',
                builder: (context, state) => const QrScannerScreen(),
              )
            ],
          ),
        ],
      ),
    ],
  );
}

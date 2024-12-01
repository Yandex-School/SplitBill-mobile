import 'package:go_router/go_router.dart';
import 'package:split_bill/features/event_room/presentation/pages/events_screen.dart';
import 'package:split_bill/features/login/presentation/screen/login_screen.dart';
import 'package:split_bill/features/login/presentation/screen/sign_up_screen.dart';
import 'package:split_bill/features/onboarding/presentation/screen/on_boarding_screen.dart';
import 'package:split_bill/features/qr_scanner/presentation/screen/qr_scanner_screen.dart';
import 'package:split_bill/features/room/presentation/screens/room_screen.dart';
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
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
        routes: [
          GoRoute(
            path: 'sign-up',
            builder: (context, state) => const SignUpScreen(),
          ),
        ],
      ),
      GoRoute(
        path: '/event-rooms',
        builder: (context, state) => const EventScreen(),
        routes: [
          GoRoute(
            path: 'room',
            builder: (context, state) => const RoomScreen(),
          ),
          GoRoute(
            path: 'scan-room/:id',
            builder: (context, state) => ScanRoomScreen(
              id: state.pathParameters['id'],
            ),
          ),
          GoRoute(
            path: 'qr-scanner',
            builder: (context, state) => const QrScannerScreen(),
          ),
        ],
      ),
    ],
  );
}

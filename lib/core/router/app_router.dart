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
    initialLocation: '/login', 
    routes: [
      // Onboarding route
      GoRoute(
        path: '/',
        builder: (context, state) => const ConcentricAnimationOnboarding(),
      ),
      // Login route with nested Sign-Up route
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
      // Event rooms route with nested routes
      GoRoute(
        path: '/event-rooms',
        builder: (context, state) => const EventScreen(),
        routes: [
          GoRoute(
            path: 'room',
            builder: (context, state) => const RoomScreen(),
            routes: [
              // GoRoute(
              //   path: 'sqlite-screen',
              //   builder: (context, state) => const SQLiteScreen(),
              // ),
            ],
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

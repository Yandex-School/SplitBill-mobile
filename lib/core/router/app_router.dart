import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:split_bill/core/DI/dependencies_config.dart';
import 'package:split_bill/core/local_data/shared_preferences.dart';
import 'package:split_bill/core/utils/const.dart';
import 'package:split_bill/features/event_room/presentation/pages/events_screen.dart';
import 'package:split_bill/features/login/presentation/screen/login_screen.dart';
import 'package:split_bill/features/login/presentation/screen/sign_up_screen.dart';
import 'package:split_bill/features/onboarding/presentation/screen/on_boarding_screen.dart';
import 'package:split_bill/features/qr_scanner/presentation/screen/qr_scanner_screen.dart';
import 'package:split_bill/features/room/presentation/screens/room_screen.dart';
import 'package:split_bill/features/scan_room/presentation/screen/scan_room.dart';
import 'package:split_bill/features/splash_screen/presentation/pages/splash_screen.dart';

class AppRouter {
  final SharedPrefsService sharedPrefsService;
  AppRouter(this.sharedPrefsService);

  GoRouter get router => _router;

  late final _router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
        redirect: (context, state) {
          final bool isPassedOnBoarding =
              sharedPrefsService.getBool(Constants.PASSED_ON_BOARDING) ?? false;
          if (isPassedOnBoarding) {
            return '/login';
          } else {
            return '/on_boarding';
          }
        },
        
      ),
      GoRoute(
        path: '/on_boarding',
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
//
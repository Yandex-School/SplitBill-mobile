import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:split_bill/core/DI/dependencies_config.dart';
import 'package:split_bill/core/local_data/shared_preferences.dart';
import 'package:split_bill/core/utils/const.dart';
import 'package:split_bill/features/event_room/presentation/pages/events_screen.dart';
import 'package:split_bill/features/login/presentation/screen/login_screen.dart';
import 'package:split_bill/features/login/presentation/screen/sign_up_screen.dart';
import 'package:split_bill/features/onboarding/presentation/screen/on_boarding_screen.dart';
import 'package:split_bill/features/product_room/presentation%20/page/tab_bar.dart';
import 'package:split_bill/features/product_room/presentation/provider/room_products_provider.dart';
import 'package:split_bill/features/product_room/presentation/room_products.dart';
import 'package:split_bill/features/qr_scanner/presentation/screen/qr_scanner_screen.dart';
import 'package:split_bill/features/room/presentation/provider/room_provider.dart';
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
      // Onboarding route
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
        redirect: (context, state) {
          final bool isPassedOnBoarding =
              sharedPrefsService.getBool(Constants.PASSED_ON_BOARDING) ?? false;
          final loggedIn = sharedPrefsService.getInt(Constants.USER_ID) != null;
          if (isPassedOnBoarding) {
            if (loggedIn) {
              return '/event-rooms';
            }
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
            path: 'room/:roomID',
            builder: (context, state) => ChangeNotifierProvider.value(
              value: getIt<RoomProvider>(),
              child: RoomScreen(
                roomId: state.pathParameters['roomID'],
              ),
            ),
            routes: [
              GoRoute(
                path: 'profile',
                builder: (context, state) => TabPage(
                  onThemeToggle: () {},
                  isDarkMode: false,
                ),
              ),
              GoRoute(
                path: 'products',
                builder: (context, state) => ChangeNotifierProvider.value(
                  value: getIt<RoomProductsProvider>(),
                  child: RoomProductsScreen(
                    roomId: state.pathParameters['roomID'],
                  ),
                ),
              ),
              GoRoute(
                path: 'scan-room/:scanID',
                builder: (context, state) => ScanRoomScreen(
                  id: state.pathParameters['scanID'],
                ),
              ),
            ],
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

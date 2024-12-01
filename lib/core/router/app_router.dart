import 'package:go_router/go_router.dart';
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
        builder: (context, state) => const RoomScreen(),
        routes: [
          GoRoute(
            path: '/scan-room/:id',
            builder: (context, state) => ScanRoomScreen(
              id: state.pathParameters['id'],
            ),
          ),
        ],
      ),
    ],
  );
}

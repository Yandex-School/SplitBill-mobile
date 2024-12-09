import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:split_bill/core/DI/dependencies_config.dart';
import 'package:split_bill/features/product_room/presentation%20/provider/room_products_provider.dart';
import 'package:split_bill/features/room/data/repository/room_repository_impl.dart';
import 'package:split_bill/features/room/presentation/provider/room_provider.dart';

class RoomScope extends StatelessWidget {
  final Widget child;

  const RoomScope({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => getIt<RoomProductsProvider>()),
        ChangeNotifierProvider(
          create: (_) => RoomProvider(repository: getIt<RoomRepositoryImpl>()),
        ),
      ],
      child: child,
    );
  }
}

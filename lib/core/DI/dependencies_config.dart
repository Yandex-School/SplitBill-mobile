import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:split_bill/core/local_data/shared_preferences.dart';
import 'package:split_bill/features/event_room/data/datasources/event_room_remote_datasource.dart';
import 'package:split_bill/features/event_room/data/repositories/event_room_repository_impl.dart';
import 'package:split_bill/features/event_room/domain/repository/event_room_repository.dart';
import 'package:split_bill/features/event_room/presentation/provider/event_room_provider.dart';
import 'package:split_bill/features/login/presentation/provider/login_provider.dart';
import 'package:split_bill/core/http_client/http_client.dart';
import 'package:split_bill/features/login/data/auth_datasource.dart';
import 'package:split_bill/features/login/data/login_data_source.dart';
import 'package:split_bill/features/login/domain/login_repository.dart';

part "event_room_di.dart";

GetIt get getIt => GetIt.instance;

Future<void> setupDependencies() async {
  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  final Dio dio = Dio();

  getIt.registerLazySingleton(() => dio);
  getIt.registerSingleton(SharedPrefsService(sharedPreferences));
  getIt.registerFactory<LoginProvider>(() => LoginProvider());

  getIt.registerLazySingleton<AuthorizationRepository>(
    () => LoginRepositoryImpl(
      authApi: AuthorizationApi(dioClient),
    ),
  );
  _initEventRoom();
}

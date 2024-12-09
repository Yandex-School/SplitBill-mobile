part of 'dependencies_config.dart';

void _initEventRoom() async {
  /* =============================DATASOURCES========================= */
  getIt.registerLazySingleton(() => EventRoomApi(getIt()));

/* =============================REPOSITORIES=========================== */
  getIt.registerLazySingleton<IEventRoomRepository>(() => EventRoomRepositoryImpl(eventAPI: getIt()));

/* =============================PROVIDER=================================== */
  getIt.registerLazySingleton(
    () => EventRoomProvider(
      eventRoomRepository: getIt(),
      sharedPrefsService: getIt(),
    ),
  );
  getIt.registerLazySingleton<IRoomRepository>(
    () => RoomRepositoryImpl(roomApi: RoomApi(getIt<Dio>())),
  );
  getIt.registerFactory(
    () => RoomProvider(repository: getIt<IRoomRepository>()),
  );
  getIt.registerFactory(() => RoomProductsProvider());
}

part of 'dependencies_config.dart';

void _initEventRoom() async {
  /* =============================DATASOURCES========================= */
  getIt.registerLazySingleton(() => EventRoomApi(getIt()));

/* =============================REPOSITORIES=========================== */
  getIt.registerLazySingleton<IEventRoomRepository>(() => EventRoomRepositoryImpl(eventAPI: getIt()));

/* =============================PROVIDER=================================== */
  getIt.registerLazySingleton(() => EventRoomProvider(eventRoomRepository: getIt()));
}

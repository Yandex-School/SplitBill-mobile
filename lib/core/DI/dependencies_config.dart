import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:split_bill/core/http_client/http_client.dart';
import 'package:split_bill/core/local_data/shared_preferences.dart';
import 'package:split_bill/features/login/data/auth_datasource.dart';
import 'package:split_bill/features/login/data/login_data_source.dart';
import 'package:split_bill/features/login/domain/login_repository.dart';

GetIt get getIt => GetIt.instance;

Future<void> setupDependencies() async {
  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerSingleton(SharedPrefsService(sharedPreferences));
  getIt.registerLazySingleton<AuthorizationRepository>(
    () => LoginRepositoryImpl(
      authApi: AuthorizationApi(
        dioClient,
      ),
    ),
  );
}

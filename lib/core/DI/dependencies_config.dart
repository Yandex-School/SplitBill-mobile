import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:split_bill/core/local_data/shared_preferences.dart';

GetIt get getIt => GetIt.instance;

Future<void> setupDependencies() async {
  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerSingleton(SharedPrefsService(sharedPreferences));
}

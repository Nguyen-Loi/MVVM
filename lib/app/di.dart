import 'package:advance_flutter/app/app_prefs.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  final sharedPrefs = await SharedPreferences.getInstance();

  //Shared prefs instance
  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  //App prefs instance
  instance.registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));
}

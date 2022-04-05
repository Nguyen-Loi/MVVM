import 'package:advance_flutter/app/app_prefs.dart';
import 'package:advance_flutter/data/data_source/remote_data_source.dart';
import 'package:advance_flutter/data/network/app_api.dart';
import 'package:advance_flutter/data/network/dio_factory.dart';
import 'package:advance_flutter/data/network/network_info.dart';
import 'package:advance_flutter/data/repository/repository_ipml.dart';
import 'package:advance_flutter/domain/repository/repository.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  final sharedPrefs = await SharedPreferences.getInstance();

  //Shared prefs instance
  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  //App prefs instance
  instance
      .registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));

  //Network info
  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(DataConnectionChecker()));

  //Dio factory
  instance.registerLazySingleton<DioFactory>((() => DioFactory(instance())));

  //App service alient
  final dio = await instance<DioFactory>().getDio();
  instance
      .registerLazySingleton<AppServiceClient>((() => AppServiceClient(dio)));

  //Remote data source
  instance.registerLazySingleton<RemoteDataSource>(
      (() => RemoteDataSourceImplementer(instance())));

  //Repository
  instance.registerLazySingleton<Repository>(
      () => RepositoryImpl(instance(), instance()));
}

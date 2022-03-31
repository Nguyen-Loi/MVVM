1. Create data/network/app_api.dart

and path
import 'package:advance_flutter/app/constant.dart';
import 'package:advance_flutter/data/responses/responses.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
part 'app_api.g.dart';

@RestApi(baseUrl: Constant.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST('/customers/login')
  Future<AuthenticationResponse> login();
}

2. Create default app_api.g.dart and must have part 'app_api.g.dart' in app_api.dart;
 flutter pub run build_runner build --delete-conflicting-outputs

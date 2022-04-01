import 'package:advance_flutter/data/network/app_api.dart';
import 'package:advance_flutter/data/request/request.dart';
import 'package:advance_flutter/data/responses/responses.dart';
import 'package:advance_flutter/domain/model.dart';
import 'package:retrofit/http.dart';

abstract class RemoteDataSource {
  Future<AuthenticationResponse> login(LoginRequest loginRequest);
}

class RemoteDataSourceImplement implements RemoteDataSource {
  AppServiceClient _appServiceClient;
  RemoteDataSourceImplement(this._appServiceClient);
  @override
  Future<AuthenticationResponse> login(LoginRequest loginRequest) async {
    return await _appServiceClient.login(loginRequest.email, loginRequest.password,
        loginRequest.imei, loginRequest.deviceType);
  }
}

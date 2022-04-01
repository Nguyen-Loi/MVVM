import 'package:advance_flutter/data/network/network_info.dart';
import 'package:dartz/dartz.dart';

import 'package:advance_flutter/data/data_source/remote_data_source.dart';
import 'package:advance_flutter/data/network/Failure.dart';
import 'package:advance_flutter/data/request/request.dart';
import 'package:advance_flutter/domain/model.dart';
import 'package:advance_flutter/domain/repository.dart';
import 'package:advance_flutter/data/mapper/mapper.dart';

class RepositoryIpml extends Repository {
  RemoteDataSource _remoteDataSource;
  NetworkInfo _networkInfo;
  RepositoryIpml(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, Authenication>> login(
      LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      // its safe to call the api
      final response = await _remoteDataSource.login(loginRequest);

      if (response.status == 0) {
        //success -> right
        return Right(response.toDomain());
      } else {
        // return biz logic error -> Left
        return Left(Failure(
            409, response.message ?? 'We have biz error login from api side'));
      }
    }
    // It's return connection error
    return Left(Failure(409, 'Please check your internet connection'));
  }
}

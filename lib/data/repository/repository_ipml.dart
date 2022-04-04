import 'package:advance_flutter/data/network/error_handler.dart';
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
      try {
        final response = await _remoteDataSource.login(loginRequest);

        if (response.status == ApiInternalStatus.SUCCESS) {
          //success -> right
          return Right(response.toDomain());
        } else {
          // return biz logic error -> Left
          return Left(Failure(response.status ?? ApiInternalStatus.FAILURE,
              response.message ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return (Left(ErrorHandler.handle(error).failure));
      }
    }
    // It's return connection error
     return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
  }
}


class ApiInternalStatus{
  static const int  SUCCESS =0;
  static const int  FAILURE =1;
}

import 'package:advance_flutter/data/request/request.dart';
import 'package:advance_flutter/data/responses/responses.dart';
import 'package:advance_flutter/domain/model.dart';
import 'package:dartz/dartz.dart';

import '../data/network/Failure.dart';

abstract class Repository {
  Future<Either<Failure,Authenication>> login(LoginRequest loginRequest);
}

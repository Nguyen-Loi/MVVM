import 'package:advance_flutter/data/request/request.dart';
import 'package:advance_flutter/data/responses/responses.dart';
import 'package:advance_flutter/domain/model/model.dart';
import 'package:dartz/dartz.dart';

import '../../data/network/Failure.dart';

abstract class Repository {
  Future<Either<Failure,Authentication>> login(LoginRequest loginRequest);
}

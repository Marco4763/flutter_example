import 'package:dartz/dartz.dart';
import 'package:flutter_example/network/model/failure/response_failure_model.dart';
import 'package:flutter_example/network/model/success/response_success_model.dart';

abstract interface class INetworkProvider {
  Future<Either<ResponseSuccessModel, ResponseFailureModel>> get(String path);
}
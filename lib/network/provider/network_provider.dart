import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_example/network/model/failure/response_failure_model.dart';
import 'package:flutter_example/network/model/success/response_success_model.dart';
import 'package:flutter_example/network/provider/i_network_provider.dart';

class NetworkProvider implements INetworkProvider {
  final _dio = Dio(BaseOptions(baseUrl: 'https://viacep.com.br/ws'));

  @override
  Future<Either<ResponseSuccessModel, ResponseFailureModel>> get(
      String path) async {
    try {
      final response = await _dio.get(path);
      if (response.statusCode == 200) {
        return Left(ResponseSuccessModel(body: response.data));
      } else {
        return Right(ResponseFailureModel(
          statusCode: response.statusCode,
          message: 'Error fetching data',
        ));
      }
    } on DioException catch (e) {
      return Right(ResponseFailureModel(
        statusCode: e.response?.statusCode ?? 0,
        message: 'Error during the request',
      ));
    }
  }
}

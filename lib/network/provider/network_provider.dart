import 'package:dio/dio.dart';
import 'package:flutter_example/extensions/string_extensions.dart';
import 'package:flutter_example/network/model/failure/response_failure_model.dart';
import 'package:flutter_example/network/model/success/response_success_model.dart';
import 'package:flutter_example/network/provider/i_network_provider.dart';

class NetworkProvider implements INetworkProvider {
  final _dio = Dio(BaseOptions(baseUrl: 'https://viacep.com.br/ws'));

  @override
  Future<(ResponseSuccessModel?, ResponseFailureModel?)> get(
      String path) async {
    try {
      final response = await _dio.get(path);
      if (response.statusCode == 200) {
        return (ResponseSuccessModel(body: response.data), null);
      } else {
        return (null, ResponseFailureModel(
          statusCode: response.statusCode,
          message: 'Error fetching data',
        ));
      }
    } on DioException catch (e) {
      return (null, ResponseFailureModel(
        statusCode: e.response?.statusCode ?? 0,
        message: e.message?.simplify,
      ));
    }catch(e){
      return (null, ResponseFailureModel(
        statusCode: 520,
        message: "".simplify,
      ));
    }
  }
}

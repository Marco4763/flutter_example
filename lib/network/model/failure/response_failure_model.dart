import 'package:flutter_example/network/model/i_response_model.dart';

class ResponseFailureModel extends IResponseModel {
  ResponseFailureModel({
    required super.statusCode,
    required super.message,
  });
}

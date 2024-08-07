import 'package:flutter_example/models/i_cep_model.dart';
import 'package:flutter_example/network/model/failure/response_failure_model.dart';

abstract interface class ICepDao {
  Future<(ICepModel?, ResponseFailureModel?)> getCep(String cep);
}

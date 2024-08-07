import 'package:dartz/dartz.dart';
import 'package:flutter_example/dao/i_cep_dao.dart';
import 'package:flutter_example/models/cep_model.dart';
import 'package:flutter_example/models/i_cep_model.dart';
import 'package:flutter_example/network/model/failure/response_failure_model.dart';
import 'package:flutter_example/network/provider/i_network_provider.dart';

class CepDao implements ICepDao{
  CepDao({required this.provider});
  final INetworkProvider provider;
  @override
  Future<Either<ICepModel, ResponseFailureModel>> getCep(String cep) async {
    final request = await provider.get('/$cep/json/');
    return request.fold((l)=>Left(CepModel.fromJson(l.body!)), (r)=>Right(r));
  }

}
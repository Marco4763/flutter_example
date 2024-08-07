import 'package:flutter_example/models/i_cep_model.dart';

class CepModel implements ICepModel {
  @override
  String? bairro;
  @override
  String? cep;
  @override
  String? complemento;
  @override
  String? logradouro;

  CepModel({
    this.bairro,
    this.cep,
    this.complemento,
    this.logradouro,
  });

  factory CepModel.fromJson(Map<String, dynamic> json) {
    return CepModel(
      bairro: json['bairro'],
      cep: json['cep'],
      complemento: json['complemento'],
      logradouro: json['logradouro'],
    );
  }
}

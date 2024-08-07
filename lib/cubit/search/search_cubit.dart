import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_example/dao/i_cep_dao.dart';
import 'package:flutter_example/models/i_cep_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit({required this.cepDao}) : super(SearchInitialState());
  final ICepDao cepDao;
  final cepController = TextEditingController();
  final key = GlobalKey<FormState>();

  void searchCep() async {
    emit(SearchInProgressState());
    final response = await cepDao.getCep(cepController.text);
    response.fold(
      (l) => emit(SearchSucceedState(model: l)),
      (r) => emit(SearchFailureState(message: r.message!)),
    );
  }
}

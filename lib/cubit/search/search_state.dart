part of 'search_cubit.dart';

abstract class SearchState {}

class SearchInitialState extends SearchState {}

class SearchInProgressState extends SearchState {}

class SearchSucceedState extends SearchState {
  final ICepModel model;
  SearchSucceedState({required this.model});
}

class SearchFailureState extends SearchState {
  final String message;
  SearchFailureState({required this.message});
}
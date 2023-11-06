part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class LoadingState extends SearchState {}

class SuccessState extends SearchState {}

class FailureState extends SearchState {}

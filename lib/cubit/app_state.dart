part of 'app_cubit.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}

class ChangeIndexState extends AppState {}

class NewsLoadingState extends AppState {}

class GetNewsSuccessState extends AppState {}

class GetNewsFailureState extends AppState {}

class SearchLoadingState extends AppState {}

class SearchSuccessState extends AppState {}

class SearchFailureState extends AppState {}

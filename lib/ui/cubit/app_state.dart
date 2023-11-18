part of 'app_cubit.dart';

@immutable
abstract class AppStates {}

class AppInitial extends AppStates {}

class ChangeNavBarState extends AppStates {}

class LoadingState extends AppStates {}

class PopularSuccessState extends AppStates {}

class ReleasesSuccessState extends AppStates {}

class TopRatedSuccessState extends AppStates {}

class GetSimilarMoviesSuccess extends AppStates {}

class GetCategorySuccess extends AppStates {}

class GetCategoryDataSuccess extends AppStates {}

class AddFavSuccessState extends AppStates {}

class GetFavSuccessState extends AppStates {}

class DeleteFavSuccessState extends AppStates {}

class DeleteFavLoadingState extends AppStates {}

class FailureState extends AppStates {
  final String error;

  FailureState({required this.error});
}

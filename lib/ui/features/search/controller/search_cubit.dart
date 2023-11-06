import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/core/api/api_constant.dart';
import 'package:movie_app/core/api/dio_helper.dart';
import 'package:movie_app/ui/features/home/models/movie_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  static SearchCubit get(context) => BlocProvider.of(context);

  MovieModel? searchMovieModel;
  void search({required String query}) {
    searchMovieModel = null;
    emit(LoadingState());
    DioHelper.getData(
      url: ApiConstant.searchData,
      query: {
        'query': query,
        'api_key': ApiConstant.apiKey,
        'include_adult': true,
      },
    )!
        .then((value) {
      searchMovieModel = MovieModel.fromJson(value.data);
      emit(SuccessState());
    }).catchError((error) {
      emit(FailureState());
    });
  }
}

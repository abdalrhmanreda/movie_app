import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/api/api_constant.dart';
import 'package:movie_app/core/api/dio_helper.dart';
import 'package:movie_app/ui/features/browse/models/category_model.dart';
import 'package:movie_app/ui/features/browse/screens/browse.dart';
import 'package:movie_app/ui/features/home/models/movie_model.dart';
import 'package:movie_app/ui/features/home/screens/home_screen.dart';
import 'package:movie_app/ui/features/search/screens/search.dart';
import 'package:movie_app/ui/features/watch_list/screens/watch_list.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitial());
  static AppCubit get(context) => BlocProvider.of(context);

  List<Widget> screens = const [
    HomeScreen(),
    SearchScreen(),
    BrowseScreen(),
    WatchListScreen(),
  ];
  int currentIndex = 0;
  void changeNavBar(int index) {
    currentIndex = index;
    emit(ChangeNavBarState());
  }

  MovieModel? popularMovieModel;
  MovieModel? releasesMovieModel;
  MovieModel? topRatedMovieModel;
  void getPopular() {
    emit(LoadingState());

    DioHelper.getData(
      url: ApiConstant.getPopularData,
      query: {
        'page': 1,
        'api_key': ApiConstant.apiKey,
      },
    )!
        .then((value) {
      popularMovieModel = MovieModel.fromJson(value.data);
      emit(PopularSuccessState());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(FailureState(error: error.toString()));
    });
  }

  void getReleases() {
    emit(LoadingState());

    DioHelper.getData(
      url: ApiConstant.getReleasesData,
      query: {
        'page': 1,
        'api_key': ApiConstant.apiKey,
      },
    )!
        .then((value) {
      releasesMovieModel = MovieModel.fromJson(value.data);
      print('**************${releasesMovieModel!.results[0].id.toString()}');
      emit(ReleasesSuccessState());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(FailureState(error: error.toString()));
    });
  }

  void getTopRated() {
    emit(LoadingState());

    DioHelper.getData(
      url: ApiConstant.topRatedData,
      query: {
        'page': 1,
        'api_key': ApiConstant.apiKey,
      },
    )!
        .then((value) {
      topRatedMovieModel = MovieModel.fromJson(value.data);
      emit(TopRatedSuccessState());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(FailureState(error: error.toString()));
    });
  }

  Results? movieModel;
  void getMovieDetails({required num movieId}) {
    movieModel = null;
    emit(LoadingState());
    DioHelper.getData(
      url: '${ApiConstant.getMovieDetails}$movieId',
      query: {
        'api_key': ApiConstant.apiKey,
      },
    )!
        .then((value) {
      movieModel = Results.fromJson(value.data);
      getSimilarMovies(movieId: movieId);
    }).catchError((error) {
      debugPrint(error.toString());
      emit(FailureState(error: error.toString()));
    });
  }

  MovieModel? similarMoviesModel;
  void getSimilarMovies({required num movieId}) {
    emit(LoadingState());
    DioHelper.getData(
      url: 'movie/$movieId/similar',
      query: {
        'api_key': ApiConstant.apiKey,
      },
    )!
        .then((value) {
      similarMoviesModel = MovieModel.fromJson(value.data);
      emit(GetSimilarMoviesSuccess());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(FailureState(error: error.toString()));
    });
  }

  CategoryModel? categoryModel;
  void getCategory() {
    emit(LoadingState());
    DioHelper.getData(
      url: ApiConstant.getCategory,
      query: {'api_key': ApiConstant.apiKey},
    )!
        .then((value) {
      categoryModel = CategoryModel.fromJson(value.data);
      emit(GetCategorySuccess());
    }).catchError((error) {
      emit(FailureState(error: error.toString()));
    });
  }

  MovieModel? categoryData;
  void getCategoryData({required num id}) {
    categoryData = null;
    emit(LoadingState());
    DioHelper.getData(url: ApiConstant.getCategoryData, query: {
      'with_genres': id,
      'api_key': ApiConstant.apiKey,
    })!
        .then((value) {
      categoryData = MovieModel.fromJson(value.data);
      emit(GetCategoryDataSuccess());
    }).catchError((error) {
      emit(FailureState(error: error.toString()));
    });
  }

  void addToFav({required Results results}) {
    emit(LoadingState());
    FirebaseFirestore.instance
        .collection('favMovie')
        .add(results.toMap())
        .then((value) {
      getFavMovie();
      emit(AddFavSuccessState());
    }).catchError((error) {
      print("-----------------------$error");
      emit(FailureState(error: error.toString()));
    });
  }

  List<Results> favMovies = [];
  List<String> favMoviesId = [];
  void getFavMovie() {
    emit(LoadingState());
    FirebaseFirestore.instance.collection('favMovie').get().then((value) {
      favMovies = [];
      for (var element in value.docs) {
        favMoviesId.add((element.id));
        favMovies.add(Results.fromJson(element.data()));
      }
      print('********************************************${favMoviesId}');
      emit(GetFavSuccessState());
    }).catchError((error) {
      emit(FailureState(error: error.toString()));
    });
  }

  void removeFromFav({required String id}) {
    emit(DeleteFavLoadingState());
    FirebaseFirestore.instance
        .collection('favMovie')
        .doc(id)
        .delete()
        .then((value) {
      getFavMovie();
      emit(DeleteFavSuccessState());
    }).catchError((error) {
      emit(FailureState(error: error.toString()));
    });
  }
}

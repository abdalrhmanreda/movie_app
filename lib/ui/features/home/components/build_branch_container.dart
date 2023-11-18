import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:movie_app/config/routes/routes_path.dart';
import 'package:movie_app/core/components/custom_navigatation.dart';
import 'package:movie_app/ui/features/home/models/movie_model.dart';

import '../../../../core/constant/app_constant.dart';
import '../../../cubit/app_cubit.dart';

InkWell buildBranchContainer({
  required BuildContext context,
  required String image,
  required num id,
  String? backdropPath,
  String? originalTitle,
  String? overview,
  String? posterPath,
  String? releaseDate,
  String? title,
  bool? video,
  num? voteAverage, // Changed from double? to num?
  num? voteCount,
  bool addToFav = true,
  int? index,
}) {
  return InkWell(
    onTap: () {
      AppCubit.get(context).getMovieDetails(movieId: id);
      CustomNavigation.navigateByNamedTo(context, RoutePath.movieDetails);
    },
    child: Stack(
      children: [
        Container(
          height: AppConstant.deviceHeight(context) / 4,
          width: AppConstant.deviceWidth(context) / 3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: CachedNetworkImageProvider(
                image,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: InkWell(
            onTap: () {
              if (addToFav) {
                AppCubit.get(context).addToFav(
                    results: Results(
                        backdropPath,
                        id,
                        originalTitle,
                        overview,
                        posterPath,
                        releaseDate,
                        title,
                        video,
                        voteAverage,
                        voteCount));
              } else {
                AppCubit.get(context).removeFromFav(
                    id: AppCubit.get(context).favMoviesId[index!]);
              }
            },
            child: const Icon(
              IconlyBroken.bookmark,
              color: Colors.black54,
              size: 30,
            ),
          ),
        ),
      ],
    ),
  );
}

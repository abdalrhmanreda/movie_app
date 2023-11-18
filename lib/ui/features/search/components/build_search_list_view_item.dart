import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/constant/app_constant.dart';
import 'package:movie_app/ui/features/home/models/movie_model.dart';
import 'package:movie_app/ui/features/search/controller/search_cubit.dart';

import '../../../../config/routes/routes_path.dart';
import '../../../../core/api/api_constant.dart';
import '../../../../core/components/custom_navigatation.dart';
import '../../../cubit/app_cubit.dart';
import 'build_textsIn_list_view_item.dart';

InkWell buildSearchListViewItem({
  required BuildContext context,
  required int index,
  required MovieModel searchMovieModel,
}) {
  return InkWell(
    onTap: () {
      AppCubit.get(context)
          .getMovieDetails(movieId: searchMovieModel!.results[index].id!);
      CustomNavigation.navigateByNamedTo(context, RoutePath.movieDetails);
    },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          height: AppConstant.deviceHeight(context) / 5,
          width: AppConstant.deviceWidth(context) / 3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: CachedNetworkImageProvider(searchMovieModel
                          .results[index].backdropPath ==
                      null
                  ? '${ApiConstant.imagePath}${SearchCubit.get(context).searchMovieModel!.results[index].posterPath}'
                  : '${ApiConstant.imagePath}${SearchCubit.get(context).searchMovieModel!.results[index].backdropPath}'),
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        buildTextsInListViewItem(context, searchMovieModel.results[index]),
      ],
    ),
  );
}

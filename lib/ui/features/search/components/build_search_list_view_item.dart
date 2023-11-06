import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/constant/app_constant.dart';
import 'package:movie_app/ui/features/search/controller/search_cubit.dart';

import '../../../../config/routes/routes_path.dart';
import '../../../../core/api/api_constant.dart';
import '../../../../core/components/custom_navigatation.dart';
import '../../../cubit/app_cubit.dart';
import 'build_textsIn_list_view_item.dart';

InkWell buildSearchListViewItem({
  required BuildContext context,
  required int index,
  required num id,
}) {
  return InkWell(
    onTap: () {
      AppCubit.get(context).getMovieDetails(movieId: id);
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
              image: CachedNetworkImageProvider(SearchCubit.get(context)
                          .searchMovieModel!
                          .results[index]
                          .backdropPath ==
                      null
                  ? 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.shoshinsha-design.com%2F2020%2F05%2F%25E3%2583%258E%25E3%2583%25BC%25E3%2582%25A4%25E3%2583%25A1%25E3%2583%25BC%25E3%2582%25B8%25E3%2582%25A2%25E3%2582%25A4%25E3%2582%25B3%25E3%2583%25B3-no-image-icon%2F.html&psig=AOvVaw3NMwpQ1MkcuG-54dMijrhi&ust=1698544226572000&source=images&cd=vfe&ved=0CBIQjRxqFwoTCIiciZ3Rl4IDFQAAAAAdAAAAABAE'
                  : '${ApiConstant.imagePath}${SearchCubit.get(context).searchMovieModel!.results[index].backdropPath}'),
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        buildTextsInListViewItem(context, index),
      ],
    ),
  );
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/config/routes/routes_path.dart';
import 'package:movie_app/core/components/custom_navigatation.dart';

import '../../../../core/constant/app_constant.dart';
import '../../../cubit/app_cubit.dart';

InkWell buildBranchContainer({
  required BuildContext context,
  required String image,
  required num id,
}) {
  return InkWell(
    onTap: () {
      AppCubit.get(context).getMovieDetails(movieId: id);
      CustomNavigation.navigateByNamedTo(context, RoutePath.movieDetails);
    },
    child: Container(
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
  );
}

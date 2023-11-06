import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/ui/cubit/app_cubit.dart';

import '../../../../config/routes/routes_path.dart';
import '../../../../core/components/custom_navigatation.dart';
import '../../../../core/constant/app_constant.dart';
import 'bulid_text_in_main.dart';

InkWell buildMainContainer({
  required BuildContext context,
  required String image,
  required String title,
  required String date,
  required num id,
  PageController? pageController,
}) {
  return InkWell(
    onTap: () {
      AppCubit.get(context).getMovieDetails(movieId: id);
      CustomNavigation.navigateByNamedTo(context, RoutePath.movieDetails);
    },
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          width: AppConstant.deviceWidth(context),
          height: AppConstant.deviceHeight(context) / 3,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: CachedNetworkImageProvider(
                image,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          height: AppConstant.deviceHeight(context) / 50,
        ),
        buildTextInMainContainer(
          context: context,
          title: title,
          date: date,
        ),
      ],
    ),
  );
}

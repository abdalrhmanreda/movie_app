import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../../config/routes/routes_path.dart';
import '../../../../core/api/api_constant.dart';
import '../../../../core/components/custom_navigatation.dart';
import '../../../../core/constant/app_constant.dart';
import '../../../cubit/app_cubit.dart';

InkWell buildGridViewItemInCategoryDetails(BuildContext context, int index) {
  return InkWell(
    onTap: () {
      AppCubit.get(context).getMovieDetails(
          movieId: AppCubit.get(context).categoryData!.results[index].id!);
      CustomNavigation.navigateByNamedTo(context, RoutePath.movieDetails);
    },
    child: SizedBox(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: AppConstant.deviceWidth(context) / 1.5,
                height: AppConstant.deviceHeight(context) / 3.8,
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        '${ApiConstant.imagePath}${AppCubit.get(context).categoryData!.results[index].backdropPath}'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    Text(
                      AppCubit.get(context)
                          .categoryData!
                          .results[index]
                          .voteAverage!
                          .toStringAsFixed(1),
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: const Color(AppColors.kPrimaryColor),
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Text(
            '${AppCubit.get(context).categoryData!.results[index].title}',
            maxLines: 1,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 15.sp,
                ),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    ),
  );
}

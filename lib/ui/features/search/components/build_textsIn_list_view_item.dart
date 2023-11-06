import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/constant/app_constant.dart';
import 'package:movie_app/ui/features/search/controller/search_cubit.dart';

import '../../../../config/colors/app_colors.dart';

Expanded buildTextsInListViewItem(BuildContext context, int index) {
  return Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${SearchCubit.get(context).searchMovieModel!.results[index].title}',
          maxLines: 2,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 15.sp,
              ),
        ),
        SizedBox(
          height: AppConstant.deviceHeight(context) / 90,
        ),
        Text(
          '${SearchCubit.get(context).searchMovieModel!.results[index].overview}',
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 11.sp,
                color: Colors.grey,
              ),
        ),
        SizedBox(
          height: AppConstant.deviceHeight(context) / 70,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${SearchCubit.get(context).searchMovieModel!.results[index].releaseDate}',
              maxLines: 2,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 12.sp,
                    color: Colors.grey,
                  ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Icon(
                    IconlyBroken.star,
                    color: Colors.amber,
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  Text(
                    SearchCubit.get(context)
                        .searchMovieModel!
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
      ],
    ),
  );
}

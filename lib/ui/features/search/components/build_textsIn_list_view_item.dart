import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/constant/app_constant.dart';
import 'package:movie_app/ui/features/home/models/movie_model.dart';

import '../../../../config/colors/app_colors.dart';

Expanded buildTextsInListViewItem(BuildContext context, Results results) {
  return Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${results.title}',
          maxLines: 2,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 15.sp,
              ),
        ),
        SizedBox(
          height: AppConstant.deviceHeight(context) / 90,
        ),
        Text(
          '${results.overview}',
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
              '${results.releaseDate}',
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
                    results.voteAverage!.toStringAsFixed(1),
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

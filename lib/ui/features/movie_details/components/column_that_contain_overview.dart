import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/config/colors/app_colors.dart';

import '../../../../core/constant/app_constant.dart';
import '../../../cubit/app_cubit.dart';

Column buildColumnContainOverView(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'synopsis',
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 17.sp,
              color: const Color(AppColors.kPrimaryColor),
              fontWeight: FontWeight.w800,
            ),
      ),
      SizedBox(
        height: AppConstant.deviceHeight(context) / 90,
      ),
      Text(
        '${AppCubit.get(context).movieModel!.overview}',
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 13.sp,
              height: 1.4,
            ),
      ),
      SizedBox(
        height: AppConstant.deviceHeight(context) / 90,
      ),
      Row(
        children: [
          const Icon(
            IconlyBroken.star,
            color: Colors.amber,
          ),
          Text(
            AppCubit.get(context).movieModel!.voteAverage!.toStringAsFixed(1),
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 15.sp,
                ),
          ),
        ],
      ),
    ],
  );
}

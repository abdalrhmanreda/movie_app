import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/app_constant.dart';
import '../../../cubit/app_cubit.dart';

Column buildColumnContainNameAndReleaseDate(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        '${AppCubit.get(context).movieModel!.originalTitle}',
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 18.sp,
            ),
      ),
      SizedBox(
        height: AppConstant.deviceHeight(context) / 90,
      ),
      Text(
        '${AppCubit.get(context).movieModel!.releaseDate}',
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Colors.grey,
            ),
      ),
      SizedBox(
        height: AppConstant.deviceHeight(context) / 50,
      ),
    ],
  );
}

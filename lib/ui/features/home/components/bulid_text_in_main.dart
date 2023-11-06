import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/app_constant.dart';

SizedBox buildTextInMainContainer({
  required BuildContext context,
  required String title,
  required String date,
}) {
  return SizedBox(
    width: AppConstant.deviceWidth(context) / 1.8,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 15.sp,
              ),
        ),
        SizedBox(
          height: AppConstant.deviceHeight(context) / 80,
        ),
        Text(
          date,
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Colors.grey,
              ),
        ),
        SizedBox(
          height: AppConstant.deviceHeight(context) / 70,
        ),
      ],
    ),
  );
}

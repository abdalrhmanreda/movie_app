import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Column buildTexts({
  required BuildContext context,
  required String title,
  required String description,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),
        textAlign: TextAlign.start,
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height / 50,
      ),
      Text(
        description,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 13.sp,
              color: Colors.grey,
            ),
        textAlign: TextAlign.start,
      ),
    ],
  );
}

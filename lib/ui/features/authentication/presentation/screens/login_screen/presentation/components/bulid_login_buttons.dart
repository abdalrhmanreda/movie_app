import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../../config/colors/app_colors.dart';
import '../../../../../../../../core/components/custom_button.dart';
import '../../../../../../../../core/components/custom_text_button.dart';

Column buildLoginButtons({
  required BuildContext context,
  required String email,
  required String password,
}) {
  return Column(
    children: [
      CustomTextButton(
        text: 'forget password ?',
        onPressed: () {},
      ),
      CustomButton(
        onPressed: () {},
        text: 'login',
        height: 37.h,
        width: MediaQuery.of(context).size.width,
        vertical: 15.h,
        horizontal: 0,
        radius: 15,
        color: AppColors.kPrimaryColor,
        textColor: 0xffffffff,
        fontSize: 14.sp,
      ),
    ],
  );
}
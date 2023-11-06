import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../../../config/colors/app_colors.dart';
import '../../../../../../../../../generated/assets.dart';
import '../../../../../../../../core/components/custom_button.dart';
import '../../../../components/bulid_do_not_have_account.dart';
import 'bulid_text_form_feild_register_screen.dart';

Padding buildRegisterScreenBody(
  BuildContext context,
  TextEditingController nameController,
  TextEditingController emailController,
  TextEditingController phoneController,
  TextEditingController passController,
) {
  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: MediaQuery.of(context).size.width / 25,
    ),
    child: SingleChildScrollView(
      child: Column(
        children: [
          SvgPicture.asset(
            Assets.authRegister,
            height: MediaQuery.of(context).size.height / 2.5,
          ),
          bulidTextFormFeildRegisterScreen(context, nameController,
              emailController, phoneController, passController),
          CustomButton(
            onPressed: () {},
            text: 'register',
            height: 37.h,
            width: MediaQuery.of(context).size.width,
            vertical: 15.h,
            horizontal: 0,
            radius: 15,
            color: AppColors.kPrimaryColor,
            textColor: 0xffffffff,
            fontSize: 14.sp,
          ),
          bulidDoNotHaveAccountAndIfHaveAccount(
            context: context,
            text: 'Already have an account ?',
            textButton: 'login',
            voidCallback: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    ),
  );
}

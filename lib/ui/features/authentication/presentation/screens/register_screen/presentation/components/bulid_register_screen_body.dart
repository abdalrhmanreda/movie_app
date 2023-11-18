import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/config/routes/routes_path.dart';
import 'package:movie_app/core/components/custom_navigatation.dart';
import 'package:movie_app/core/components/flutter_toast.dart';
import 'package:movie_app/ui/features/authentication/auth_cubit/auth_cubit.dart';

import '../../../../../../../../../config/colors/app_colors.dart';
import '../../../../../../../../../generated/assets.dart';
import '../../../../../../../../core/components/custom_button.dart';
import '../../../../../../../../core/components/progress_indector.dart';
import '../../../../components/bulid_do_not_have_account.dart';
import 'bulid_text_form_feild_register_screen.dart';

BlocConsumer buildRegisterScreenBody(
  BuildContext context,
  TextEditingController nameController,
  TextEditingController emailController,
  TextEditingController phoneController,
  TextEditingController passController,
) {
  return BlocConsumer<AuthCubit, AuthState>(
    listener: (context, state) {
      // TODO: implement listener
      if (state is RegisterSuccessState) {
        showToast(message: 'Register successfully', state: ToastState.SUCCESS);
        CustomNavigation.navigateByNamedTo(context, RoutePath.layout);
      } else if (state is FailureState) {
        showToast(message: state.error, state: ToastState.ERROR);
      }
    },
    builder: (context, state) {
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
              ConditionalBuilder(
                condition: state is! LoadingState,
                builder: (context) => CustomButton(
                  onPressed: () {
                    AuthCubit.get(context).userRegister(
                        email: emailController.text,
                        password: passController.text);
                  },
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
                fallback: (context) => const CustomLoadingIndicator(),
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
    },
  );
}

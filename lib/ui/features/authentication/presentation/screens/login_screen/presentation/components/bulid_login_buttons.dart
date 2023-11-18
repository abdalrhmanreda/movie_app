import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/config/routes/routes_path.dart';
import 'package:movie_app/core/components/custom_navigatation.dart';
import 'package:movie_app/core/components/progress_indector.dart';
import 'package:movie_app/ui/features/authentication/auth_cubit/auth_cubit.dart';
import 'package:movie_app/ui/features/authentication/presentation/screens/login_screen/presentation/screens/login_screen.dart';

import '../../../../../../../../../config/colors/app_colors.dart';
import '../../../../../../../../core/components/custom_button.dart';
import '../../../../../../../../core/components/custom_text_button.dart';
import '../../../../../../../../core/components/flutter_toast.dart';

BlocConsumer buildLoginButtons({
  required BuildContext context,
  required String email,
  required String password,
}) {
  return BlocConsumer<AuthCubit, AuthState>(
    listener: (context, state) {
      if (state is LoginScreen) {
        showToast(message: 'Login successfully', state: ToastState.SUCCESS);
        CustomNavigation.navigateByNamedTo(context, RoutePath.layout);
      } else if (state is FailureState) {
        showToast(message: state.error, state: ToastState.ERROR);
      }
      // TODO: implement listener
    },
    builder: (context, state) {
      return Column(
        children: [
          CustomTextButton(
            text: 'forget password ?',
            onPressed: () {},
          ),
          ConditionalBuilder(
              condition: state is! LoadingState,
              builder: (context) => CustomButton(
                    onPressed: () {
                      AuthCubit.get(context)
                          .userLogin(email: email, password: password);
                    },
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
              fallback: (context) => const CustomLoadingIndicator())
        ],
      );
    },
  );
}

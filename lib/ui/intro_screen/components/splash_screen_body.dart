import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/config/routes/routes_path.dart';
import 'package:movie_app/core/components/custom_navigatation.dart';
import 'package:movie_app/core/constant/app_constant.dart';
import 'package:movie_app/generated/assets.dart';

class SplashScreenBody extends StatelessWidget {
  const SplashScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            Assets.imagesAppLogo,
            width: AppConstant.deviceWidth(context) / 2.5,
            height: AppConstant.deviceWidth(context) / 2.5,
          ),
          SizedBox(
            height: AppConstant.deviceHeight(context) / 30,
          ),
          DefaultTextStyle(
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 40.sp,
                  fontWeight: FontWeight.bold,
                ),
            child: AnimatedTextKit(
              animatedTexts: [
                WavyAnimatedText('Movies'),
              ],
              isRepeatingAnimation: true,
              onFinished: () {
                CustomNavigation.navigateAndFinishNyNamed(
                    context, RoutePath.onBoarding);
              },
              totalRepeatCount: 4,
            ),
          )
        ],
      ),
    );
  }
}

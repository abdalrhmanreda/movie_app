import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/constant/app_constant.dart';
import 'package:movie_app/generated/assets.dart';

import '../../../config/routes/routes_path.dart';
import '../../../core/components/custom_navigatation.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: AppConstant.deviceHeight(context),
        width: AppConstant.deviceWidth(context),
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.imagesSplash),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 5.0,
            sigmaY: 5.0,
          ), // Adjust blur values as needed
          child: DefaultTextStyle(
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
          ),
        ),
      ),
    );
  }
}

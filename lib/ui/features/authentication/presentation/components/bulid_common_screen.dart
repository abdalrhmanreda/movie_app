import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../config/colors/app_colors.dart';
import '../../../../../core/components/custom_button.dart';
import '../../../../../core/components/custom_text_form_feild.dart';
import 'build_texts.dart';

class CommonScreen extends StatelessWidget {
  const CommonScreen({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.controller,
    required this.label,
    required this.buttonText,
    required this.onPressed,
    required this.onSubmitted,
    required this.prefixIcon,
  });

  final String image;
  final String title;
  final String description;
  final TextEditingController controller;
  final String label;
  final String buttonText;
  final VoidCallback onPressed;
  final Function onSubmitted;
  final IconData prefixIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width / 25,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SvgPicture.asset(
              image,
              height: MediaQuery.of(context).size.height / 2,
            ),
            buildTexts(
              context: context,
              title: title,
              description: description,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 30,
            ),
            CustomTextFormField(
              type: TextInputType.emailAddress,
              isPassword: false,
              maxLine: 1,
              onSubmitted: onSubmitted(),
              controller: controller,
              label: label,
              prefixIcon: prefixIcon,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 30,
            ),
            CustomButton(
              onPressed: onPressed,
              text: buttonText,
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
        ),
      ),
    );
  }
}

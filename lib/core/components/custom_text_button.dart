import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/colors/app_colors.dart';

class CustomTextButton extends StatelessWidget {
  CustomTextButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.textStyle,
  });

  final VoidCallback onPressed;
  final String text;
  TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: Theme.of(context).textButtonTheme.style,
      child: Text(
        text,
        style: GoogleFonts.montserrat(
          color: const Color(
            AppColors.kPrimaryColor,
          ),
          fontSize: 13.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

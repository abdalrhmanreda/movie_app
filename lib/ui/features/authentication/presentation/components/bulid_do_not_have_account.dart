import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/components/custom_text_button.dart';

Row bulidDoNotHaveAccountAndIfHaveAccount({
  required BuildContext context,
  required String text,
  required String textButton,
  required VoidCallback voidCallback,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        text,
      ),
      CustomTextButton(
        onPressed: voidCallback,
        text: textButton,
      ),
    ],
  );
}

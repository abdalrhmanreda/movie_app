import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../../../../../../../core/components/custom_text_form_feild.dart';

Column buildLoginTextFormFeild(TextEditingController emailController,
    BuildContext context, TextEditingController passController) {
  return Column(
    children: [
      CustomTextFormField(
        type: TextInputType.emailAddress,
        isPassword: false,
        maxLine: 1,
        onChanged: (value) {},
        onSubmitted: (value) {},
        onSaved: (value) {},
        controller: emailController,
        label: 'email address',
        prefixIcon: IconlyBroken.message,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height / 50,
      ),
      CustomTextFormField(
        isPassword: true,
        maxLine: 1,
        onChanged: (value) {},
        onSubmitted: (value) {},
        onSaved: (value) {},
        controller: passController,
        label: 'password',
        type: TextInputType.visiblePassword,
        prefixIcon: IconlyBroken.message,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    ],
  );
}

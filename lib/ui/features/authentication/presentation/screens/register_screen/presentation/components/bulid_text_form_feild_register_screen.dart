import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../../../../../../../core/components/custom_text_form_feild.dart';

Column bulidTextFormFeildRegisterScreen(
  BuildContext context,
  TextEditingController nameController,
  TextEditingController emailController,
  TextEditingController phoneController,
  TextEditingController passController,
) {
  return Column(
    children: [
      SizedBox(
        height: MediaQuery.of(context).size.height / 30,
      ),
      CustomTextFormField(
        type: TextInputType.name,
        isPassword: false,
        maxLine: 1,
        onChanged: (value) {},
        onSubmitted: (value) {},
        onSaved: (value) {},
        controller: nameController,
        label: 'username',
        prefixIcon: IconlyBroken.profile,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height / 50,
      ),
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
        type: TextInputType.phone,
        isPassword: false,
        maxLine: 1,
        onChanged: (value) {},
        onSubmitted: (value) {},
        onSaved: (value) {},
        controller: phoneController,
        label: 'phone number',
        prefixIcon: IconlyBroken.call,
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
        prefixIcon: IconlyBroken.lock,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height / 50,
      ),
    ],
  );
}

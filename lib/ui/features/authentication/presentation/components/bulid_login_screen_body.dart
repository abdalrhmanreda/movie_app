import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../generated/assets.dart';
import '../../../../../config/routes/routes_path.dart';
import '../../../../../core/components/custom_navigatation.dart';
import '../screens/login_screen/presentation/components/bulid_login_buttons.dart';
import '../screens/login_screen/presentation/components/bulid_text_form_feild_login.dart';
import 'bulid_do_not_have_account.dart';

Center buildLoginScreenBody(
    BuildContext context,
    TextEditingController emailController,
    TextEditingController passController) {
  return Center(
    child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 25,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.authLogin,
              height: MediaQuery.of(context).size.height / 2,
            ),
            buildLoginTextFormFeild(emailController, context, passController),
            buildLoginButtons(
              context: context,
              email: emailController.text,
              password: passController.text,
            ),
            bulidDoNotHaveAccountAndIfHaveAccount(
              context: context,
              text: 'don\'t have an account ?',
              textButton: 'create account',
              voidCallback: () {
                CustomNavigation.navigateByNamedTo(context, RoutePath.register);
              },
            ),
          ],
        ),
      ),
    ),
  );
}

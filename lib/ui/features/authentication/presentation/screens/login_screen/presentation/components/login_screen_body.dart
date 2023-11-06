import 'package:flutter/material.dart';

import '../../../../components/bulid_login_screen_body.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passController = TextEditingController();
    return buildLoginScreenBody(context, emailController, passController);
  }
}

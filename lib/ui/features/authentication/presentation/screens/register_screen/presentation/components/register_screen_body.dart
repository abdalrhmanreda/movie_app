import 'package:flutter/material.dart';

import 'bulid_register_screen_body.dart';

class RegisterScreenBody extends StatelessWidget {
  const RegisterScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    return buildRegisterScreenBody(
      context,
      nameController,
      emailController,
      phoneController,
      passController,
    );
  }
}

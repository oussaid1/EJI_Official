import 'package:EJI/controllers/auth/auth_controler.dart';
import 'package:EJI/controllers/user/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'common/team_page.dart';
import 'login/sign_in.dart';

class Root extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return GetX(
      initState: (_) async {
        Get.put<UserController>(UserController());
      },
      builder: (_) {
        if (Get.find<AuthController>().user?.uid != null) {
          return TeamPage();
        } else {
          return SignInScreen();
        }
      },
    );
  }
}
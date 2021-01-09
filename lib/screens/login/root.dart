import 'package:EJI/controllers/user/user_controller.dart';
import 'package:EJI/models/user/user.dart';
import 'package:EJI/controllers/auth/auth_controler.dart';
import 'package:EJI/screens/common/team_page.dart';
import 'package:EJI/screens/login/login_tab.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'sign_in.dart';


class Root extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return GetX(
      initState: (_) async {
      },
      builder: (_) {
        if (Get.find<AuthController>().user?.uid!= null) {
          return TeamPage();
        } else {
          return SignInScreen();
        }
      },
    );
  }
}
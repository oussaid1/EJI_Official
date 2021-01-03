import 'package:EJI/controllers/user_controller.dart';
import 'package:EJI/models/user.dart';
import 'package:EJI/repository/auth/auth_controler.dart';
import 'package:EJI/screens/common/team_home.dart';
import 'package:EJI/screens/login/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Root extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return GetX(
      initState: (_) async {
        Get.put<UserController>(UserController());
      },
      builder: (_) {
        if (Get.find<AuthController>().user?.uid != null) {
          final authController = Get.put(AuthController());
          UserController().user = (UserModel(
              id: authController.user.uid,
              name: authController.user.displayName,
              email: authController.user.email));

          return TeamHomePage();
        } else {
          return SignInScreen();
        }
      },
    );
  }
}
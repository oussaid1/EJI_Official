import 'package:EJI/controllers/user_controller.dart';
import 'package:EJI/models/user.dart';
import 'package:EJI/screens/common/splash.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../repository/cloud_database.dart';

class AuthController extends GetxController {
  BuildContext context;
  RxString signedInEmail = ''.obs;
  RxBool isSignedIn = false.obs;
  RxBool isSignIn = true.obs;
  RxBool isRegister = false.obs;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Rx<User> _firebaseUser = Rx<User>();

  User get user => _firebaseUser.value ?? _auth.currentUser;

  @override
  onInit() {
    _firebaseUser.bindStream(_auth.authStateChanges());
    super.onInit();
  }

  void createUser(String name, String email, String password) async {
    try {
      var _authResult = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
      //create user in database.dart
      UserModel _user = UserModel(
        id: _authResult.user.uid,
        name: name,
        email: _authResult.user.email,
        isAdmin: false,
      );
      if (await CloudDatabase().createNewUser(_user)) {
        Get.find<UserController>().user = _user;

      }
    } catch (e) {
      Get.snackbar(
        "Error creating Account",
        e.message,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void login(String email, String password) async {
    try {
      var _authResult = await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password);
      Get.find<UserController>().user =
          await CloudDatabase().getUser(_authResult.user.uid);
    } catch (e) {
      Get.snackbar(
        "Error signing in",
       '',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  static Future<void> pop() async {
    await SystemChannels.platform
        .invokeMethod<void>('SystemNavigator.pop', true);
  }

  Future resetPass(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      Get.snackbar(
        "Success",
        'check your email !',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        "Error",
        'invalid email',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void updateEmailPass() {}

  void signOut() async {
    try {
      await _auth.signOut().then((value) {
        Get.find<UserController>().clear();
        Get.offAll(SplashPage());
        AuthController.pop();
        Get.snackbar('Logged out !', '');
      });
    } catch (e) {
      Get.snackbar(
        "Error signing out",
        e.message,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> handleSignIn(String email) async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        email.trim(),
      ],
    );
    try {
      await _googleSignIn.signIn();
      print('Looooooged in');
    } catch (error) {
      print(error);
    }
  }

  void showProgress() {}
}

import 'package:EJI/controllers/user/user_controller.dart';
import 'package:EJI/models/user/user_model.dart';
import 'package:EJI/repository/cloud_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Rx<User> _firebaseUser = Rx<User>();
  User get user => _firebaseUser.value;

  @override
  onInit() {
    _firebaseUser.bindStream(_auth.authStateChanges());
  }

  void createUser(String name, String email, String password) async {
   // try {
      var _authResult = await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password);
      //create user in database.dart
      UserModel _user = UserModel(
        id: _authResult.user.uid,
        name: name,
        email: _authResult.user.email,
      );
   //   if (await CloudDatabase().createNewUser(_user)) {Get.find<UserController>().user = _user;Get.back();}} catch (e) {Get.snackbar("Error creating Account", e.message, snackPosition: SnackPosition.BOTTOM,);}
  }

  void login(String email, String password) async {
    try {
      var _authResult = await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password);
      //Get.find<UserController>().user = await CloudDatabase().getUser(_authResult.user.uid);
    } catch (e) {
      Get.snackbar(
        "Error signing in",
        e.message,
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
      await _auth
          .sendPasswordResetEmail(email: email)
          .then((value) => Get.snackbar(
        "Success",
        'check your email !',
        snackPosition: SnackPosition.BOTTOM,
      ));
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
       // Get.offAll(SplashPage());
      });
    } catch (e) {
      Get.snackbar(
        "Error signing out",
        e.message,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}

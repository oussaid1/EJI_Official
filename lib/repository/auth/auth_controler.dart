import 'package:EJI/screens/common/team_page.dart';
import 'package:EJI/screens/login/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  BuildContext context;
  RxString signedInEmail = ''.obs;
  RxBool isSignedIn = false.obs;
  RxBool isSignIn = true.obs;
  RxBool isRegister = false.obs;
  RxBool authenticated = false.obs;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool get authentic => authenticated.value;
  Future<bool> signInWithEmailAndPassword(String email, String password) async {
    try {
      final FirebaseUser user = (await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      ))
          .user;
      Get.to(TeamPage());
      signedInEmail.value = user.email;
      isSignedIn.value = true;
      return true;
    } catch (e) {
      Get.snackbar('', "Failed to sign in with Email & Password");
      return false;
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

  void signOut() async {
    await _auth.signOut();
    Get.offAll(SignInScreen());
  }

  void showProgress() {}

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String> signIn(String email, String password) async {
    AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    FirebaseUser user = result.user;
    return user.uid;
  }

  Future<String> signUp(String email, String password) async {
    AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    FirebaseUser user = result.user;
    return user.uid;
  }

  Future<FirebaseUser> getCurrentUser() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user;
  }

  Future<void> sendEmailVerification() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    user.sendEmailVerification();
  }

  Future<bool> isEmailVerified() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user.isEmailVerified;
  }
}

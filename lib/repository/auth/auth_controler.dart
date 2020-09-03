import 'package:EJI/screens/login/sign_in.dart';
import 'package:EJI/settings/params.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  RxBool authenticated = false.obs;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool get authentic => authenticated.value;
  signInWithEmailAndPassword(String email, String password) async {
    try {
      final FirebaseUser user = (await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      ))
          .user;

      Get.snackbar('', '${user.email} signed in',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: secondaryColor,
          colorText: primaryColor);
      return authenticated.value = true;
    } catch (e) {
      Get.snackbar('$e', "Failed to sign in with Email & Password");
      return authenticated.value = false;
    }
  }

  void signOut() async {
    await _auth.signOut();
    Get.offAll(SignInScreen());
  }
}

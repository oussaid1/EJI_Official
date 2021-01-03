import 'package:EJI/models/user.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  Rx<UserModel> _userModel = UserModel().obs;

  UserModel get user => _userModel.value;

  set user(UserModel value) => this._userModel.value = value;
  @override
  void onInit() {
    /* final authController = Get.put(AuthController());
    _userModel.value = (UserModel(
        id: authController.user.uid,
        name: authController.user.displayName,
        email: authController.user.email));*/
    super.onInit();
  }

  void clear() {
    _userModel.value = UserModel();
  }
}
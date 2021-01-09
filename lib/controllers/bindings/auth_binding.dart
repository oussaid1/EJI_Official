import 'package:EJI/controllers/auth/auth_controler.dart';
import 'package:EJI/controllers/finance/finance_controller.dart';
import 'package:EJI/controllers/player/player_controller.dart';
import 'package:EJI/controllers/team/team_controller.dart';
import 'package:get/get.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController(), permanent: true);
    Get.lazyPut(()=>MatchesController(),fenix: true);
    Get.lazyPut(()=>PlayerController(),fenix: true);
    Get.lazyPut(()=>FinanceController(),fenix: true);
  }
}
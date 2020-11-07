import 'package:EJI/repository/variables_controler.dart';
import 'package:get/get.dart';

class StoreBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<VariablesControler>(VariablesControler(), permanent: true);
  }
}

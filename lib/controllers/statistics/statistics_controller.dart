import 'package:get/get.dart';

class StatisticsController extends GetxController {



  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
class StatData{
  String title ;
  int value;
  DateTime date;

  StatData(this.title, this.value, this.date);
}
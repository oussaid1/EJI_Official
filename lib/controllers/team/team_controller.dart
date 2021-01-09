import 'package:EJI/models/team/matchday.dart';
import 'package:EJI/repository/cloud_database.dart';
import 'package:get/get.dart';

class MatchesController extends GetxController {

  Rx<List<MatchDay>> _matchDaysList = Rx<List<MatchDay>>();


  List<MatchDay> get matchDays => _matchDaysList.value??[];


  @override
  void onInit() {
    _matchDaysList.bindStream(CloudDatabase().getMatchDays('matchday'));
    super.onInit();
  }

}
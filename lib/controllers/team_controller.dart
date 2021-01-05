import 'package:EJI/models/team/matchday.dart';
import 'package:EJI/models/team/training_day.dart';
import 'package:EJI/repository/cloud_database.dart';
import 'package:get/get.dart';

class TeamController extends GetxController {

  Rx<List<MatchDay>> _matchDaysList = Rx<List<MatchDay>>();
  Rx<List<TrainingDay>> _trainingDaysList = Rx<List<TrainingDay>>();

  List<MatchDay> get matchDays => _matchDaysList.value;
  List<TrainingDay> get trainingDays => _trainingDaysList.value;

  @override
  void onInit() {
    _matchDaysList.bindStream(CloudDatabase().getMatchDays('matchday'));
    _trainingDaysList.bindStream(CloudDatabase().getTrainingDays());
    super.onInit();
  }

}
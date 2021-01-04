import 'package:EJI/models/club_expenses.dart';
import 'package:EJI/models/comments_model.dart';
import 'package:EJI/models/matchday.dart';
import 'package:EJI/models/players/player.dart';
import 'package:EJI/repository/cloud_database.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class VariablesControler extends GetxController {
  RxDouble clubBudget = 0.0.obs;
  RxBool isAdmin = false.obs;
  RxBool isSuperAdmin = true.obs;
  RxBool isComplete = true.obs;
  RxString sperAdminPass = '1243'.obs;
  RxString coachAdminPass = '532'.obs;
  RxString presidentialPass = '12343'.obs;
  var adminEmail = 'E20J19I'.obs;
  var adminPassword = 'E20J19I'.obs;

  RxInt matchdayHomeScore = 0.obs;
  RxInt matchdayAwayScore = 0.obs;
  RxInt matchdayHomeRedC = 0.obs;
  RxInt matchdayAwayRedC = 0.obs;
  RxInt matchdayHomeYellC = 0.obs;
  RxInt matchdayAwayYellC = 0.obs;
  //***************************************** */
  RxDouble botGk = 50.0.obs;
  RxDouble lefGk = 50.0.obs;
  RxDouble botGkPos = 50.0.obs;
  RxDouble lefGkPos = 50.0.obs;
  RxInt winCountHome = 0.obs;
  RxInt lossCountHome = 0.obs;
  RxInt drawCountHome = 0.obs;
  RxInt winCountAway = 0.obs;
  RxInt lossCountAway = 0.obs;
  RxInt drawCountAway = 0.obs;
  RxInt attendees = 0.obs;
  RxInt duration = 0.obs;
  RxInt countSeniors = 0.obs;
  RxInt countJuniors = 0.obs;
  RxInt countCadets = 0.obs;

  RxDouble clubIncome = 0.0.obs;
  RxDouble clubSpendings = 0.0.obs;

  RxBool isValid = false.obs;
  RxString superAdminPass = '1243'.obs;
  RxString coachPass = '532'.obs;

  var email = 'Idawlstane'.obs;
  var password = 'Idawlstane'.obs;

  RxList<Player> players = RxList<Player>();
  RxList<MatchDay> matchDay = RxList<MatchDay>();
  RxList<ClubIncome> clubIncomes = RxList<ClubIncome>();
  RxList<ClubSpendings> clubSpendingz = RxList<ClubSpendings>();
  RxList<Comments> comments = RxList<Comments>();

  @override
  void onInit() {
    final db = CloudDatabase();
    GetStorage mBox = GetStorage();
    if (mBox.hasData('adminkey')) {
      isAdmin.value = mBox.read('adminkey');
    }
    players.bindStream(db.getPlayers('Players'));
super.onInit();
  }

  setAdmin(bool adminkey) {
    isAdmin.value = adminkey;
    GetStorage mBox = GetStorage();
    mBox.write('adminkey', adminkey);
  }

  get totalWin {
    return winCountHome.value + winCountAway.value;
  }

  get totalDraw {
    return drawCountHome.value + drawCountAway.value;
  }

  get totalLoss {
    return lossCountHome.value + lossCountAway.value;
  }

  setBudget(double d) => clubBudget.value = d;

  incrementScoreHome() => matchdayHomeScore.value++;
  incrementScoreAway() => matchdayAwayScore.value++;
  incrementYellowCHome() => matchdayHomeYellC.value++;
  incrementYellowCAway() => matchdayAwayYellC.value++;
  incrementRedCHome() => matchdayHomeRedC.value++;
  incrementRedCAway() => matchdayAwayRedC.value++;

  decrementScoreHome() {
    if (matchdayHomeScore.value > 0) matchdayHomeScore.value--;
  }

  deccrementScoreAway() {
    if (matchdayAwayScore.value > 0) matchdayAwayScore.value--;
  }

  deccrementYellowCHome() {
    if (matchdayHomeYellC.value > 0) matchdayHomeYellC.value--;
  }

  deccrementYellowCAway() {
    if (matchdayAwayYellC.value > 0) matchdayAwayYellC.value--;
  }

  deccrementRedCHome() {
    if (matchdayHomeRedC.value > 0) matchdayHomeRedC.value--;
  }

  deccrementRedCAway() {
    if (matchdayAwayRedC.value > 0) matchdayAwayRedC.value--;
  }
}
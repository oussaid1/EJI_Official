import 'package:get/get.dart';

class VariablesControler extends GetxController {
  
  RxInt matchdayHomeScore = 1.obs;
  RxInt matchdayAwayScore = 1.obs;
  RxInt matchdayHomeRedC = 1.obs;
  RxInt matchdayAwayRedC = 1.obs;
  RxInt matchdayHomeYellC = 1.obs;
  RxInt matchdayAwayYellC = 1.obs;

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

import 'package:EJI/model/player.dart';
import 'package:get/get.dart';

class VariablesControler extends GetxController {
  RxInt matchdayHomeScore = 0.obs;
  RxInt matchdayAwayScore = 0.obs;
  RxInt matchdayHomeRedC = 0.obs;
  RxInt matchdayAwayRedC = 0.obs;
  RxInt matchdayHomeYellC = 0.obs;
  RxInt matchdayAwayYellC = 0.obs;
  //***************************************** */
  RxDouble botGk=50.0.obs;
  RxDouble lefGk=50.0.obs;
  RxDouble botGkPos=50.0.obs;
  RxDouble lefGkPos=50.0.obs;
  List<Player> selectedPlayers ;


addToList(Player player){
    selectedPlayers.add(player);
}
removeFromList(Player player){
    selectedPlayers.remove(player);
}
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

import 'package:get/get.dart';

class PlayerRatingsControler extends GetxController {
  RxBool enabledDsc = false.obs;
  RxBool enabledTr = false.obs;
  RxBool enabledPo = false.obs;
  RxBool enabledAv = false.obs;

  RxInt descipline = 0.obs;
  RxInt training = 0.obs;
  RxInt positionMastery = 0.obs;
  RxInt availability = 0.obs;

  incrementDescipline() => descipline.value++;
  incrementTraining() => training.value++;
  incrementPositionMastery() => positionMastery.value++;
  incrementAvailability() => availability.value++;

  deccrementDescipline() => descipline.value--;
  deccrementTraining() => training.value--;
  decrementPositionMastery() => positionMastery.value--;
  decrementAvailability() => availability.value--;

  inableDescipline() => enabledDsc.value = true;
  inableTraining() => enabledTr.value = true;
  inablePositionMastery() => enabledPo.value = true;
  inableAvailability() => enabledAv.value = true;

  disableDescipline() => enabledDsc.value = false;
  disableTraining() => enabledTr.value = false;
  disablePositionMastery() => enabledPo.value = false;
  disableAvailability() => enabledAv.value = false;
}

import 'package:get/get.dart';

class PlayerRatingsControler extends GetxController {
 

  RxInt descipline = 0.obs;
  RxInt training = 0.obs;
  RxInt positionMastery = 0.obs;
  RxInt availability = 0.obs;
  RxInt oVR = 0.obs;
 int oVRCalculated()=>descipline.value+training.value+positionMastery.value +availability.value;
  incrementDescipline() => descipline.value++;
  incrementTraining() => training.value++;
  incrementPositionMastery() => positionMastery.value++;
  incrementAvailability() => availability.value++;

  deccrementDescipline() => descipline.value--;
  deccrementTraining() => training.value--;
  decrementPositionMastery() => positionMastery.value--;
  decrementAvailability() => availability.value--;

 
}

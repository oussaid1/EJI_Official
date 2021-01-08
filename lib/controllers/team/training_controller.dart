import 'package:EJI/controllers/player/player_controller.dart';
import 'package:EJI/models/team/training_day.dart';
import 'package:EJI/repository/cloud_database.dart';
import 'package:get/get.dart';

class TrainingController extends GetxController {
  final playerController = Get.put(PlayerController());
  Rx<List<TrainingDay>> _trainingDays = Rx<List<TrainingDay>>();

  List<TrainingDay> get trainingDays => _trainingDays.value??[];

  int get totalAttendees {
    int total = 0;
    for (var i in trainingDays) total += i.count;
    return total;
  }

  int get attendenceRate {
    var g = 0.0;
    if (totalAttendees > 0 && playerController.countAllPlayers > 0)
      g = (totalAttendees * 100) / playerController.countAllPlayers;
    return g.toInt();
  }

  @override
  void onInit() {
    _trainingDays.bindStream(CloudDatabase().getTrainingDays());
    super.onInit();
  }
}

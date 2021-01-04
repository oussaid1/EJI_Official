import 'package:EJI/models/players/player.dart';
import 'package:EJI/repository/cloud_database.dart';
import 'package:get/get.dart';


class PlayerController extends GetxController {
  Rx<List<Player>> _seniorPlayersList = Rx<List<Player>>();
  Rx<List<Player>> _juniorPlayersList = Rx<List<Player>>();
  Rx<List<Player>> _cadetPlayersList = Rx<List<Player>>();
  List<Player> get seniorPlayers =>_seniorPlayersList.value;
  List<Player> get juniorPlayers =>_juniorPlayersList.value;
  List<Player> get cadetPlayers =>_cadetPlayersList.value;
  @override
  void onInit() {
 _seniorPlayersList.bindStream(CloudDatabase().getPlayers('Seniors')) ;
 _juniorPlayersList.bindStream(CloudDatabase().getPlayers('Juniors')) ;
 _cadetPlayersList.bindStream(CloudDatabase().getPlayers('Cadets')) ;
    super.onInit();
  }
}

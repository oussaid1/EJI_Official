import 'package:EJI/models/players/player.dart';
import 'package:EJI/repository/cloud_database.dart';
import 'package:get/get.dart';

class PlayerController extends GetxController {
  Rx<List<Player>> _seniorPlayersList = Rx<List<Player>>();
  Rx<List<Player>> _juniorPlayersList = Rx<List<Player>>();
  Rx<List<Player>> _cadetPlayersList = Rx<List<Player>>();

  List<Player> get seniorPlayers => _seniorPlayersList.value;

  List<Player> get juniorPlayers => _juniorPlayersList.value;

  List<Player> get cadetPlayers => _cadetPlayersList.value;

  int get countAllPlayers {
    List<Player> allPlayers = [];
    allPlayers.addAll(_seniorPlayersList.value);
    allPlayers.addAll(_juniorPlayersList.value);
    allPlayers.addAll(_cadetPlayersList.value);
    int count = 0;
    for (var i in allPlayers) count += i.count;
    return count;
  }

  int get countSeniorPlayers {
    int count = 0;
    for (var i in seniorPlayers) count += i.count;
    return count;
  }

  int get countJuniorPlayers {
    int count = 0;
    for (var i in juniorPlayers) count += i.count;
    return count;
  }

  int get countCadetPlayers {
    int count = 0;
    for (var i in cadetPlayers) count += i.count;
    return count;
  }

  Stream<List<Player>> get allPlayers async* {
    List<Player> allPlayers = [];
    allPlayers.addAll(_seniorPlayersList.value);
    allPlayers.addAll(_juniorPlayersList.value);
    allPlayers.addAll(_cadetPlayersList.value);
    yield allPlayers;
  }

  @override
  void onInit() {
    _seniorPlayersList.bindStream(CloudDatabase().getPlayers('Seniors'));
    _juniorPlayersList.bindStream(CloudDatabase().getPlayers('Juniors'));
    _cadetPlayersList.bindStream(CloudDatabase().getPlayers('Cadets'));
    super.onInit();
  }
}

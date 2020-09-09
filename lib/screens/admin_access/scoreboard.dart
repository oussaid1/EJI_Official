import 'package:EJI/models/player.dart';
import 'package:EJI/repository/cloud_database.dart';
import 'package:EJI/repository/player_ratings_Controler.dart';
import 'package:EJI/settings/params.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ScoreBoard extends StatefulWidget {
  ScoreBoard({Key key, @required this.playerToRate, @required this.category})
      : super(key: key);
  final Player playerToRate;
  final int category;

  @override
  _ScoreBoardState createState() => _ScoreBoardState();
}

class _ScoreBoardState extends State<ScoreBoard> {
  DateTime nowDate = new DateTime.now();
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  CloudDatabase c = Get.put(CloudDatabase());
  String _id;
  PlayerRatingsControler prc = Get.put(PlayerRatingsControler());

  var isOpenToRate = false;

  @override
  Widget build(BuildContext context) {
    if (widget.playerToRate != null) {
      isOpenToRate = widget.playerToRate.rateable;
      prc.training.value = widget.playerToRate.trainingScore;
      prc.descipline.value = widget.playerToRate.desciplineScore;
      prc.positionMastery.value = widget.playerToRate.positionMaster;
      prc.availability.value = widget.playerToRate.availability;
      _id = widget.playerToRate.id;
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 360,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: primaryColor,
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
          child: Column(
            children: <Widget>[
              Text.rich(
                TextSpan(
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 24,
                    color: const Color(0xffffffff),
                  ),
                  children: [
                    TextSpan(
                      text: 'التقييم ',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    TextSpan(
                      text: isOpenToRate ? 'مفتوح' : 'مغلق',
                      style: TextStyle(
                        fontSize: 28,
                        color: isOpenToRate ? accentColor : Colors.red[600],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(14, 0, 14, 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 140,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  icon: Icon(Icons.thumb_up,
                                      color: isOpenToRate
                                          ? Colors.yellow
                                          : secondaryColor.withOpacity(0.8)),
                                  onPressed: () {
                                    prc.incrementDescipline();
                                  }),
                              Obx(
                                () => Text(
                                  '${prc.descipline.value}',
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 20,
                                    color: secondaryColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              IconButton(
                                  icon: Icon(Icons.thumb_down,
                                      color: isOpenToRate
                                          ? Colors.blue
                                          : secondaryColor.withOpacity(0.8)),
                                  onPressed: () {
                                    prc.deccrementDescipline();
                                  }),
                            ],
                          ),
                        ),
                        Text(
                          'الإنضباط',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 18,
                            color: const Color(0xffedcca9),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 140,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  icon: Icon(Icons.thumb_up,
                                      color: isOpenToRate
                                          ? Colors.yellow
                                          : secondaryColor.withOpacity(0.8)),
                                  onPressed: () {
                                    prc.incrementTraining();
                                  }),
                              Obx(
                                () => Text(
                                  '${prc.training.value}',
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 20,
                                    color: secondaryColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              IconButton(
                                  icon: Icon(Icons.thumb_down,
                                      color: isOpenToRate
                                          ? Colors.blue
                                          : secondaryColor.withOpacity(0.8)),
                                  onPressed: () {
                                    prc.deccrementTraining();
                                  }),
                            ],
                          ),
                        ),
                        Text(
                          'التداريب',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 18,
                            color: const Color(0xffedcca9),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 140,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  icon: Icon(Icons.thumb_up,
                                      color: isOpenToRate
                                          ? Colors.yellow
                                          : secondaryColor.withOpacity(0.8)),
                                  onPressed: () {
                                    prc.incrementPositionMastery();
                                  }),
                              Obx(
                                () => Text(
                                  '${prc.positionMastery.value}',
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 20,
                                    color: secondaryColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              IconButton(
                                  icon: Icon(Icons.thumb_down,
                                      color: isOpenToRate
                                          ? Colors.blue
                                          : secondaryColor.withOpacity(0.8)),
                                  onPressed: () {
                                    prc.decrementPositionMastery();
                                  }),
                            ],
                          ),
                        ),
                        Text(
                          'اتقان المركز',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 18,
                            color: const Color(0xffedcca9),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 140,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  icon: Icon(Icons.thumb_up,
                                      color: isOpenToRate
                                          ? Colors.yellow
                                          : secondaryColor.withOpacity(0.8)),
                                  onPressed: () {
                                    prc.incrementAvailability();
                                  }),
                              Obx(
                                () => Text(
                                  '${prc.availability.value}',
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 20,
                                    color: secondaryColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              IconButton(
                                  icon: Icon(Icons.thumb_down,
                                      color: isOpenToRate
                                          ? Colors.blue
                                          : secondaryColor.withOpacity(0.8)),
                                  onPressed: () {
                                    prc.decrementAvailability();
                                  }),
                            ],
                          ),
                        ),
                        Text(
                          'المتاحية',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 18,
                            color: const Color(0xffedcca9),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  isOpenToRate
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            RaisedButton(
                                color: accentColor,
                                child: Text(
                                  "Save".tr,
                                  style: TextStyle(
                                      color: primaryColor, fontSize: 16),
                                ),
                                onPressed: () {
                                  Player scoredPlayer = new Player(
                                    count: widget.playerToRate.count,
                                    id: _id,
                                    profileImage:
                                        widget.playerToRate.profileImage,
                                    regNum: widget.playerToRate.regNum,
                                    seasons: widget.playerToRate.seasons,
                                    playerName: widget.playerToRate.playerName,
                                    phone: widget.playerToRate.phone,
                                    email: widget.playerToRate.email,
                                    regDate: widget.playerToRate.regDate,
                                    position: widget.playerToRate.position,
                                    dateOfBirth:
                                        widget.playerToRate.dateOfBirth,
                                    placeOfBirth:
                                        widget.playerToRate.placeOfBirth,
                                    availability: prc.availability.value,
                                    desciplineScore: prc.descipline.value,
                                    positionMaster: prc.positionMastery.value,
                                    trainingScore: prc.training.value,
                                    oVR: (prc.descipline.value) +
                                        (prc.training.value) +
                                        prc.positionMastery.value +
                                        prc.availability.value,
                                    rateable: widget.playerToRate.rateable,
                                  );
                                  Player scoredPlayer2 = new Player.stats(
                                    count: widget.playerToRate.count,
                                    regNum: widget.playerToRate.regNum,
                                    seasons: widget.playerToRate.seasons,
                                    playerName: widget.playerToRate.playerName,
                                    scoreDate:
                                        formatter.format(nowDate).toString(),
                                    positionPlayed:
                                        widget.playerToRate.position,
                                    availability: prc.availability.value,
                                    desciplineScore: prc.descipline.value,
                                    positionMaster: prc.positionMastery.value,
                                    trainingScore: prc.training.value,
                                    oVR: (prc.descipline.value) +
                                        (prc.training.value) +
                                        prc.positionMastery.value +
                                        prc.availability.value,
                                  );

                                  Get.defaultDialog(
                                    title: 'SuperAdmin'.tr,
                                    content: TextField(
                                      decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.lock)),
                                      onChanged: (value) {
                                        if (value.trim().toString() ==
                                            c.coachAdminPass.value
                                                .toString()
                                                .trim()) {
                                          Navigator.pop(context);
                                          if (widget.category == 1) {
                                            c.updatePlayer(
                                                'Senior', scoredPlayer);
                                            c.addPlayerScores(
                                                'SeniorStats', scoredPlayer2);
                                          } else if (widget.category == 2) {
                                            c.updatePlayer(
                                                'Junior', scoredPlayer);
                                            c.addPlayerScores(
                                                'JuniorStats', scoredPlayer2);
                                          } else if (widget.category == 3) {
                                            c.updatePlayer(
                                                'Cadet', scoredPlayer);
                                            c.addPlayerScores(
                                                'CadetStats', scoredPlayer2);
                                          }
                                        }
                                      },
                                    ),
                                  );
                                }),
                            RaisedButton(
                              color: accentColor,
                              child: Text(
                                "Cancel".tr,
                                style: TextStyle(
                                    color: primaryColor, fontSize: 16),
                              ),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ],
                        )
                      : Container(),
                ],
              ),
            ],
          ),
        ),
      );
    } else
      return Container();
  }
}

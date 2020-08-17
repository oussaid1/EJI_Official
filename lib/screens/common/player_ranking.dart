import 'package:EJI/model/player.dart';
import 'package:EJI/repository/cloud_database.dart';
import 'package:EJI/repository/player_ratings_Controler.dart';
import 'package:EJI/settings/params.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PlayerRanking extends StatefulWidget {
  const PlayerRanking({Key key}) : super(key: key);

  @override
  _PlayerRankingState createState() => _PlayerRankingState();
}

class _PlayerRankingState extends State<PlayerRanking> {
  Player player;
  final String image = "players/profileImages/logo.png";
  bool enabledDsc = true;
  bool enabledTr = true;
  bool enabledPo = true;
  bool enabledAv = true;
  List<Player> lista;
  bool isVoted = false;
  CloudDatabase c = Get.put(CloudDatabase());
  PlayerRatingsControler prc = Get.put(PlayerRatingsControler());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: c.isAdmin.value
            ? FloatingActionButton(
                child: Icon(Icons.exposure_plus_1),
                onPressed: () {
                  Get.defaultDialog(
                    backgroundColor: Colors.blue[100],
                    title: '',
                    content: ScoreBoard(
                      playerToRate: player,
                    ),
                  );
                })
            : FloatingActionButton(onPressed: null),
        backgroundColor: primaryColor,
        appBar: AppBar(),
        body: Stack(
          fit: StackFit.expand,
          children: [
            new Image.asset('assets/images/trainingx.png',fit:BoxFit.fill),
            ListView(
              children: [
                StreamBuilder(
                    stream: c.getPlayerz('players'),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<Player>> snapshot) {
                      if (snapshot.hasError || !snapshot.hasData) {
                        return Center(
                            child: Icon(
                          Icons.person,
                          size: 100,
                          color: secondaryColor,
                        ));
                      } else {
                        lista = snapshot.data;
                      }

                      return Container(
                        height: 340,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: ListView.builder(
                              itemCount: lista != null ? lista.length : 0,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                player = lista[index];
                                return Padding(
                                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                                  child: SizedBox(
                                    width: 260,
                                    height: 276,
                                    child: Stack(
                                      children: [
                                        Container(
                                          width: 260,
                                          height: 276,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            color: const Color(0x7f144060),
                                            border: Border.all(
                                                width: 1.0,
                                                color: const Color(0xff707070)),
                                            boxShadow: [
                                              BoxShadow(
                                                color: const Color(0xff000000),
                                                offset: Offset(6, 6),
                                                blurRadius: 20,
                                              ),
                                            ],
                                          ),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.fromLTRB(
                                                    8, 8, 8, 0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: <Widget>[
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: FutureBuilder(
                                                          future: c.getProfileImage(
                                                              context,
                                                              player.profileImage
                                                                  .toString()),
                                                          builder: (context,
                                                              imagesnapshot) {
                                                            if (imagesnapshot ==
                                                                    null ||
                                                                !imagesnapshot
                                                                    .hasData ||
                                                                imagesnapshot
                                                                    .hasError) {
                                                              return ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            60),
                                                                child:
                                                                    new Image.asset(
                                                                  'assets/images/logo.png',
                                                                  fit: BoxFit.fill,
                                                                  width: 80,
                                                                  height: 80,
                                                                ),
                                                              );
                                                            } else
                                                              return SizedBox(
                                                                width: 80,
                                                                height: 80,
                                                                child: ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              60),
                                                                  child:
                                                                      CachedNetworkImage(
                                                                    width: 80,
                                                                    height: 80,
                                                                    imageUrl:
                                                                        imagesnapshot
                                                                            .data,
                                                                    placeholder: (context,
                                                                            url) =>
                                                                        new Image
                                                                            .asset(
                                                                      'assets/images/logo.png',
                                                                      fit: BoxFit
                                                                          .fill,
                                                                      width: 80,
                                                                      height: 80,
                                                                    ),
                                                                    errorWidget: (context,
                                                                            url,
                                                                            error) =>
                                                                        new Image
                                                                            .asset(
                                                                      'assets/images/logo.png',
                                                                      width: 80,
                                                                      height: 80,
                                                                      fit: BoxFit
                                                                          .fill,
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                          }),
                                                    ),
                                                    Column(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Text.rich(
                                                              TextSpan(
                                                                style: TextStyle(
                                                                  fontFamily:
                                                                      'Roboto',
                                                                  fontSize: 42,
                                                                  color:
                                                                      accentColor2,
                                                                ),
                                                                children: [
                                                                  TextSpan(
                                                                    text:
                                                                        '${player.oVR.toString()}',
                                                                    style:
                                                                        TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                                  ),
                                                                  TextSpan(
                                                                    text: 'pts',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize: 16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w300,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              textAlign:
                                                                  TextAlign.center,
                                                            ),
                                                          ],
                                                        ),
                                                        Text(
                                                          ' ${player.playerName.toString()}',
                                                          maxLines: 1,
                                                          style: TextStyle(
                                                            fontFamily: 'Roboto',
                                                            fontSize: 18,
                                                            color: const Color(
                                                                0xffffffff),
                                                            fontWeight:
                                                                FontWeight.w300,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    '${player.position.toString()}',
                                                    style: TextStyle(
                                                      fontFamily: 'Roboto',
                                                      fontSize: 42,
                                                      color:
                                                          const Color(0xffedcca9),
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.fromLTRB(
                                                            14, 0, 14, 2),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          '${player.desciplineScore.toString()}',
                                                          style: TextStyle(
                                                            fontFamily: 'Roboto',
                                                            fontSize: 20,
                                                            color: const Color(
                                                                0xfff1811e),
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        Text(
                                                          'الإنضباط',
                                                          style: TextStyle(
                                                            fontFamily: 'Roboto',
                                                            fontSize: 18,
                                                            color: const Color(
                                                                0xffedcca9),
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.fromLTRB(
                                                            14, 0, 14, 2),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          '${player.trainingScore.toString()}',
                                                          style: TextStyle(
                                                            fontFamily: 'Roboto',
                                                            fontSize: 20,
                                                            color: const Color(
                                                                0xfff1811e),
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        Text(
                                                          'التداريب',
                                                          style: TextStyle(
                                                            fontFamily: 'Roboto',
                                                            fontSize: 18,
                                                            color: const Color(
                                                                0xffedcca9),
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.fromLTRB(
                                                            14, 0, 14, 2),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          '${player.positionMaster.toString()}',
                                                          style: TextStyle(
                                                            fontFamily: 'Roboto',
                                                            fontSize: 20,
                                                            color: const Color(
                                                                0xfff1811e),
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        Text(
                                                          'اتقان المركز',
                                                          style: TextStyle(
                                                            fontFamily: 'Roboto',
                                                            fontSize: 18,
                                                            color: const Color(
                                                                0xffedcca9),
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.fromLTRB(
                                                            14, 0, 14, 2),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          '${player.availability.toString()}',
                                                          style: TextStyle(
                                                            fontFamily: 'Roboto',
                                                            fontSize: 20,
                                                            color: const Color(
                                                                0xfff1811e),
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        Text(
                                                          'المتاحية',
                                                          style: TextStyle(
                                                            fontFamily: 'Roboto',
                                                            fontSize: 18,
                                                            color: const Color(
                                                                0xffedcca9),
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 34,
                                          left: 120,
                                          height: 120,
                                          child: VerticalDivider(
                                            width: 4,
                                            color: secondaryColor,
                                            thickness: 4,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),
                      );
                    }),
               
              ],
            ),
          ],
        ));
  }
}

class ScoreBoard extends StatefulWidget {
  ScoreBoard({Key key, this.playerToRate}) : super(key: key);
  final Player playerToRate;

  @override
  _ScoreBoardState createState() => _ScoreBoardState();
}

class _ScoreBoardState extends State<ScoreBoard> {
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
                        color: isOpenToRate ? accentColor2 : Colors.red[600],
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
                                          ? accentColor2
                                          : primaryColorShade),
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
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              IconButton(
                                  icon: Icon(Icons.thumb_down,
                                      color: isOpenToRate
                                          ? accentColor
                                          : primaryColorShade),
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
                                          ? accentColor2
                                          : primaryColorShade),
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
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              IconButton(
                                  icon: Icon(Icons.thumb_down,
                                      color: isOpenToRate
                                          ? accentColor
                                          : primaryColorShade),
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
                                          ? accentColor2
                                          : primaryColorShade),
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
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              IconButton(
                                  icon: Icon(Icons.thumb_down,
                                      color: isOpenToRate
                                          ? accentColor
                                          : primaryColorShade),
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
                                          ? accentColor2
                                          : primaryColorShade),
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
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              IconButton(
                                  icon: Icon(Icons.thumb_down,
                                      color: isOpenToRate
                                          ? accentColor
                                          : primaryColorShade),
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
                                    isGK: widget.playerToRate.isGK,
                                  );
                                  Get.defaultDialog(
                                    title: 'تحذير',
                                    middleText: ' !هل انت متاكد ',
                                    backgroundColor: Colors.blue[100],
                                    onConfirm: () {
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
                                              c.updatePlayer(scoredPlayer);
                                            }
                                          },
                                        ),
                                      );
                                    },
                                    onCancel: () => Navigator.pop(context),
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

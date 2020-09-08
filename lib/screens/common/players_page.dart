import 'package:EJI/models/player.dart';
import 'package:EJI/repository/cloud_database.dart';
import 'package:EJI/screens/common/playerlist_tab.dart';
import 'package:EJI/settings/params.dart';
import 'package:EJI/shared/drawer_main.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlayersPage extends StatefulWidget {
  @override
  _PlayersPageState createState() => _PlayersPageState();
}

class _PlayersPageState extends State<PlayersPage> {
  var _scaffoldKey2 = GlobalKey<ScaffoldState>();
  final CloudDatabase cD = Get.put(CloudDatabase());

  List<Player> clubSpendings;
  List _listSenior = List<Player>();
  List _listJunior = List<Player>();
  List _listCadet = List<Player>();
  List _allPlayers = List<Player>();
  Player player;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey2,
      drawer: MyDrawer(),
      backgroundColor: primaryColor,
      body: Stack(children: [
        Positioned(
          top: 10,
          left: 1,
          height: 240,
          child: Container(
            width: Get.width - 2,
            child: ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                child:
                    Image.asset('assets/images/back2.png', fit: BoxFit.fill)),
          ),
        ),
        Positioned(
          top: 40,
          left: 10,
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () => _scaffoldKey2.currentState.openDrawer(),
                  icon: Icon(
                    Icons.menu,
                    color: primaryColor,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
        ),
        StreamBuilder<List<Player>>(
            stream: cD.getPlayers('Cadet'),
            builder: (context, AsyncSnapshot<List<Player>> snapshot) {
              if (!snapshot.hasData || snapshot.hasError) {
                return Container();
              } else
                _listCadet = snapshot.data;
              _allPlayers.addAll(_listCadet);
              cD.countCadets.value = _listCadet.length;
              return Container();
            }),
        StreamBuilder<List<Player>>(
            stream: cD.getPlayers('Junior'),
            builder: (context, AsyncSnapshot<List<Player>> snapshot) {
              if (!snapshot.hasData || snapshot.hasError) {
                return Container();
              } else
                _listJunior = snapshot.data;
              _allPlayers.addAll(_listJunior);
              cD.countCadets.value = _listCadet.length;
              return Container();
            }),
        Positioned(
          top: Get.width / 2.5,
          left: 10,
          width: Get.width - 20,
          height: 300,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: secondaryColor),
              borderRadius: BorderRadius.circular(10.0),
              color: const Color(0xff101a24).withOpacity(0.8),
              boxShadow: [],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'اللاعبين ',
                  style: TextStyle(
                    fontFamily: 'Courier New',
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xff17bcb5),
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'اللاعبين المنخرطين و المسجلين لموسم 2020',
                  maxLines: 2,
                  style: TextStyle(
                    fontFamily: 'Courier New',
                    fontSize: 14,
                    color: secondaryColor,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(
                            'شبان ',
                            style: TextStyle(
                              fontFamily: 'Courier New',
                              fontSize: 22,
                              fontWeight: FontWeight.w400,
                              color: whitefontColor,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            'لاعب ${cD.countSeniors.value}',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: fontColor,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'فتيان ',
                            style: TextStyle(
                              fontFamily: 'Courier New',
                              fontSize: 22,
                              color: whitefontColor,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Obx(
                            () => Text(
                              'لاعب ${cD.countJuniors.value}',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: fontColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'صغار ',
                            style: TextStyle(
                              fontFamily: 'Courier New',
                              fontSize: 22,
                              color: whitefontColor,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            'لاعب ${cD.countCadets.value}',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: fontColor,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        'بطاقة اللاعب ',
                        style: TextStyle(
                          fontFamily: 'Courier New',
                          fontSize: 18,
                          color: whitefontColor,
                          fontStyle: FontStyle.italic,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text(
                        'بطاقةالمعلومات الشخصية لللاعب. تقيمات المدرب. حسب\n الحضور والانضباط واتقان المركز . ',
                        style: TextStyle(
                          fontFamily: 'Courier New',
                          fontSize: 14,
                          color: secondaryColor,
                          fontStyle: FontStyle.italic,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 4,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        new Positioned(
            bottom: 60,
            left: 10,
            width: Get.width - 20,
            height: 240,
            child: new Container(
                child: StreamBuilder(
                    stream: cD.getPlayers('players'),
                    builder: (context, AsyncSnapshot<List<Player>> snapshot) {
                      if (snapshot.hasError || !snapshot.hasData) {
                        return new Container();
                      } else
                        _listSenior = (snapshot.data);
                      cD.countSeniors.value = _listSenior.length;
                      _allPlayers.addAll(_listSenior);
                      return CarouselSlider.builder(
                          itemCount:
                              _listSenior != null ? _listSenior.length : 0,
                          options: CarouselOptions(
                            height: 240,
                            autoPlay: true,
                            enlargeCenterPage: true,
                            scrollDirection: Axis.horizontal,
                          ),
                          itemBuilder: (context, index) {
                            Player player = _allPlayers[index];
                            return GestureDetector(
                              onTap: () => Get.offAll(PlayersList()),
                              child: Container(
                                width: 160,
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                        child: new Image.asset(
                                            'assets/images/watson.png')),
                                    Positioned(
                                      bottom: 20,
                                      right: 10,
                                      child: new Text(
                                        '${player.playerName}',
                                        style: TextStyle(
                                          fontFamily: 'Courier New',
                                          fontSize: 18,
                                          color: secondaryColor,
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          });
                    })))
      ]),
    );
  }
}

import 'package:EJI/controllers/player/player_controller.dart';
import 'package:EJI/models/players/player.dart';
import 'package:EJI/repository/cloud_database.dart';
import 'package:EJI/controllers/variables/variables_controler.dart';
import 'package:EJI/screens/common/playerlist_tab.dart';
import 'package:EJI/settings/params.dart';
import 'package:EJI/shared/drawer_main.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class PlayersPage extends StatefulWidget {
  @override
  _PlayersPageState createState() => _PlayersPageState();
}

class _PlayersPageState extends State<PlayersPage> {
  var _scaffoldKey2 = GlobalKey<ScaffoldState>();
  final db = Get.put(CloudDatabase());
  final varController = Get.put(VariablesControler());
  final playerController = Get.put(PlayerController());

  List<Player> clubSpendings;
  List _allPlayers = <Player>[];
  Player player;

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey2,
      drawer: MyDrawer(),
      backgroundColor: primaryColor,
      body: Stack(fit: StackFit.expand, children: [
        new Image.asset('assets/images/login.png', fit: BoxFit.fill),
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

        Positioned(
          top: Get.width / 2,
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
                          Obx(
                            () => Text(
                              '${varController.countSeniors.value}',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: fontColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )
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
                              '${varController.countJuniors.value}',
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
                          Obx(
                            () => Text(
                              '${varController.countCadets.value}',
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
                    stream: playerController.allPlayers,
                    builder: (context, AsyncSnapshot<List<Player>> snapshot) {
                      if (snapshot.hasError || !snapshot.hasData) {
                        return new Container();
                      } else
                        _allPlayers = (snapshot.data);

                      return CarouselSlider.builder(
                          itemCount:
                          _allPlayers != null ? _allPlayers.length : 0,
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
                                      borderRadius: BorderRadius.circular(6),
                                      child: Container(
                                        child: FutureBuilder<String>(
                                          future: db.getProfileImage(context,
                                              player.profileImage.toString()),
                                          builder: (context, snapshot) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.all(2.0),
                                              child: (snapshot == null ||
                                                      !snapshot.hasData)
                                                  ? Image.asset(
                                                      'assets/images/ejilogo.png',
                                                      fit: BoxFit.fill,
                                                    )
                                                  : CachedNetworkImage(
                                                      imageUrl: snapshot.data,
                                                      fit: BoxFit.fill,
                                                      placeholder:
                                                          (context, url) =>
                                                              Image.asset(
                                                        'assets/images/ejilogo.png',
                                                        height: 116,
                                                        width: 116,
                                                        fit: BoxFit.fill,
                                                      ),
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          Image.asset(
                                                        'assets/images/ejilogo.png',
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
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

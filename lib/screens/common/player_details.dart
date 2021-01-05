import 'dart:typed_data';
import 'dart:ui';

import 'package:EJI/models/players/player.dart';

import 'package:EJI/repository/cloud_database.dart';
import 'package:EJI/controllers/variables_controler.dart';
import 'package:EJI/screens/add/add_dialogue.dart';

import 'package:EJI/widgets/scoreboard.dart';
import 'package:EJI/settings/params.dart';
import 'package:EJI/shared/drawer_main.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';

class PlayerDetails extends StatefulWidget {
  final Player player;
  final int category;
  PlayerDetails({Key key, @required this.player, @required this.category});

  @override
  _PlayerDetailsState createState() => _PlayerDetailsState();
}

class _PlayerDetailsState extends State<PlayerDetails> {
  final db = Get.put(CloudDatabase());
  final varController = Get.put(VariablesControler());

  var printKey = new GlobalKey();

  _takeScreenShot() async {
    RenderRepaintBoundary boundary = printKey.currentContext.findRenderObject();
    var image = await boundary.toImage();
    ByteData byteData = await image.toByteData(format: ImageByteFormat.png);
    // Uint8List pngBytes = byteData.buffer.asUint8List();
    // final directory = (await getApplicationDocumentsDirectory()).path;
    // File imgFile = new File('$directory/screenshot.png');
    //imgFile.writeAsBytes(pngBytes);
    await Share.file(
        '', 'myCard.png', byteData.buffer.asUint8List(), 'player/png',
        text: '');
  }

  @override
  Widget build(BuildContext context) {
    if (widget.player == null) {
      return Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(),
        body: Center(child: CircularProgressIndicator()),
      );
    } else
      return Scaffold(
        backgroundColor: secondaryColor,
        drawer: MyDrawer(),
        appBar: AppBar(
          actions: [
            IconButton(
                icon: Icon(Icons.share),
                onPressed: () {
                  _takeScreenShot();
                }),
            varController.isAdmin.value == true
                ? Row(
                    children: [
                      IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            Get.to(AddPlayers(
                              category: 1,
                              player: widget.player,
                            ));
                          }),
                      IconButton(
                        icon: Icon(
                          Icons.exposure_plus_1,
                          size: 30,
                          color: accentColor,
                        ),
                        onPressed: () {
                          Get.defaultDialog(
                            backgroundColor: Colors.blue[100],
                            title: '${widget.player.playerName.toString()}',
                            content: ScoreBoard(
                              category: widget.category,
                              playerToRate: widget.player,
                            ),
                          );
                        },
                      )
                    ],
                  )
                : Container(),
          ],
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            new Image.asset('assets/images/login.png', fit: BoxFit.fill),
            SizedBox(
              height: 10,
            ),
            RepaintBoundary(
              key: printKey,
              child: Container(
                width: Get.width - 10,
                height: Get.height / 1.2,
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Color(0xFF17BCB5), width: 1)),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Positioned(
                      top: 20,
                      width: Get.width - 4,
                      height: 140,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              new CircularPercentIndicator(
                                radius: 50.0,
                                lineWidth: 2.0,
                                percent: 0.6,
                                center: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    new Text(
                                      "${widget.player.positionMaster}",
                                      style: TextStyle(
                                          color: Colors.pink,
                                          fontSize: 20,
                                          fontFamily: 'Agency FB',
                                          fontWeight: FontWeight.bold),
                                    ),
                                    new Text(
                                      "pts",
                                      style: TextStyle(
                                          color: secondaryColor,
                                          fontSize: 14,
                                          fontFamily: 'Agency FB',
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                progressColor: Colors.pink,
                              ),
                              new Text(
                                "المركز",
                                style: TextStyle(
                                    color: secondaryColor,
                                    fontSize: 14,
                                    fontFamily: 'Agency FB',
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              new CircularPercentIndicator(
                                radius: 50.0,
                                lineWidth: 2.0,
                                percent: 0.6,
                                center: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    new Text(
                                      "${widget.player.trainingScore}",
                                      style: TextStyle(
                                          color: Color(0xFF17BCB5),
                                          fontSize: 16,
                                          fontFamily: 'Agency FB',
                                          fontWeight: FontWeight.bold),
                                    ),
                                    new Text(
                                      "pts",
                                      style: TextStyle(
                                          color: secondaryColor,
                                          fontSize: 14,
                                          fontFamily: 'Agency FB',
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                progressColor: Color(0xFF17BCB5),
                              ),
                              new Text(
                                "التداريب",
                                style: TextStyle(
                                    color: secondaryColor,
                                    fontSize: 14,
                                    fontFamily: 'Agency FB',
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              new CircularPercentIndicator(
                                radius: 50.0,
                                lineWidth: 2.0,
                                percent: 0.6,
                                center: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    new Text(
                                      "${widget.player.availability}",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 20,
                                          fontFamily: 'Agency FB',
                                          fontWeight: FontWeight.bold),
                                    ),
                                    new Text(
                                      "pts",
                                      style: TextStyle(
                                          color: secondaryColor,
                                          fontSize: 14,
                                          fontFamily: 'Agency FB',
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                progressColor: Colors.blue,
                              ),
                              new Text(
                                "المتاحية",
                                style: TextStyle(
                                    color: secondaryColor,
                                    fontSize: 14,
                                    fontFamily: 'Agency FB',
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              new CircularPercentIndicator(
                                radius: 50.0,
                                lineWidth: 2.0,
                                percent: 0.6,
                                center: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    new Text(
                                      "${widget.player.desciplineScore}",
                                      style: TextStyle(
                                          color: Colors.yellow,
                                          fontSize: 20,
                                          fontFamily: 'Agency FB',
                                          fontWeight: FontWeight.bold),
                                    ),
                                    new Text(
                                      "pts",
                                      style: TextStyle(
                                          color: secondaryColor,
                                          fontSize: 14,
                                          fontFamily: 'Agency FB',
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                progressColor: Colors.yellow,
                              ),
                              new Text(
                                "الإنضباط",
                                style: TextStyle(
                                    color: secondaryColor,
                                    fontSize: 14,
                                    fontFamily: 'Agency FB',
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 70,
                          width: 70,
                          child: new Image.asset('assets/images/ejilogo.png',
                              fit: BoxFit.fill),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 130,
                      width: 220,
                      height: 220,
                      child: Container(
                        child: FutureBuilder<String>(
                          future: db.getProfileImage(
                              context, widget.player.profileImage.toString()),
                          builder: (context, snapshot) {
                            return Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: (snapshot == null || !snapshot.hasData)
                                  ? Image.asset(
                                      'assets/images/ejilogo.png',
                                      height: 116,
                                      width: 116,
                                      fit: BoxFit.fill,
                                    )
                                  : CachedNetworkImage(
                                      imageUrl: snapshot.data,
                                      fit: BoxFit.fill,
                                      height: 116,
                                      width: 116,
                                      placeholder: (context, url) =>
                                          Image.asset(
                                        'assets/images/ejilogo.png',
                                        height: 116,
                                        width: 116,
                                        fit: BoxFit.fill,
                                      ),
                                      errorWidget: (context, url, error) =>
                                          Image.asset(
                                        'assets/images/ejilogo.png',
                                        fit: BoxFit.contain,
                                        height: 116,
                                        width: 116,
                                      ),
                                    ),
                            );
                          },
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: Get.height / 1.5,
                      right: 2,
                      width: 140,
                      height: 60,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'ID :',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'Couriernew',
                                      fontWeight: FontWeight.w600,
                                      color: fontColor),
                                ),
                                Text(
                                  '${widget.player.regNum.toString()}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'Couriernew',
                                      fontWeight: FontWeight.w200,
                                      color: fontColor),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              RatingBar(
                                  initialRating: widget.player.seasons != null
                                      ? widget.player.seasons < 5
                                          ? widget.player.seasons - 0.5
                                          : 5
                                      : 0,
                                  minRating: 0,
                                  direction: Axis.horizontal,
                                  ignoreGestures: true,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemSize: 24,
                                  itemPadding:
                                      EdgeInsets.symmetric(horizontal: 0),
                                ratingWidget:RatingWidget(
                                  full: Icon(Icons.star),
                                  half: Icon(Icons.star),
                                  empty: Icon(Icons.star),

                                ),
                                  onRatingUpdate: (rating) {}),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: Get.height / 8,
                      left: 1,
                      width: Get.width - 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Container(
                            width: Get.width,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        '${widget.player.playerName.toString()}',
                                        textAlign: TextAlign.center,
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(
                                            fontSize: 36,
                                            fontFamily: 'Couriernew',
                                            fontWeight: FontWeight.w400,
                                            color: whitefontColor),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, right: 8, top: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            'تاريخ الإزدياد',
                                            style: TextStyle(
                                              fontFamily: 'Courier New',
                                              fontSize: 12,
                                              color: const Color(0xff85a2a2),
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          Text(
                                            '${widget.player.dateOfBirth.toString()}',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w300,
                                                color: whitefontColor),
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                'الهاتف',
                                                style: TextStyle(
                                                  fontFamily: 'Courier New',
                                                  fontSize: 12,
                                                  color:
                                                      const Color(0xff85a2a2),
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              Text(
                                                '${widget.player.phone.toString()}',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w200,
                                                    color: whitefontColor),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'موقع اللعب',
                                                style: TextStyle(
                                                  fontFamily: 'Courier New',
                                                  fontSize: 12,
                                                  color:
                                                      const Color(0xff85a2a2),
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              Text(
                                                '${toArabic[widget.player.position.toString()]}',
                                                style: TextStyle(
                                                  fontFamily: 'Courier New',
                                                  fontSize: 20,
                                                  color:
                                                      const Color(0xfff9f9f9),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            ' مكان الإزدياد',
                                            style: TextStyle(
                                              fontFamily: 'Courier New',
                                              fontSize: 12,
                                              color: const Color(0xff85a2a2),
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          Text(
                                            '${widget.player.placeOfBirth.toString()}',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w300,
                                                color: whitefontColor),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Email',
                                                style: TextStyle(
                                                  fontFamily: 'Courier New',
                                                  fontSize: 10,
                                                  color:
                                                      const Color(0xff85a2a2),
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              Text(
                                                '${widget.player.email.toString()}',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: 'Couriernew',
                                                    fontWeight: FontWeight.w200,
                                                    color: whitefontColor),
                                              ),
                                            ],
                                          ),
                                          new Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              Text(
                                                'عدد المواسم ',
                                                style: TextStyle(
                                                  fontFamily: 'Courier New',
                                                  fontSize: 12,
                                                  color:
                                                      const Color(0xff85a2a2),
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              new Text(
                                                '${widget.player.seasons.toString()}',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w300,
                                                    color: whitefontColor),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
  }
}

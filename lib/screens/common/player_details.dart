import 'dart:typed_data';
import 'dart:ui';

import 'package:EJI/models/player.dart';

import 'package:EJI/repository/cloud_database.dart';
import 'package:EJI/screens/admin_access/add_dialogue.dart';
import 'package:EJI/screens/admin_access/admin_drawer.dart';
import 'package:EJI/settings/params.dart';
import 'package:EJI/shared/drawer_main.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class PlayerDetails extends StatelessWidget {
  final Player player;
  PlayerDetails({
    Key key,
    @required this.player,
  });

  final CloudDatabase cD = Get.put(CloudDatabase());
  var printKey = new GlobalKey();
  _takeScreenShot() async {
    RenderRepaintBoundary boundary = printKey.currentContext.findRenderObject();
    var image = await boundary.toImage();
    ByteData byteData = await image.toByteData(format: ImageByteFormat.png);
    Uint8List pngBytes = byteData.buffer.asUint8List();
    // final directory = (await getApplicationDocumentsDirectory()).path;
    // File imgFile = new File('$directory/screenshot.png');
    //imgFile.writeAsBytes(pngBytes);
    await Share.file(
        '', 'myCard.png', byteData.buffer.asUint8List(), 'player/png',
        text: '');
  }

  @override
  Widget build(BuildContext context) {
    if (player == null) {
      return Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(),
        body: Center(child: CircularProgressIndicator()),
      );
    }
    return Scaffold(
      backgroundColor: secondaryColor,
      drawer: cD.isAdmin.value ? AdminDrawer() : MyDrawer(),
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.share),
              onPressed: () {
                _takeScreenShot();
              }),
          cD.isAdmin.value
              ? IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    Get.to(AddPlayers(
                      player: player,
                    ));
                  })
              : Container(),
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          new Image.asset('assets/images/login.png', fit: BoxFit.fill),
          ListView(
            children: [
              SizedBox(
                height: 20,
              ),
              Center(
                child: RepaintBoundary(
                  key: printKey,
                  child: Container(
                    width: Get.width - 60,
                    height: Get.height / 1.3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: accentColor, width: 2)),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: new Image.asset(
                              'assets/images/playercarddark.png',
                              fit: BoxFit.fill),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: 70,
                              width: 70,
                              child: new Image.asset('assets/images/logoW.png',
                                  fit: BoxFit.fill),
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 120,
                                    width: 120,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: accentColor),
                                    ),
                                    child: FutureBuilder<String>(
                                      future: cD.getProfileImage(context,
                                          player.profileImage.toString()),
                                      builder: (context, snapshot) {
                                        return Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: (snapshot == null ||
                                                  !snapshot.hasData)
                                              ? Image.asset(
                                                  'assets/images/ejilogo.png',
                                                  height: 116,
                                                  width: 116,
                                                  fit: BoxFit.fill,
                                                )
                                              : ClipOval(
                                                  child: CachedNetworkImage(
                                                    imageUrl: snapshot.data,
                                                    fit: BoxFit.fill,
                                                    height: 116,
                                                    width: 116,
                                                    placeholder:
                                                        (context, url) =>
                                                            Image.asset(
                                                      'assets/images/ejilogo.png',
                                                      height: 116,
                                                      width: 116,
                                                      fit: BoxFit.fill,
                                                    ),
                                                    errorWidget:
                                                        (context, url, error) =>
                                                            Image.asset(
                                                      'assets/images/ejilogo.png',
                                                      fit: BoxFit.contain,
                                                      height: 116,
                                                      width: 116,
                                                    ),
                                                  ),
                                                ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      'ID :',
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontFamily: 'Couriernew',
                                          fontWeight: FontWeight.w600,
                                          color: fontColor),
                                    ),
                                    Text(
                                      '${player.regNum.toString()}',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Couriernew',
                                          fontWeight: FontWeight.w200,
                                          color: fontColor),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 8.0,
                                  ),
                                  child: RatingBar(
                                      initialRating: player.seasons != null
                                          ? player.seasons < 5
                                              ? player.seasons - 0.5
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
                                      itemBuilder: (context, _) => Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                          ),
                                      onRatingUpdate: (rating) {}),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Positioned(
                          bottom: Get.height / 4,
                          right: 40,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    '${player.playerName.toString()}',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 28,
                                        fontFamily: 'Couriernew',
                                        fontWeight: FontWeight.w800,
                                        color: accentColor),
                                  ),
                                ),
                                Text(
                                  '${player.dateOfBirth.toString()} /${player.placeOfBirth.toString()} ',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w300,
                                      color: fontColor),
                                ),
                                Text(
                                  '${player.email.toString()}',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Couriernew',
                                      fontWeight: FontWeight.w200,
                                      color: fontColor),
                                ),
                                Text(
                                  '${player.phone.toString()}',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w200,
                                      color: fontColor),
                                ),
                                new Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    new Text(
                                      '${player.seasons.toString()}',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w300,
                                          color: fontColor),
                                    ),
                                    new Text(
                                      'PlayedSeasons'.tr,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'couriernew',
                                          fontWeight: FontWeight.w300,
                                          color: fontColor),
                                    ),
                                  ],
                                ),
                                Text(
                                  '${toArabic[player.position.toString()]}',
                                  style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w800,
                                      color: fontColor),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 80,
                          left: 10,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 8, right: 12),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      '${player.oVR.toString()}',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 56,
                                          fontFamily: 'Couriernew',
                                          fontWeight: FontWeight.w600,
                                          color: accentColor),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        'Pts',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontFamily: 'Couriernew',
                                            fontWeight: FontWeight.w600,
                                            color: accentColor),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class JuniorPlayerDetails extends StatelessWidget {
  final JuniorPlayer juniorplayer;
  JuniorPlayerDetails({Key key, @required this.juniorplayer});

  final CloudDatabase cD = Get.put(CloudDatabase());
  var juniorKey = new GlobalKey();
  _takeScreenShot() async {
    RenderRepaintBoundary boundary =
        juniorKey.currentContext.findRenderObject();
    var image = await boundary.toImage();
    ByteData byteData = await image.toByteData(format: ImageByteFormat.png);
    Uint8List pngBytes = byteData.buffer.asUint8List();
    // final directory = (await getApplicationDocumentsDirectory()).path;
    // File imgFile = new File('$directory/screenshot.png');
    //imgFile.writeAsBytes(pngBytes);
    await Share.file(
        '', 'myCard.png', byteData.buffer.asUint8List(), 'player/png',
        text: '');
  }

  @override
  Widget build(BuildContext context) {
    if (juniorplayer == null) {
      return Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(),
        body: Center(child: CircularProgressIndicator()),
      );
    }
    return Scaffold(
      backgroundColor: secondaryColor,
      drawer: cD.isAdmin.value ? AdminDrawer() : MyDrawer(),
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.share),
              onPressed: () {
                _takeScreenShot();
              }),
          cD.isAdmin.value
              ? IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    Get.to(AddPlayers(
                      juniorPlayer: juniorplayer,
                    ));
                  })
              : Container(),
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          ListView(
            children: [
              Center(
                child: RepaintBoundary(
                  key: juniorKey,
                  child: Container(
                    width: Get.width - 40,
                    height: Get.height / 1.2,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          new Image.asset('assets/images/playercarddark.png',
                              fit: BoxFit.fill),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                height: 70,
                                width: 70,
                                child: new Image.asset(
                                    'assets/images/logoW.png',
                                    fit: BoxFit.fill),
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 120,
                                      width: 120,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(color: accentColor),
                                      ),
                                      child: FutureBuilder<String>(
                                        future: cD.getProfileImage(
                                            context,
                                            juniorplayer.profileImage
                                                .toString()),
                                        builder: (context, snapshot) {
                                          return Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: (snapshot == null ||
                                                    !snapshot.hasData)
                                                ? Image.asset(
                                                    'assets/images/ejilogo.png',
                                                    height: 116,
                                                    width: 116,
                                                    fit: BoxFit.fill,
                                                  )
                                                : ClipOval(
                                                    child: CachedNetworkImage(
                                                      imageUrl: snapshot.data,
                                                      fit: BoxFit.fill,
                                                      height: 116,
                                                      width: 116,
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
                                                        fit: BoxFit.contain,
                                                        height: 116,
                                                        width: 116,
                                                      ),
                                                    ),
                                                  ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        'ID :',
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontFamily: 'Couriernew',
                                            fontWeight: FontWeight.w600,
                                            color: fontColor),
                                      ),
                                      Text(
                                        '${juniorplayer.regNum.toString()}',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: 'Couriernew',
                                            fontWeight: FontWeight.w200,
                                            color: fontColor),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: RatingBar(
                                        initialRating:
                                            juniorplayer.seasons != null
                                                ? juniorplayer.seasons < 5
                                                    ? juniorplayer.seasons - 0.5
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
                                        itemBuilder: (context, _) => Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                            ),
                                        onRatingUpdate: (rating) {}),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Positioned(
                            bottom: Get.height / 3.5,
                            right: 40,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      '${juniorplayer.playerName.toString()}',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 28,
                                          fontFamily: 'Couriernew',
                                          fontWeight: FontWeight.w800,
                                          color: accentColor),
                                    ),
                                  ),
                                  Text(
                                    '${juniorplayer.dateOfBirth.toString()} /${juniorplayer.placeOfBirth.toString()} ',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w300,
                                        color: fontColor),
                                  ),
                                  Text(
                                    '${juniorplayer.email.toString()}',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Couriernew',
                                        fontWeight: FontWeight.w200,
                                        color: fontColor),
                                  ),
                                  Text(
                                    '${juniorplayer.phone.toString()}',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w200,
                                        color: fontColor),
                                  ),
                                  new Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      new Text(
                                        '${juniorplayer.seasons.toString()}',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w200,
                                            color: fontColor),
                                      ),
                                      new Text(
                                        'PlayedSeasons'.tr,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: 'couriernew',
                                            fontWeight: FontWeight.w300,
                                            color: fontColor),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '${toArabic[juniorplayer.position.toString()]}',
                                    style: TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.w800,
                                        color: fontColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 100,
                            left: 20,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 8, right: 12),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        '${juniorplayer.oVR.toString()}',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 56,
                                            fontFamily: 'Couriernew',
                                            fontWeight: FontWeight.w600,
                                            color: accentColor),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          'Pts',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontFamily: 'Couriernew',
                                              fontWeight: FontWeight.w600,
                                              color: accentColor),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
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
        ],
      ),
    );
  }
}

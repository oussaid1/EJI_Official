import 'package:EJI/model/player.dart';
import 'package:EJI/repository/cloud_database.dart';
import 'package:EJI/screens/admin_access/add_dialogue.dart';
import 'package:EJI/screens/admin_access/admin_drawer.dart';
import 'package:EJI/settings/params.dart';
import 'package:EJI/shared/drawer_main.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class PlayerDetails extends StatelessWidget {
  final Player player;
  PlayerDetails({Key key, @required this.player});

  final CloudDatabase cD = Get.put(CloudDatabase());

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
      drawer: cD.isAdmin.value ? AdminDrawer() : MyDrawer(),
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.edit_attributes),
              onPressed: () {
                Get.to(AddPlayers(
                  player: player,
                ));
              })
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
           new Image.asset('assets/images/player.png',fit:BoxFit.fill),
          ListView(
            children: [
              Center(
                child: Card(
                  color: primaryColor.withOpacity(0.85),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Container(
                    width: Get.width - 40,
                    height: Get.height / 1.3,
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 120,
                                width: 120,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  border: Border.all(color: secondaryColor),
                                ),
                                child: FutureBuilder<String>(
                                  future: cD.getProfileImage(
                                      context, player.profileImage.toString()),
                                  builder: (context, snapshot) {
                                    return Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: (snapshot == null || !snapshot.hasData)
                                          ? Image.asset(
                                              'assets/images/logo.png',
                                              fit: BoxFit.fill,
                                            )
                                          : CachedNetworkImage(
                                              imageUrl: snapshot.data,fit: BoxFit.fill,
                                              placeholder: (context, url) =>
                                                 Image.asset(
                                              'assets/images/logo.png',
                                              fit: BoxFit.fill,
                                            ),
                                              errorWidget: (context, url, error) =>
                                                 Image.asset(
                                              'assets/images/logo.png',
                                              fit: BoxFit.fill,
                                            ),
                                            ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            Container(
                              height: 40,
                              color: primaryColorShade,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Icon(
                                    Icons.score,
                                    color: accentColor,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
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
                                        itemSize: 30,
                                        itemPadding:
                                            EdgeInsets.symmetric(horizontal: 0),
                                        itemBuilder: (context, _) => Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                            ),
                                        onRatingUpdate: (rating) {}),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0), 
                          child: Column(
                            children: <Widget>[
                              Text(
                                'PlayerName'.tr,
                                style: subtext1,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8, right: 4),
                                child: Text(
                                  '${player.playerName.toString()}',
                                  style: maintext2,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              Text(
                                'Date&PlaceofBirth'.tr,
                                style: subtext1,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 4, right: 4),
                                child: Text(
                                  '${player.dateOfBirth.toString()}/ ${player.placeOfBirth.toString()} ',
                                  style: maintext2,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              Text(
                                'Email'.tr,
                                style: subtext1,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8, right: 4),
                                child: Text(
                                  '${player.email.toString()}',
                                  style: maintext2,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              Text(
                                'PhoneNumber:'.tr,
                                style: subtext1,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8, right: 4),
                                child: Text(
                                  '${player.phone.toString()}',
                                  style: maintext2,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              Text(
                                'Position'.tr,
                                style: subtext1,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8, right: 4),
                                child: Text(
                                  '${player.position.toString()}',
                                  style: maintext2,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'PlayedSeasons'.tr,
                                  style: subtext1,
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(4, 4, 2, 2),
                                  child: new Text(
                                    '${player.seasons.toString()}',
                                    textAlign: TextAlign.center,
                                    style: maintext2,
                                  ),
                                ),
                              ]),
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
      drawer: cD.isAdmin.value ? AdminDrawer() : MyDrawer(),
      appBar: AppBar(),
      body: ListView(
        children: [
          Center(
            child: Card(
              color: primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                width: Get.width - 40,
                height: Get.height / 1.3,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              border: Border.all(color: secondaryColor),
                            ),
                            child: FutureBuilder<String>(
                              future: cD.getProfileImage(context,
                                  juniorplayer.profileImage.toString()),
                              builder: (context, snapshot) {
                                return Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: (snapshot == null || !snapshot.hasData)
                                      ? Image.asset(
                                          'assets/images/logo.png',
                                          fit: BoxFit.fill,
                                        )
                                      : Image.network(
                                          snapshot.data.toString(),
                                          fit: BoxFit.fill,
                                        ),
                                );
                              },
                            ),
                          ),
                        ),
                        Container(
                          height: 40,
                          color: primaryColorShade,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Icon(
                                Icons.score,
                                color: accentColor,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: RatingBar(
                                    initialRating: juniorplayer.seasons < 5
                                        ? juniorplayer.seasons - 0.5
                                        : 5,
                                    minRating: 0,
                                    direction: Axis.horizontal,
                                    ignoreGestures: true,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemSize: 30,
                                    itemPadding:
                                        EdgeInsets.symmetric(horizontal: 0),
                                    itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                        ),
                                    onRatingUpdate: (rating) {}),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'PlayerName'.tr,
                            style: subtext1,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 4),
                            child: Text(
                              '${juniorplayer.playerName.toString()}',
                              style: maintext2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Date&PlaceofBirth'.tr,
                            style: subtext1,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 4, right: 4),
                            child: Text(
                              '${juniorplayer.dateOfBirth.toString()}/ ${juniorplayer.placeOfBirth.toString()} ',
                              style: maintext2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Email'.tr,
                            style: subtext1,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 4),
                            child: Text(
                              '${juniorplayer.email.toString()}',
                              style: maintext2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'PhoneNumber:'.tr,
                            style: subtext1,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 4),
                            child: Text(
                              '${juniorplayer.phone.toString()}',
                              style: maintext2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Position'.tr,
                            style: subtext1,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 4),
                            child: Text(
                              '${juniorplayer.position.toString()}',
                              style: maintext2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'PlayedSeasons'.tr,
                              style: subtext1,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(4, 4, 2, 2),
                              child: new Text(
                                '${juniorplayer.seasons.toString()}',
                                textAlign: TextAlign.center,
                                style: maintext2,
                              ),
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

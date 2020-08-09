import 'package:EJI/model/player.dart';
import 'package:EJI/repository/cloud_database.dart';
import 'package:EJI/screens/admin_access/admin_drawer.dart';
import 'package:EJI/settings/params.dart';
import 'package:EJI/shared/drawer_main.dart';
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
        backgroundColor: primaryColor,
        drawer: MyDrawer(),
        appBar: AppBar(),
        body: Center(child: CircularProgressIndicator()),
      );
    }
    return Scaffold(
      drawer: cD.isAdmin.value ? AdminDrawer() : MyDrawer(),
      appBar: AppBar(),
      backgroundColor: primaryColor,
      body: Center(
        child: Card(
          color: primaryColorShade,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Container(
            width: Get.width - 40,
            height: Get.height / 1.3,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: <Widget>[
                    Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: secondaryColor),
                      ),
                      child: FutureBuilder<String>(
                        future: cD.getProfileImage(
                            context, player.profileImage.toString()),
                        builder: (context, snapshot) {
                          print(player.profileImage.toString());
                          return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: CircleAvatar(
                              radius: 80,
                              backgroundColor: secondaryColor,
                              child: ClipOval(
                                child: (snapshot == null || !snapshot.hasData)
                                    ? Image.asset(
                                        'assets/images/logo.png',
                                        fit: BoxFit.fill,
                                      )
                                    : Image.network(
                                        snapshot.data.toString(),
                                        fit: BoxFit.fill,
                                      ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        'ID :${player.regNum.toString()}',
                        style: maintext2,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
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
                SizedBox(
                  height: 10,
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
                        Container(
                          height: 40,
                          color: primaryColorShade,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              IconButton(
                                icon: Icon(
                                  Icons.thumb_up,
                                  color: accentColor,
                                ),
                                onPressed: () {},
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(4, 4, 2, 2),
                                child: new Text(
                                  '${player.seasons.toString()}',
                                  textAlign: TextAlign.center,
                                  style: maintext2,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left:8.0),
                                child: RatingBar(
                                    initialRating: 2.5,
                                    minRating: 0,
                                    direction: Axis.horizontal,
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
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

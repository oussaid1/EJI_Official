import 'package:EJI/model/player.dart';
import 'package:EJI/repository/cloud_database.dart';
import 'package:EJI/screens/admin_access/admin_drawer.dart';
import 'package:EJI/settings/params.dart';
import 'package:EJI/shared/drawer_main.dart';
import 'package:flutter/material.dart';
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
           
            width: MediaQuery.of(context).size.width - 40,
            height:  MediaQuery.of(context).size.height - 160,
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
                                        child: (snapshot == null ||
                                                !snapshot.hasData)
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
                              padding: const EdgeInsets.only(top:8.0),
                              child: Text(
                              'ID :${player.regNum.toString()}',
                              style: maintext2,
                          ),
                            ),
                  ],
                ),
                SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          flex: 1,
                          child: Text(
                            'PlayerName'.tr,
                            style: subtext1,
                          )),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8, right: 4),
                          child: Text(
                            '${player.playerName.toString()}',
                            style: maintext2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: Text(
                        'Date&PlaceofBirth'.tr,
                        style: subtext1,
                      )),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 4, right: 4),
                          child: Text(
                            '${player.dateOfBirth.toString()}/ ${player.playerName.toString()} ',
                            style: maintext2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          flex: 1,
                          child: Text(
                            'Email'.tr,
                            style: subtext1,
                          )),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8, right: 4),
                          child: Text(
                            '${player.email.toString()}',
                            style: maintext2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          flex: 1,
                          child: Text(
                            'PhoneNumber:'.tr,
                            style: subtext1,
                          )),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8, right: 4),
                          child: Text(
                            '${player.phone.toString()}',
                            style: maintext2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          flex: 1,
                          child: Text(
                            'Position'.tr,
                            style: subtext1,
                          )),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8, right: 4),
                          child: Text(
                            '${player.position.toString()}',
                            style: maintext2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'PlayerScores:'.tr,
                          style: subtext1,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 8, right: 4),
                              child: Container(
                                width: 160,
                                height: 40,
                                color: primaryColorShade,
                                child: Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Expanded(
                                      child: Row(
                                        children: <Widget>[
                                          IconButton(
                                            icon: Icon(
                                              Icons.thumb_down,
                                              color: accentColor,
                                            ),
                                            onPressed: () {},
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.fromLTRB(
                                                    4, 4, 2, 2),
                                            child: new Text(
                                              '02',
                                              textAlign: TextAlign.center,
                                              style: maintext2,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: <Widget>[
                                        new Text(
                                          '54',
                                          textAlign: TextAlign.center,
                                          style: maintext3,
                                        ),
                                        IconButton(
                                            icon: Icon(
                                              Icons.thumb_up,
                                              color: secondaryColor,
                                            ),
                                            onPressed: () {}),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
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

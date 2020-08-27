import 'package:EJI/models/player.dart';
import 'package:EJI/repository/cloud_database.dart';
import 'package:EJI/screens/common/player_details.dart';
import 'package:EJI/settings/params.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class JuniorPlayerList extends StatefulWidget {
  JuniorPlayerList({Key key}) : super(key: key);

  @override
  _JuniorListPageState createState() => _JuniorListPageState();
}

class _JuniorListPageState extends State<JuniorPlayerList> {
  final String image = "players/profileImages/ejilogo.png";
  List<JuniorPlayer> lista;

  CloudDatabase c = Get.put(CloudDatabase());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: secondaryColor,
        body: Stack(
          fit: StackFit.expand,
          children: [
            new Image.asset('assets/images/login.png', fit: BoxFit.fill),
            StreamBuilder(
                stream: c.getJuniorPlayers('Juniors'),
                builder: (BuildContext context,
                    AsyncSnapshot<List<JuniorPlayer>> snapshot) {
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

                  return ListView.builder(
                    itemCount: lista.length != 0 ? lista.length : 0,
                    itemBuilder: (BuildContext context, int index) {
                      JuniorPlayer juniorplayer = lista[index];
                      return Card(
                        margin: EdgeInsets.fromLTRB(8, 2, 8, 2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        color: primaryColor,
                        child: ListTile(
                          contentPadding: EdgeInsets.only(left: 8, right: 8),
                          leading: Stack(
                            children: <Widget>[
                              Container(
                                height: 54,
                                width: 54,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: secondaryColor),
                                ),
                                child: new FutureBuilder<String>(
                                  future: c.getProfileImage(context,
                                      juniorplayer.profileImage.toString()),
                                  builder: (context, snapshot) {
                                    return CircleAvatar(
                                      radius: 80,
                                      backgroundColor: secondaryColor,
                                      child: new ClipOval(
                                        child: (snapshot == null ||
                                                !snapshot.hasData)
                                            ? new Image.asset(
                                                'assets/images/ejilogo.png',
                                                fit: BoxFit.fill,
                                              )
                                            : new Image.network(
                                                snapshot.data.toString(),
                                                fit: BoxFit.fill,
                                              ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                          title: new Text(
                            '${juniorplayer.playerName}',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: fontColor),
                          ),
                          trailing: new Text(
                            '${juniorplayer.position}',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: fontColor),
                          ),
                          subtitle: new Text(
                            '${juniorplayer.dateOfBirth}',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w200,
                                color: fontColor),
                          ),
                          onTap: () {
                            JuniorPlayer juniorplayer = snapshot.data[index];
                            Get.to(new JuniorPlayerDetails(
                                juniorplayer: juniorplayer));
                          },
                        ),
                      );
                    },
                  );
                }),
          ],
        ));
  }
}

import 'package:EJI/model/player.dart';
import 'package:EJI/repository/cloud_database.dart';
import 'package:EJI/screens/public/player_details.dart';
import 'package:EJI/settings/params.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SeniorPlayerList extends StatefulWidget {
   SeniorPlayerList({Key key}) : super(key: key);

  @override
  _SeniorListPageState createState() => _SeniorListPageState();
}

class _SeniorListPageState extends State< SeniorPlayerList> {
  final String image = "players/profileImages/logo.png";
  List<Player> lista;

  CloudDatabase c = Get.put(CloudDatabase());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       
        body: StreamBuilder(
            stream: c.getPlayerz('players'),
            builder:
                (BuildContext context, AsyncSnapshot<List<Player>> snapshot) {
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
                  Player player = lista[index];
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
                            child:  new FutureBuilder<String>(
                              future: c.getProfileImage(
                                  context, player.profileImage.toString()),
                              builder: (context, snapshot) {
                                print(player.profileImage.toString());
                                return CircleAvatar(
                                  radius: 80,
                                  backgroundColor: secondaryColor,
                                  child:  new ClipOval(
                                    child:
                                        (snapshot == null || !snapshot.hasData)
                                            ?  new Image.asset(
                                                'assets/images/logo.png',
                                                fit: BoxFit.fill,
                                              )
                                            :  new Image.network(
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
                        '${player.playerName}',
                        style: subtext3,
                      ),
                      trailing: new Text(
                        '${player.position}',
                        style: subtext1,
                      ),
                      subtitle: new Text(
                        '${player.dateOfBirth}',
                        style: hinttext,
                      ),
                      onTap: () {
                        Player player = snapshot.data[index];
                        Get.to(new PlayerDetails(player: player));
                      },
                    ),
                  );
                },
              );
            }));
  }
}

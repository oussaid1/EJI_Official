import 'package:EJI/model/player.dart';
import 'package:EJI/repository/cloud_database.dart';
import 'package:EJI/screens/public/player_details.dart';
import 'package:EJI/settings/params.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class JuniorPlayerList extends StatefulWidget {
   JuniorPlayerList({Key key}) : super(key: key);

  @override
  _JuniorListPageState createState() => _JuniorListPageState();
}

class _JuniorListPageState extends State< JuniorPlayerList> {
  final String image = "players/profileImages/logo.png";
  List<JuniorPlayer> lista;

  CloudDatabase c = Get.put(CloudDatabase());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        body: StreamBuilder(
            stream: c.getJuniorPlayers('Juniors'),
            builder:
                (BuildContext context, AsyncSnapshot<List<JuniorPlayer>> snapshot) {
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
                            child:  new FutureBuilder<String>(
                              future: c.getProfileImage(
                                  context, juniorplayer.profileImage.toString()),
                              builder: (context, snapshot) {
                           
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
                        '${juniorplayer.playerName}',
                        style: subtext3,
                      ),
                      trailing: new Text(
                        '${juniorplayer.position}',
                        style: subtext1,
                      ),
                      subtitle: new Text(
                        '${juniorplayer.dateOfBirth}',
                        style: hinttext,
                      ),
                      onTap: () {
                        JuniorPlayer juniorplayer = snapshot.data[index];
                        Get.to(new JuniorPlayerDetails(juniorplayer: juniorplayer));
                      },
                    ),
                  );
                },
              );
            }));
  }
}

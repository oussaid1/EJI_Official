import 'package:EJI/model/player.dart';
import 'package:EJI/repository/cloud_database.dart';
import 'package:EJI/screens/admin_access/add_dialogue.dart';
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
 
  List<Player> lista;

  CloudDatabase c = Get.put(CloudDatabase());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton:c.isAdmin.value ?  Padding(
        padding: const EdgeInsets.fromLTRB(8,8,8,50),
        child: FloatingActionButton(
          elevation: 8,
          onPressed: () {
             Get.defaultDialog(
                  title: 'AddIncome'.tr,
                  content: Expanded(child: AddPlayers()),
                 
                );
          },
          child: Icon(
           Icons.person_add,
            size: 40,
            color: primaryColor,
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(100.0))),
        ),
      ): null,
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
                              
                                return CircleAvatar(
                                  radius: 100,
                                  backgroundColor: secondaryColor,
                                  child:  new ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child:
                                        (snapshot == null || !snapshot.hasData)
                                            ?  new Image.asset(
                                                'assets/images/logo.png',
                                                fit: BoxFit.fill,
                                              )
                                            :  new Image.network(
                                                snapshot.data.toString(),
                                                fit: BoxFit.contain,
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

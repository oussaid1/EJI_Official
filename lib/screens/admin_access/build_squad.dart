import 'package:EJI/model/player.dart';
import 'package:EJI/repository/cloud_database.dart';
import 'package:EJI/screens/admin_access/add_dialogue.dart';
import 'package:EJI/screens/public/player_details.dart';
import 'package:EJI/settings/params.dart';
import 'package:EJI/shared/drawer_main.dart';
import 'package:firebase/firebase.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';

class BuildSquad extends StatefulWidget {
  BuildSquad({Key key, this.players}) : super(key: key);
  final List<Player> players;
  @override
  _BuildSquadState createState() => _BuildSquadState();
}

class _BuildSquadState extends State<BuildSquad> {
  List<Player> lista;
  _addPlayerToList() {
    lista = List<Player>(11);
  }

  CloudDatabase c = Get.put(CloudDatabase());
  @override
  Widget build(BuildContext context) {
    if (widget.players == null) {
      return Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(),
        body:
            Center(child: Icon(Icons.line_style, size: 50, color: accentColor)),
      );
    } else
      return Scaffold(
          backgroundColor: secondaryColor,
          body: Stack(
            fit: StackFit.expand,
            children: [
              new Image.asset('assets/images/login.png', fit: BoxFit.fill),
              ListView.builder(
                itemCount: widget.players.length != 0 ? widget.players.length : 0,
                itemBuilder: (BuildContext context, int index) {
                  Player player = widget.players[index];
                  return Card(
                    margin: EdgeInsets.fromLTRB(8, 2, 8, 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    color: primaryColor.withOpacity(0.7),
                    child: ListTile(
                      contentPadding: EdgeInsets.only(left: 8, right: 8),
                      leading: IconButton(
                          icon: Icon(Icons.person_add), onPressed: () {}),
                      title: new Text(
                        '${player.playerName}',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: fontColor),
                      ),
                      trailing: new Text(
                        '${player.position}',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: fontColor),
                      ),
                      subtitle: new Text(
                        '${player.dateOfBirth}',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w200,
                            color: fontColor),
                      ),
                    ),
                  );
                },
              ),
            ],
          ));
  }
}

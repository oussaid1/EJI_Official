import 'package:EJI/models/player.dart';
import 'package:EJI/repository/cloud_database.dart';
import 'package:EJI/screens/admin_access/add_dialogue.dart';
import 'package:EJI/screens/common/player_details.dart';
import 'package:EJI/settings/params.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PlayerList extends StatefulWidget {
  PlayerList({Key key, @required this.collectionName, @required this.category})
      : super(key: key);
  final String collectionName;
  final int category;

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<PlayerList> {
  List<Player> lista;

  CloudDatabase c = Get.put(CloudDatabase());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: secondaryColor,
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: c.isAdmin.value
            ? Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 50),
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: FloatingActionButton(
                    elevation: 8,
                    onPressed: () {
                      Get.defaultDialog(
                        content: Expanded(
                            child: AddPlayers(
                          category: widget.category,
                        )),
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
                ),
              )
            : Container(),
        body: Stack(
          fit: StackFit.expand,
          children: [
            new Image.asset('assets/images/login.png', fit: BoxFit.fill),
            StreamBuilder(
                stream: c.getPlayers(widget.collectionName),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Player>> snapshot) {
                  if (snapshot.hasError || !snapshot.hasData) {
                    return Center(
                        child: Icon(
                      Icons.person,
                      size: 100,
                      color: secondaryColor,
                    ));
                  } else {
                    lista = snapshot.data;

                    return ListView.builder(
                      itemCount: lista.length != 0 ? lista.length : 0,
                      itemBuilder: (BuildContext context, int index) {
                        Player player = lista[index];
                        return Card(
                          margin: EdgeInsets.fromLTRB(8, 2, 8, 2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          color: primaryColor.withOpacity(0.7),
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: ListTile(
                              contentPadding:
                                  EdgeInsets.only(left: 8, right: 8),
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: new Image.asset(
                                  'assets/images/ejilogo.png',
                                  fit: BoxFit.fill,
                                  width: 54,
                                  height: 54,
                                ),
                              ),
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
                              onTap: () {
                                Player player = snapshot.data[index];
                                Get.to(new PlayerDetails(
                                    category: 1, player: player));
                              },
                            ),
                          ),
                        );
                      },
                    );
                  }
                }),
          ],
        ));
  }
}

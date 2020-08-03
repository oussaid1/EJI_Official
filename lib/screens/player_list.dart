import 'package:EJI/model/player.dart';
import 'package:EJI/repository/repository.dart';
import 'package:EJI/screens/player_details.dart';
import 'package:EJI/settings/params.dart';
import 'package:EJI/shared/drawer_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PlayerList extends StatefulWidget {
  PlayerList({Key key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<PlayerList> {
  List<Player> lista;
  FirestoreService firestoreService;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        drawer: MyDrawer(),
        appBar: AppBar(),
        body: StreamBuilder(
            stream: FirestoreService().getPlayerz(),
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
                  return ListTile(
                    contentPadding: EdgeInsets.only(left: 8, right: 8),
                    leading: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: primaryColor),
                        child: Icon(
                          Icons.person,
                          color: primaryColorShade,
                          size: 30,
                        )),
                    title: Text(
                      '${player.playerName}',
                      style: maintext3,
                    ),
                    trailing:  Text(
                      '${player.dateOfBirth}',
                      style: subtext1,
                    ),
                    onTap: () {
                      Player player = snapshot.data[index];
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PlayerDetails(player: player)),
                      );
                    },
                  );
                },
              );
            }));
  }
}

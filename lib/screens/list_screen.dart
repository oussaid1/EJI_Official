import 'package:EJI/model/player.dart';
import 'package:EJI/repository/repository.dart';
import 'package:EJI/screens/player_details.dart';
import 'package:EJI/settings/params.dart';
import 'package:EJI/shared/drawer_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class PlayerList extends StatefulWidget {
  PlayerList({Key key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<PlayerList> {
   Player player;
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
                   player = lista[index];
                  return Card(
                    margin: EdgeInsets.fromLTRB(8, 2, 8, 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    color: primaryColorShade,
                    child: Slidable(
                      actions: <Widget>[
                        IconSlideAction(
                          color: Colors.red[400],
                          caption: 'Delete',
                          icon: Icons.delete,
                          onTap: () {},
                        ),
                      ],
                      actionPane: SlidableDrawerActionPane(),
                      child: ListTile(
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
                        onTap: (){
                         
                         Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PlayerDetails(plr:player)),
                            );
                        },
                      ),
                    ),
                  );
                },
              );
            }));
  }
}

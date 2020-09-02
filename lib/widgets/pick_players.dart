import 'package:EJI/models/player.dart';
import 'package:EJI/repository/cloud_database.dart';
import 'package:EJI/settings/params.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PickPlayers extends StatefulWidget {
  const PickPlayers({
    Key key,
  }) : super(key: key);

  @override
  _PickPlayersState createState() => _PickPlayersState();
}

class _PickPlayersState extends State<PickPlayers> {
  Offset _offset = Offset(213.7, 509.7);
  List<Player> lista;
  final CloudDatabase c = Get.put(CloudDatabase());

  List<Player> candidatePlayersList = new List<Player>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Positioned(
        left: _offset.dx,
        top: _offset.dy,
        child: Draggable(
            feedback: Container(
              child: FloatingActionButton(
                  child: Icon(Icons.drag_handle), onPressed: () {}),
            ),
            child: Container(
              child: FloatingActionButton(
                  child: Icon(Icons.drag_handle), onPressed: () {}),
            ),
            childWhenDragging: Container(),
            onDragEnd: (details) {
              setState(() {
                _offset = details.offset;
              });
            }),
      ),
      body: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 0.0,
        backgroundColor: primaryColor,
        child: StreamBuilder(
            stream: c.getPlayers('Players'),
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
                  itemCount: lista != null ? lista.length : 0,
                  itemBuilder: (context, index) {
                    Player player = lista[index];

                    return ListTile(
                        onTap: () {
                          setState(() {
                            //addToSquad(player)
                            candidatePlayersList.add(player);
                          });
                        },
                        trailing: Text('${player.position}',
                            style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w600,
                                color: fontColor)),
                        title: Text('${player.playerName}',
                            style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w600,
                                color: fontColor)),
                        leading: Icon(
                          Icons.person_add,
                          color: accentColor,
                        ),
                        subtitle: Text(
                          'Score ${player.oVR}',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w200,
                              color: fontColor),
                        ));
                  });
            }),
      ),
    );
  }
}

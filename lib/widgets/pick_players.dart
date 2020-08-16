import 'package:EJI/model/player.dart';
import 'package:EJI/model/squad.dart';
import 'package:EJI/repository/cloud_database.dart';
import 'package:EJI/settings/params.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PickPlayers extends StatefulWidget {
  const PickPlayers({
    Key key,
    this.playersList,
  }) : super(key: key);
  final List<Player> playersList;

  @override
  _PickPlayersState createState() => _PickPlayersState();
}

class _PickPlayersState extends State<PickPlayers> {
  Squad _squad;
  List<Player> lista;
  final CloudDatabase c = Get.put(CloudDatabase());
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 0.0,
      backgroundColor: primaryColor,
      child: StreamBuilder(
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
                itemCount: widget.playersList != null
                    ? widget.playersList.length
                    : lista.length,
                itemBuilder: (context, index) {
                  Player player = widget.playersList != null
                      ? widget.playersList[index]
                      : lista[index];

                  return ListTile(
                    title: Row(
                      children: [
                        Text('${player.playerName}', style: maintext3),
                      ],
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.person_add,
                      ),
                      color: accentColor,
                      onPressed: () {
                        setState(() {
                          //addToSquad(player)
                        });
                      },
                    ),
                    subtitle: Text(
                      '${player.oVR}',
                      style: subtext2,
                    ),
                  );
                });
          }),
    );
  }
}

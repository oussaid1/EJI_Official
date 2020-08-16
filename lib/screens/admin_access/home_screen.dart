import 'dart:ui';

import 'package:EJI/model/player.dart';
import 'package:EJI/model/squad.dart';
import 'package:EJI/model/squad_player.dart';
import 'package:EJI/repository/cloud_database.dart';
import 'package:EJI/screens/admin_access/admin_drawer.dart';
import 'package:EJI/settings/params.dart';
import 'package:EJI/shared/drawer_main.dart';
import 'package:EJI/widgets/pick_players.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.selectedSquad}) : super(key: key);
  final List<Player> selectedSquad;
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  double height = Get.height, width = Get.width;

  bool isAccepted = false;
  bool isSwitched = false;

  final CloudDatabase c = Get.put(CloudDatabase());

  @override
  void initState() {
//mBox.write('adminkey',false).then((value) => isAdmin= mBox != null ? mBox.read('adminkey') :true);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.selectedSquad != null) {
      Squad sqaud = new Squad.main433(list11Players: widget.selectedSquad);
      return Scaffold(
        backgroundColor: primaryColor,
        drawer: c.isAdmin.value ? AdminDrawer() : MyDrawer(),
        appBar: AppBar(
          actions: <Widget>[
            Row(
              children: [
                Text(
                  'Add Players',
                  style: subtext1,
                ),
                IconButton(
                  icon: Icon(Icons.group_add),
                  onPressed: () {
                    Get.to(PickPlayers());
                  },
                ),
              ],
            )
          ],
        ),
        body: Stack(
          fit: StackFit.passthrough,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 2),
              child:
                  Image.asset('assets/images/field.png', fit: BoxFit.contain),
            ),
            // GoalKeeper
            buildPositionedPlayer(bottm: height / 50, left: width / 2.7,playerCandidate: sqaud.pGK),
            //deffence
            buildPositionedPlayer(bottm: height / 7, left: width / 20,playerCandidate: sqaud.pGK),
            buildPositionedPlayer(bottm: height / 7, left: width / 3.5,playerCandidate: sqaud.pGK),
            buildPositionedPlayer(bottm: height / 7, right: width / 3.5,playerCandidate: sqaud.pGK),
            buildPositionedPlayer(bottm: height / 7, right: width / 20,playerCandidate: sqaud.pGK),
            //MiddleField
            buildPositionedPlayer(bottm: height / 3, right: width / 20,playerCandidate: sqaud.pGK),
            buildPositionedPlayer(bottm: height / 3, right: width / 2.55,playerCandidate: sqaud.pGK),
            buildPositionedPlayer(bottm: height / 3, left: width / 20,playerCandidate: sqaud.pGK),

            //Forward
            buildPositionedPlayer(top: height / 6, right: width / 20,playerCandidate: sqaud.pGK),
            buildPositionedPlayer(top: height / 10, right: width / 2.55,playerCandidate: sqaud.pGK),
            buildPositionedPlayer(top: height / 6, left: width / 20,playerCandidate: sqaud.pGK),
          ],
        ),
      );
    } else
      return Scaffold(
        backgroundColor: primaryColor,
        drawer: c.isAdmin.value ? AdminDrawer() : MyDrawer(),
        appBar: AppBar(
          actions: <Widget>[
            Row(
              children: [
                Text(
                  'Add Players',
                  style: subtext1,
                ),
                IconButton(
                  icon: Icon(Icons.group_add),
                  onPressed: () {
                    Get.to(PickPlayers());
                  },
                ),
              ],
            )
          ],
        ),
        body: Stack(
          fit: StackFit.passthrough,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 2),
              child:
                  Image.asset('assets/images/field.png', fit: BoxFit.contain),
            ),
            // GoalKeeper
            buildPositionedPlayer(bottm: height / 50, left: width / 2.7),
            //deffence
            buildPositionedPlayer(bottm: height / 7, left: width / 20),
            buildPositionedPlayer(bottm: height / 7, left: width / 3.5),
            buildPositionedPlayer(bottm: height / 7, right: width / 3.5),
            buildPositionedPlayer(bottm: height / 7, right: width / 20),
            //MiddleField
            buildPositionedPlayer(bottm: height / 3, right: width / 20),
            buildPositionedPlayer(bottm: height / 3, right: width / 2.55),
            buildPositionedPlayer(bottm: height / 3, left: width / 20),

            //Forward
            buildPositionedPlayer(top: height / 6, right: width / 20),
            buildPositionedPlayer(top: height / 10, right: width / 2.55),
            buildPositionedPlayer(top: height / 6, left: width / 20),
          ],
        ),
      );
  }

  Positioned buildPositionedPlayer(
      {double bottm, double left, double right, double top,Player playerCandidate}) {
    return Positioned(
      bottom: bottm,
      left: left,
      right: right,
      top: top,
      child: Container(
        height: 140,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: playerCandidate!=null?
              new SquadPlayer(squadPlayer: playerCandidate,): new SquadPlayer(),
            ),
          ],
        ),
      ),
    );
  }
}

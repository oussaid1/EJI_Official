import 'dart:ui';

import 'package:EJI/model/player.dart';
import 'package:EJI/model/squad.dart';
import 'package:EJI/model/squad_player.dart';
import 'package:EJI/repository/cloud_database.dart';
import 'package:EJI/repository/variables_controler.dart';
import 'package:EJI/screens/admin_access/admin_drawer.dart';
import 'package:EJI/settings/params.dart';
import 'package:EJI/shared/drawer_main.dart';
import 'package:EJI/widgets/pick_players.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.selectedSquad}) : super(key: key);
  final List<Player> selectedSquad;
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  double height = Get.height, width = Get.width;
  Squad selectedSquad;
  bool isAccepted = false;
  bool isSwitched = false;
  List<Player> lista;
  List<Player> listaGK;
  final CloudDatabase c = Get.put(CloudDatabase());
  final VariablesControler vbc = Get.put(VariablesControler());

  @override
void initState(){
  super.initState();
  SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
     
  ]);
}
@override
dispose(){
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  super.dispose();
}
  @override
  Widget build(BuildContext context) {
    if (widget.selectedSquad != null) {
      Squad sqaud = new Squad.main433(list11Players: widget.selectedSquad);
      return Scaffold(
        backgroundColor: primaryColor,
        drawer: c.isAdmin.value ? AdminDrawer() : MyDrawer(),
        appBar: AppBar(),
        body: Stack(
          fit: StackFit.passthrough,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 2),
              child: Image.asset('assets/images/field2.png', fit: BoxFit.fill),
            ),
            // GoalKeeper
            buildPositionedPlayer(
                bottm: height / 50,
                left: width / 2.7,
                playerCandidate: sqaud.pGK),
            //deffence
            buildPositionedPlayer(
                bottm: height / 7,
                left: width / 20,
                playerCandidate: sqaud.pGK),
            buildPositionedPlayer(
                bottm: height / 7,
                left: width / 3.5,
                playerCandidate: sqaud.pGK),
            buildPositionedPlayer(
                bottm: height / 7,
                right: width / 3.5,
                playerCandidate: sqaud.pGK),
            buildPositionedPlayer(
                bottm: height / 7,
                right: width / 20,
                playerCandidate: sqaud.pGK),
            //MiddleField
            buildPositionedPlayer(
                bottm: height / 3,
                right: width / 20,
                playerCandidate: sqaud.pGK),
            buildPositionedPlayer(
                bottm: height / 3,
                right: width / 2.55,
                playerCandidate: sqaud.pGK),
            buildPositionedPlayer(
                bottm: height / 3,
                left: width / 20,
                playerCandidate: sqaud.pGK),

            //Forward
            buildPositionedPlayer(
                top: height / 6, right: width / 20, playerCandidate: sqaud.pGK),
            buildPositionedPlayer(
                top: height / 10,
                right: width / 2.55,
                playerCandidate: sqaud.pGK),
            buildPositionedPlayer(
                top: height / 6, left: width / 20, playerCandidate: sqaud.pGK),
          ],
        ),
      );
    } else
      return Scaffold(
        backgroundColor: primaryColor,
        drawer: c.isAdmin.value ? AdminDrawer() : MyDrawer(),
        appBar: AppBar(),
        body: StreamBuilder(
            stream: c.get11Playerz(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Player>> snapshot) {
              if (snapshot.hasError || !snapshot.hasData) {
                return Container();
              } else {
                //lista = snapshot.data;
                selectedSquad = new Squad.main433(list11Players: snapshot.data);

                return StreamBuilder(
                    stream: c.getGK(),
                    builder: (context, snapshotGK) {
                      if (snapshotGK.hasError || !snapshotGK.hasData) {
                        return Container();
                      } else {
                        listaGK = snapshotGK.data;
                        Player goalKeeper = listaGK[0];
                        return Stack(
                          fit: StackFit.passthrough,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 2),
                              child: Image.asset('assets/images/field2.png',
                                  fit: BoxFit.contain),
                            ),
                            // GoalKeeper
                            buildPositionedPlayer(
                                bottm: height / 50,
                                left: width / 2.44,
                                playerCandidate: goalKeeper),
                            //deffence
                            buildPositionedPlayer(
                                bottm: height / 5,
                                left: width / 20,
                                playerCandidate: selectedSquad.pCB4),
                            buildPositionedPlayer(
                                bottm: height / 5,
                                left: width / 3.5,
                                playerCandidate: selectedSquad.pCB5),
                            buildPositionedPlayer(
                                bottm: height / 5,
                                right: width / 3.5,
                                playerCandidate: selectedSquad.pLB),
                            buildPositionedPlayer(
                                bottm: height / 5,
                                right: width / 20,
                                playerCandidate: selectedSquad.pRB),
                            //MiddleField
                            buildPositionedPlayer(
                                bottm: height / 2.5,
                                right: width / 20,
                                playerCandidate: selectedSquad.pRMF),
                            buildPositionedPlayer(
                                bottm: height / 2.5,
                                right: width / 2.34,
                                playerCandidate: selectedSquad.pLMF),
                            buildPositionedPlayer(
                                bottm: height / 2.5,
                                left: width / 20,
                                playerCandidate: selectedSquad.pCMF),

                            //Forward
                            buildPositionedPlayer(
                                top: height / 6,
                                right: width / 20,
                                playerCandidate: selectedSquad.pRWF),
                            buildPositionedPlayer(
                                top: height / 10,
                                right: width / 2.34,
                                playerCandidate: selectedSquad.pLWF),
                            buildPositionedPlayer(
                                top: height / 6,
                                left: width / 20,
                                playerCandidate: selectedSquad.pCF),
                          ],
                        );
                      }
                    });
              }
            }),
      );
  }

  Positioned buildPositionedPlayer(
      {double bottm,
      double left,
      double right,
      double top,
      Player playerCandidate}) {
    return Positioned(
      bottom: bottm,
      left: left,
      right: right,
      top: top,
      child: SizedBox(
        height: 90,
        width: 65,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(),
                  color: fontColor,
                  borderRadius: BorderRadius.circular(8)),
              height: 90,
              width: 65,
              child: DragTarget(
                builder: (BuildContext context, List<dynamic> candidateData,
                    List<dynamic> rejectedData) {
                  if (!isAccepted) {
                    return new Container();
                  } else
                    return playerCandidate != null
                        ? new SquadPlayer(
                            squadPlayer: playerCandidate,
                          )
                        : new SquadPlayer();
                },
                onWillAccept: (data) {
                  return true;
              
                },
                onAccept: (data) {

                  setState(() {
                    isAccepted=true;
                  });
                },
              ),
            ),
            Container(
              child: Draggable<Player>(
                data: playerCandidate,
                childWhenDragging: Container(),
                feedback: playerCandidate != null
                    ? new SquadPlayer(
                        squadPlayer: playerCandidate,
                      )
                    : new SquadPlayer(),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: playerCandidate != null
                      ? new SquadPlayer(
                          squadPlayer: playerCandidate,
                        )
                      : new SquadPlayer(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

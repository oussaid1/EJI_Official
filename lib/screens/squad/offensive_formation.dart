import 'dart:ui';

import 'package:EJI/models/player.dart';
import 'package:EJI/models/squad.dart';
import 'package:EJI/models/squad_player.dart';
import 'package:EJI/repository/cloud_database.dart';
import 'package:EJI/repository/variables_controler.dart';
import 'package:EJI/screens/admin_access/admin_drawer.dart';
import 'package:EJI/settings/params.dart';
import 'package:EJI/shared/drawer_main.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Offenssive extends StatefulWidget {
  Offenssive({Key key, this.selectedSquad}) : super(key: key);
  final List<Player> selectedSquad;
  @override
  _OffenssiveState createState() => _OffenssiveState();
}

class _OffenssiveState extends State<Offenssive> {
  double height = Get.height, width = Get.width;
  bool format1 = false;
  Squad selectedSquad;
  bool isAccepted = false;
  bool isSwitched = false;
  int formationIndex = 0;
  List<Player> lista;
  List<Player> listaGK;
  final CloudDatabase c = Get.put(CloudDatabase());
  final VariablesControler vbc = Get.put(VariablesControler());

  _changeFormation(int i) {
    setState(() {
      formationIndex = i;
    });
  }

  @override
  void initState() {
//mBox.write('adminkey',false).then((value) => isAdmin= mBox != null ? mBox.read('adminkey') :true);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.initState();
  }

  @override
  void dispose() {
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
      selectedSquad = new Squad.main4213(list11Players: widget.selectedSquad);

      return Scaffold(
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: Get.width - 40,
                height: 600,
                child: Stack(
                  fit: StackFit.passthrough,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 2),
                      child: Image.asset('assets/images/field2.png',
                          fit: BoxFit.fill),
                    ),
                    // GoalKeeper
                    buildPositionedPlayer(
                        top: Get.height / 50,
                        left: Get.width / 2.4,
                        playerCandidate: selectedSquad.pGK),
                    //deffence
                    //LB
                    buildPositionedPlayer(
                        top: Get.height / 7,
                        left: Get.width / 20,
                        playerCandidate:
                            selectedSquad.pLB ?? new Player.dummy()),
                    //CB5
                    buildPositionedPlayer(
                        top: Get.height / 7,
                        left: Get.width / 3.5,
                        playerCandidate:
                            selectedSquad.pCB5 ?? new Player.dummy()),
                    //CB4
                    buildPositionedPlayer(
                        bottm: squadformation[formationIndex]['CB4b'],
                        right: squadformation[formationIndex]['CB4b'],
                        playerCandidate:
                            selectedSquad.pCB4 ?? new Player.dummy()),
                    //RB
                    buildPositionedPlayer(
                        top: Get.height / 7,
                        right: Get.width / 20,
                        playerCandidate:
                            selectedSquad.pRB ?? new Player.dummy()),
                    //MiddleField
                    //RMF
                    buildPositionedPlayer(
                        top: Get.height / 2.8,
                        right: Get.width / 5,
                        playerCandidate:
                            selectedSquad.pRMF ?? new Player.dummy()),
                    //CMF
                    buildPositionedPlayer(
                        top: Get.height / 2.2,
                        right: Get.width / 2.4,
                        playerCandidate:
                            selectedSquad.pSS ?? new Player.dummy()),
                    //LMF
                    buildPositionedPlayer(
                        top: Get.height / 2.8,
                        left: Get.width / 5,
                        playerCandidate: selectedSquad.pLMF ??
                            selectedSquad.pLMF ??
                            new Player.dummy()),

                    //Forward
                    //RWF
                    buildPositionedPlayer(
                        top: Get.height / 1.8,
                        right: Get.width / 20,
                        playerCandidate:
                            selectedSquad.pRWF ?? new Player.dummy()),
                    //CF
                    buildPositionedPlayer(
                        top: Get.height / 1.6,
                        right: Get.width / 2.4,
                        playerCandidate:
                            selectedSquad.pCF ?? new Player.dummy()),

                    //LWF
                    buildPositionedPlayer(
                        top: Get.height / 1.8,
                        left: Get.width / 20,
                        playerCandidate:
                            selectedSquad.pLWF ?? new Player.dummy()),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    } else
      return Scaffold(
          backgroundColor: primaryColor,
          body: Column(
            children: [
              Container(
                  alignment: Alignment.center,
                  height: 600,
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 2),
                        child: Image.asset('assets/images/field2.png',
                            fit: BoxFit.fill),
                      ),
                      // GoalKeeper
                      buildPositionedPlayer(
                        top: Get.height / 50,
                        left: Get.width / 2.4,
                      ),
                      //deffence
                      //LB
                      buildPositionedPlayer(
                        top: Get.height / 7,
                        left: Get.width / 20,
                      ),
                      //CB5
                      buildPositionedPlayer(
                        top: Get.height / 7,
                        left: Get.width / 3.5,
                      ),
                      //CB4
                      buildPositionedPlayer(
                        top: Get.height / 7,
                        right: Get.width / 3.5,
                      ),
                      //RB
                      buildPositionedPlayer(
                        top: Get.height / 7,
                        right: Get.width / 20,
                      ),
                      //MiddleField
                      //RMF
                      buildPositionedPlayer(
                        top: Get.height / 2.8,
                        right: Get.width / 5,
                      ),
                      //CMF
                      buildPositionedPlayer(
                        top: Get.height / 2.2,
                        right: Get.width / 2.4,
                      ),
                      //LMF
                      buildPositionedPlayer(
                        top: Get.height / 2.8,
                        left: Get.width / 5,
                      ),

                      //Forward
                      //RWF
                      buildPositionedPlayer(
                        top: Get.height / 1.8,
                        right: Get.width / 20,
                      ),
                      //CF
                      buildPositionedPlayer(
                        top: Get.height / 1.6,
                        right: Get.width / 2.4,
                      ),

                      //LWF
                      buildPositionedPlayer(
                        top: Get.height / 1.8,
                        left: Get.width / 20,
                      ),
                    ],
                  )),
            ],
          ));
  }

  Positioned buildPositionedPlayer(
      {double bottm,
      double left,
      double right,
      double top,
      Player playerCandidate}) {
    if (playerCandidate == null) {
      playerCandidate = new Player.dummy();
    }
    return Positioned(
      bottom: bottm,
      left: left,
      right: right,
      top: top,
      child: SizedBox(
        height: 80,
        width: 65,
        child: Stack(
          fit: StackFit.passthrough,
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
                    return new SquadPlayer(
                      squadPlayer: playerCandidate,
                    );
                },
                onWillAccept: (data) {
                  return true;
                },
                onAccept: (data) {
                  setState(() {
                    isAccepted = true;
                  });
                },
              ),
            ),
            Container(
              child: Draggable<Player>(
                data: playerCandidate,
                childWhenDragging: Container(),
                feedback: new SquadPlayer(
                  squadPlayer: playerCandidate,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: new SquadPlayer(
                    squadPlayer: playerCandidate,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

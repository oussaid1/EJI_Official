import 'dart:ui';

import 'package:EJI/models/player.dart';
import 'package:EJI/models/squad.dart';
import 'package:EJI/models/squad_player.dart';
import 'package:EJI/repository/cloud_database.dart';
import 'package:EJI/repository/variables_controler.dart';
import 'package:EJI/settings/params.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MainFormation extends StatefulWidget {
  MainFormation({Key key, this.selectedSquad}) : super(key: key);
  final List<Player> selectedSquad;
  @override
  _MainFormationState createState() => _MainFormationState();
}

class _MainFormationState extends State<MainFormation> {
  int formationIndex = 0;
  List<Player> lista = List<Player>();
  final CloudDatabase c = Get.put(CloudDatabase());
  final VariablesControler vbc = Get.put(VariablesControler());
  List<Color> forColors = [
    accentColor,
    secondaryColor,
    secondaryColor,
  ];
  bool selectedFor1 = true;
  bool selectedFor2 = false;
  bool selectedFor3 = false;
  Squad selectedSquadxy;
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
      selectedSquadxy = new Squad.main433(list11Players: widget.selectedSquad);

      return Scaffold(
        body: Stack(
          children: [
            Container(
              width: Get.width - 0,
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
                ],
              ),
            ),
          ],
        ),
      );
    } else
      return Scaffold(
          appBar: AppBar(
            actions: [
              FlatButton(
                onPressed: () {
                  setState(() {
                    formationIndex = 0;
                    selectedFor1 = true;
                    selectedFor2 = false;
                    selectedFor3 = false;
                  });
                },
                child: Text(
                  '4-3-3',
                  style: TextStyle(
                    fontSize: 18,
                    color: selectedFor1 ? accentColor : secondaryColor,
                  ),
                ),
              ),
              FlatButton(
                onPressed: () {
                  setState(() {
                    formationIndex = 1;
                    selectedFor1 = false;
                    selectedFor2 = true;
                    selectedFor3 = false;
                  });
                },
                child: Text(
                  '4-4-2',
                  style: TextStyle(
                    fontSize: 18,
                    color: selectedFor2 ? accentColor : secondaryColor,
                  ),
                ),
              ),
              FlatButton(
                onPressed: () {
                  setState(() {
                    formationIndex = 2;
                    selectedFor1 = false;
                    selectedFor2 = false;
                    selectedFor3 = true;
                  });
                },
                child: Text(
                  '4-2-3-1',
                  style: TextStyle(
                    fontSize: 18,
                    color: selectedFor3 ? accentColor : secondaryColor,
                  ),
                ),
              ),
            ],
          ),
          backgroundColor: primaryColor,
          body: Column(
            children: [
              Container(
                  alignment: Alignment.center,
                  height: 600,
                  child: StreamBuilder(
                      stream: c.getPlayers('Players'),
                      builder:
                          (context, AsyncSnapshot<List<Player>> snapshots) {
                        if (snapshots.hasData && !snapshots.hasError) {
                          selectedSquadxy =
                              new Squad.main433(list11Players: snapshots.data);
                          return Stack(
                            fit: StackFit.expand,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left: 2),
                                child: Image.asset('assets/images/field2.png',
                                    fit: BoxFit.fill),
                              ),
                              // GoalKeeper
                              _buildGK(selectedSquad: selectedSquadxy),
                              //deffence
                              //LB
                              _buildLB(formationIndex,
                                  selectedSquad: selectedSquadxy),
                              //CB5
                              _buildCB5(formationIndex,
                                  selectedSquad: selectedSquadxy),
                              //CB4
                              _buildCB4(formationIndex,
                                  selectedSquad: selectedSquadxy),
                              //RB
                              _buildRB(formationIndex,
                                  selectedSquad: selectedSquadxy),
                              //MiddleField
                              //RMF
                              _buildRMF(formationIndex,
                                  selectedSquad: selectedSquadxy),
                              //CMF
                              _buildCMF(formationIndex,
                                  selectedSquad: selectedSquadxy),
                              //LMF
                              _buildLMF(formationIndex,
                                  selectedSquad: selectedSquadxy),

                              //Forward
                              //RWF
                              _buildRWF(formationIndex,
                                  selectedSquad: selectedSquadxy),
                              //CF
                              _buildCF(formationIndex,
                                  selectedSquad: selectedSquadxy),

                              //LWF
                              _buildLWF(formationIndex,
                                  selectedSquad: selectedSquadxy),
                            ],
                          );
                        } else
                          return Stack(
                            fit: StackFit.expand,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left: 2),
                                child: Image.asset('assets/images/field2.png',
                                    fit: BoxFit.fill),
                              ),
                              // GoalKeeper
                            ],
                          );
                      })),
            ],
          ));
  }

  Widget _buildGK({Squad selectedSquad}) {
    // if (selectedSquad != null) selectedSquad = new Squad.dummy();

    return buildPositionedPlayer(
      top: Get.height / 50,
      left: Get.width / 2.4,
      playerCandidate: selectedSquad.pGK ?? new Player.dummy('GK'),
    );
  }

  Widget _buildRB(int formationIndex, {Squad selectedSquad}) {
    switch (formationIndex) {
      case 0:
        return buildPositionedPlayer(
          top: Get.height / 7,
          right: Get.width / 20,
          playerCandidate: selectedSquad.pRB ?? new Player.dummy('RB'),
        );
        break;
      case 1:
        return buildPositionedPlayer(
          top: Get.height / 7,
          right: Get.width / 20,
          playerCandidate: selectedSquad.pRB ?? new Player.dummy('RB'),
        );
        break;
      case 2:
        return buildPositionedPlayer(
          top: Get.height / 7,
          right: Get.width / 20,
          playerCandidate: selectedSquad.pRB ?? new Player.dummy('RB'),
        );
        break;
      default:
        return buildPositionedPlayer(
          top: Get.height / 7,
          right: Get.width / 20,
          playerCandidate: selectedSquad.pRB ?? new Player.dummy('RB'),
        );
    }
  }

  Widget _buildLB(int formationIndex, {Squad selectedSquad}) {
    switch (formationIndex) {
      case 0:
        return buildPositionedPlayer(
          top: Get.height / 7,
          left: Get.width / 20,
          playerCandidate: selectedSquad.pLB ?? new Player.dummy('LB'),
        );
        break;
      case 1:
        return buildPositionedPlayer(
          top: Get.height / 7,
          left: Get.width / 20,
          playerCandidate: selectedSquad.pLB ?? new Player.dummy('LB'),
        );
        break;
      case 2:
        return buildPositionedPlayer(
          top: Get.height / 7,
          left: Get.width / 20,
          playerCandidate: selectedSquad.pLB ?? new Player.dummy('LB'),
        );
        break;
      default:
        return buildPositionedPlayer(
          top: Get.height / 7,
          left: Get.width / 20,
          playerCandidate: selectedSquad.pLB ?? new Player.dummy('LB'),
        );
    }
  }

  Widget _buildCB4(int formationIndex, {Squad selectedSquad}) {
    switch (formationIndex) {
      case 0:
        return buildPositionedPlayer(
          top: Get.height / 7,
          right: Get.width / 3.5,
          playerCandidate: selectedSquad.pCB4 ?? new Player.dummy('CB'),
        );
        break;
      case 1:
        return buildPositionedPlayer(
          top: Get.height / 7,
          right: Get.width / 3.5,
          playerCandidate: selectedSquad.pCB4 ?? new Player.dummy('CB'),
        );
        break;
      case 2:
        return buildPositionedPlayer(
          top: Get.height / 7,
          right: Get.width / 3.5,
          playerCandidate: selectedSquad.pCB4 ?? new Player.dummy('CB'),
        );
        break;
      default:
        return buildPositionedPlayer(
          top: Get.height / 7,
          right: Get.width / 3.5,
          playerCandidate: selectedSquad.pCB4 ?? new Player.dummy('CB'),
        );
    }
  }

  Widget _buildCB5(int formationIndex, {Squad selectedSquad}) {
    switch (formationIndex) {
      case 0:
        return buildPositionedPlayer(
          top: Get.height / 7,
          left: Get.width / 3.5,
          playerCandidate: selectedSquad.pCB5 ?? new Player.dummy('CB'),
        );
        break;
      case 1:
        return buildPositionedPlayer(
          top: Get.height / 7,
          left: Get.width / 3.5,
          playerCandidate: selectedSquad.pCB5 ?? new Player.dummy('CB'),
        );
        break;
      case 2:
        return buildPositionedPlayer(
          top: Get.height / 7,
          left: Get.width / 3.5,
          playerCandidate: selectedSquad.pCB5 ?? new Player.dummy('CB'),
        );
        break;
      default:
        return buildPositionedPlayer(
          top: Get.height / 7,
          left: Get.width / 3.5,
          playerCandidate: selectedSquad.pCB5 ?? new Player.dummy('CB'),
        );
    }
  }

  Widget _buildRMF(int formationIndex, {Squad selectedSquad}) {
    switch (formationIndex) {
      case 0:
        return buildPositionedPlayer(
          top: Get.height / 2.8,
          right: Get.width / 20,
          playerCandidate: selectedSquad.pCMF2 ?? new Player.dummy('RMF'),
        );
        break;
      case 1:
        return buildPositionedPlayer(
          top: Get.height / 2.8,
          right: Get.width / 20,
          playerCandidate: selectedSquad.pDMF ?? new Player.dummy('DMF'),
        );
        break;
      case 2:
        return buildPositionedPlayer(
          top: Get.height / 3.5,
          right: Get.width / 4,
          playerCandidate: selectedSquad.pCMF2 ?? new Player.dummy('DMF'),
        );
        break;
      default:
        return buildPositionedPlayer(
          top: Get.height / 2.8,
          right: Get.width / 20,
          playerCandidate: selectedSquad.pRMF ?? new Player.dummy('RMF'),
        );
    }
  }

  Widget _buildCMF(int formationIndex, {Squad selectedSquad}) {
    switch (formationIndex) {
      case 0:
        return buildPositionedPlayer(
          top: Get.height / 2.8,
          right: Get.width / 2.4,
          playerCandidate: selectedSquad.pDMF ?? new Player.dummy('CMF'),
        );
        break;
      case 1:
        return buildPositionedPlayer(
          top: Get.height / 2.8,
          left: Get.width / 3.5,
          playerCandidate: selectedSquad.pCMF1 ?? new Player.dummy('CMF'),
        );
        break;
      case 2:
        return buildPositionedPlayer(
          top: Get.height / 2.5,
          right: Get.width / 2.4,
          playerCandidate: selectedSquad.pCMF1 ?? new Player.dummy('CMF'),
        );
        break;
      default:
        return buildPositionedPlayer(
          top: Get.height / 2.8,
          right: Get.width / 2.4,
          playerCandidate: selectedSquad.pLWF ?? new Player.dummy('CMF'),
        );
    }
  }

  Widget _buildLMF(int formationIndex, {Squad selectedSquad}) {
    switch (formationIndex) {
      case 0:
        return buildPositionedPlayer(
          top: Get.height / 2.8,
          left: Get.width / 20,
          playerCandidate: selectedSquad.pCMF1 ?? new Player.dummy('CMF'),
        );
        break;
      case 1:
        return buildPositionedPlayer(
          top: Get.height / 2.8,
          left: Get.width / 20,
          playerCandidate: selectedSquad.pAMF ?? new Player.dummy('CMF'),
        );
        break;
      case 2:
        return buildPositionedPlayer(
          top: Get.height / 3.5,
          left: Get.width / 4,
          playerCandidate: selectedSquad.pDMF ?? new Player.dummy('CMF'),
        );
        break;
      default:
        return buildPositionedPlayer(
          top: Get.height / 2.8,
          left: Get.width / 20,
          playerCandidate: selectedSquad.pLWF ?? new Player.dummy('CMF'),
        );
    }
  }

  Widget _buildRWF(int formationIndex, {Squad selectedSquad}) {
    switch (formationIndex) {
      case 0:
        return buildPositionedPlayer(
          top: Get.height / 1.8,
          right: Get.width / 20,
          playerCandidate: selectedSquad.pRMF ?? new Player.dummy('CMF'),
        );
        break;
      case 1:
        return buildPositionedPlayer(
          top: Get.height / 1.8,
          left: Get.width / 4,
          playerCandidate: selectedSquad.pLWF ?? new Player.dummy('CMF'),
        );
        break;
      case 2:
        return buildPositionedPlayer(
          top: Get.height / 2.5,
          right: Get.width / 20,
          playerCandidate: selectedSquad.pLMF ?? new Player.dummy('LMF'),
        );
        break;
      default:
        return buildPositionedPlayer(
          top: Get.height / 1.8,
          right: Get.width / 20,
          playerCandidate: selectedSquad.pRWF ?? new Player.dummy('CMF'),
        );
    }
  }

  Widget _buildCF(int formationIndex, {Squad selectedSquad}) {
    switch (formationIndex) {
      case 0:
        return buildPositionedPlayer(
          top: Get.height / 1.8,
          right: Get.width / 2.4,
          playerCandidate: selectedSquad.pCF ?? new Player.dummy('CF'),
        );
        break;
      case 1:
        return buildPositionedPlayer(
          top: Get.height / 1.8,
          right: Get.width / 4,
          playerCandidate: selectedSquad.pCF ?? new Player.dummy('CF'),
        );
        break;
      case 2:
        return buildPositionedPlayer(
          top: Get.height / 1.8,
          right: Get.width / 2.4,
          playerCandidate: selectedSquad.pCF ?? new Player.dummy('CF'),
        );
        break;
      default:
        return buildPositionedPlayer(
          top: Get.height / 1.8,
          right: Get.width / 2.4,
          playerCandidate: selectedSquad.pCF ?? new Player.dummy('CF'),
        );
    }
  }

  Widget _buildLWF(int formationIndex, {Squad selectedSquad}) {
    switch (formationIndex) {
      case 0:
        return buildPositionedPlayer(
          top: Get.height / 1.8,
          left: Get.width / 20,
          playerCandidate: selectedSquad.pLWF ?? new Player.dummy('LWF'),
        );
        break;
      case 1:
        return buildPositionedPlayer(
          top: Get.height / 2.8,
          right: Get.width / 3.5,
          playerCandidate: selectedSquad.pCMF2 ?? new Player.dummy('LWF'),
        );
        break;
      case 2:
        return buildPositionedPlayer(
          top: Get.height / 2.5,
          left: Get.width / 20,
          playerCandidate: selectedSquad.pLWF ?? new Player.dummy('LWF'),
        );
        break;
      default:
        return buildPositionedPlayer(
          top: Get.height / 1.8,
          left: Get.width / 20,
          playerCandidate: selectedSquad.pLWF ?? new Player.dummy('LWF'),
        );
    }
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
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          Container(
            height: 90,
            width: 75,
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
    );
  }
}

import 'dart:ui';

import 'package:EJI/model/player.dart';
import 'package:EJI/model/squad.dart';
import 'package:EJI/model/squad_player.dart';
import 'package:EJI/repository/cloud_database.dart';
import 'package:EJI/repository/variables_controler.dart';
import 'package:EJI/screens/admin_access/admin_drawer.dart';
import 'package:EJI/settings/params.dart';
import 'package:EJI/shared/drawer_main.dart';
import 'package:flutter/services.dart';
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
  Squad selectedSquad;
  bool isAccepted = false;
  bool isSwitched = false;
  List<Player> lista;
  List<Player> listaGK;
  final CloudDatabase c = Get.put(CloudDatabase());
  final VariablesControler vbc = Get.put(VariablesControler());

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
    return Scaffold(
        backgroundColor: primaryColor,
        drawer: c.isAdmin.value ? AdminDrawer() : MyDrawer(),
        appBar: AppBar(),
        body: StreamBuilder(
            stream: c.getPlayerz('players'),
            builder:
                (BuildContext context, AsyncSnapshot<List<Player>> snapshot) {
              if (snapshot.hasError || !snapshot.hasData) {
                return Scaffold(
                  backgroundColor: primaryColor,
                  drawer: c.isAdmin.value ? AdminDrawer() : MyDrawer(),
                  appBar: AppBar(),
                  body: Container(
                    width: 360,
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
                            bottm: squadformation[0]['GKb'],
                            left: squadformation[0]['GKl'],
                            ),
                        //deffence
                        //LB
                        buildPositionedPlayer(
                            bottm: squadformation[0]['CB4b'],
                            left: squadformation[0]['CB4l'],
                            ),
                        //CB5
                        buildPositionedPlayer(
                            bottm: squadformation[0]['CB5b'],
                            left:squadformation[0]['CB5l'],
                           ),
                        //CB4
                        buildPositionedPlayer(
                            bottm: 120,
                            right: 115,
                           ),
                        //RB
                        buildPositionedPlayer(
                            bottm:squadformation[0]['RBb'],
                            right:  squadformation[0]['RBl'],
                           ),
                        //MiddleField
                        //RMF
                        buildPositionedPlayer(
                            bottm: squadformation[0]['RMFb'],
                            right:  squadformation[0]['RMFl'],
                           ),
                        //CMF
                        buildPositionedPlayer(
                            bottm:squadformation[0]['CMFb'],
                            right: squadformation[0]['CMFl'],
                           ),
                        //LMF
                        buildPositionedPlayer(
                            bottm: squadformation[0]['LMFb'],
                            left: squadformation[0]['LMFl'],
                           ),

                        //Forward
                        //RWF
                        buildPositionedPlayer(
                            top:squadformation[0]['RWFb'],
                            right:squadformation[0]['RWFl'],
                        ),
                        //CF
                        buildPositionedPlayer(
                            top: squadformation[0]['CFb'],
                            right:squadformation[0]['CFl'],
                           ),

                        //LWF
                        buildPositionedPlayer(
                            top: squadformation[0]['LWFb'],
                            left:  squadformation[0]['LWFl'],
                           ),
                      ],
                    ),
                  ),
                );
              } else {
                /* lista = List<Player>();
                for (var i = 0; i < 12; i++) {
                  
                  lista.add(new Player.dummy());
                  
                }*/
                lista = snapshot.data;
                // selectedSquad = new Squad.main433(list11Players: snapshot.data);
                selectedSquad = new Squad.main433(list11Players: lista);

                return Align(alignment: Alignment.topCenter,
                  child: Container(
                     width: 380,
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
                            bottm: squadformation[0]['GKb'],
                            left: squadformation[0]['GKl'],
                            playerCandidate: selectedSquad.pGK),
                        //deffence
                        //LB
                        buildPositionedPlayer(
                            bottm: squadformation[0]['CB4b'],
                            left: squadformation[0]['CB4l'],
                            playerCandidate:
                                selectedSquad.pLB ?? new Player.dummy()),
                        //CB5
                        buildPositionedPlayer(
                            bottm: squadformation[0]['CB5b'],
                            left:squadformation[0]['CB5l'],
                            playerCandidate:
                                selectedSquad.pCB5 ?? new Player.dummy()),
                        //CB4
                        buildPositionedPlayer(
                            bottm: 120,
                            right: 115,
                            playerCandidate:
                                selectedSquad.pCB4 ?? new Player.dummy()),
                        //RB
                        buildPositionedPlayer(
                            bottm:squadformation[0]['RBb'],
                            right:  squadformation[0]['RBl'],
                            playerCandidate:
                                selectedSquad.pRB ?? new Player.dummy()),
                        //MiddleField
                        //RMF
                        buildPositionedPlayer(
                            bottm: squadformation[0]['RMFb'],
                            right:  squadformation[0]['RMFl'],
                            playerCandidate:
                                selectedSquad.pRMF ?? new Player.dummy()),
                        //CMF
                        buildPositionedPlayer(
                            bottm:squadformation[0]['CMFb'],
                            right: squadformation[0]['CMFl'],
                            playerCandidate:
                                selectedSquad.pCMF ?? new Player.dummy()),
                        //LMF
                        buildPositionedPlayer(
                            bottm: squadformation[0]['LMFb'],
                            left: squadformation[0]['LMFl'],
                            playerCandidate:
                                selectedSquad.pLMF ?? new Player.dummy()),

                        //Forward
                        //RWF
                        buildPositionedPlayer(
                            top:squadformation[0]['RWFb'],
                            right:squadformation[0]['RWFl'],
                            playerCandidate:
                                selectedSquad.pRWF ?? new Player.dummy()),
                        //CF
                        buildPositionedPlayer(
                            top: squadformation[0]['CFb'],
                            right:squadformation[0]['CFl'],
                            playerCandidate:
                                selectedSquad.pCF ?? new Player.dummy()),

                        //LWF
                        buildPositionedPlayer(
                            top: squadformation[0]['LWFb'],
                            left:  squadformation[0]['LWFl'],
                            playerCandidate:
                                selectedSquad.pLWF ?? new Player.dummy()),
                      ],
                    ),
                  ),
                );
              }
            }));
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
        height: 80,
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
                    isAccepted = true;
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

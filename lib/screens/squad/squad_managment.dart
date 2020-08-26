import 'package:EJI/models/player.dart';
import 'package:EJI/repository/cloud_database.dart';
import 'package:EJI/screens/admin_access/admin_drawer.dart';
import 'package:EJI/screens/squad/deffensive_formation.dart';
import 'package:EJI/screens/squad/main_formation.dart';
import 'package:EJI/screens/squad/offensive_formation.dart';
import 'package:EJI/settings/params.dart';
import 'package:EJI/shared/drawer_main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SquadManagmentTab extends StatefulWidget {
  SquadManagmentTab({Key key}) : super(key: key);

  @override
  _SquadManagmentTabState createState() => _SquadManagmentTabState();
}

class _SquadManagmentTabState extends State<SquadManagmentTab> {
  final TextEditingController codeControler = TextEditingController();

  final CloudDatabase c = Get.put(CloudDatabase());

  List<Player> listino;
  int selection = 0;
  bool isDataAvailable = false;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: StreamBuilder(
          stream: c.getPlayerz('players'),
          builder: (context, AsyncSnapshot<List<Player>> snapshot) {
            if (snapshot.hasError || !snapshot.hasData) {
            } else
              listino = snapshot.data;
            return Scaffold(
              drawer: c.isAdmin.value ? AdminDrawer() : MyDrawer(),
              appBar: AppBar(
                elevation: 0,
                bottom: TabBar(
                  tabs: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('4-3-3'.tr,
                          style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w600,
                              color: secondaryColor)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('4-4-2'.tr,
                          style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w600,
                              color: secondaryColor)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('4-2-3-1'.tr,
                          style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w600,
                              color: secondaryColor)),
                    ),
                  ],
                ),
              ),
              body: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  listino == null
                      ? new MainFormation()
                      : new MainFormation(
                          selectedSquad: listino,
                        ),
                  new Deffensive(),
                  new Offenssive(),
                ],
              ),
            );
          }),
    );
  }
}

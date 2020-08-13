import 'package:EJI/repository/cloud_database.dart';
import 'package:EJI/screens/admin_access/admin_drawer.dart';
import 'package:EJI/screens/common/junior_playerlist.dart';
import 'package:EJI/screens/public/player_list.dart';
import 'package:EJI/settings/params.dart';
import 'package:EJI/shared/drawer_main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlayersList extends StatelessWidget {
  PlayersList({Key key}) : super(key: key);

  final TextEditingController codeControler = TextEditingController();
  final CloudDatabase c = Get.put(CloudDatabase());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: c.isAdmin.value ? AdminDrawer() : MyDrawer(),
        appBar: AppBar(
          
          elevation: 0,
          bottom: TabBar(
            tabs: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Seniors'.tr, style: maintext3),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Juniors'.tr, style: maintext3),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SeniorPlayerList(),
            JuniorPlayerList(),
          ],
        ),
      ),
    );
  }
}
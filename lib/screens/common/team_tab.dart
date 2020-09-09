import 'package:EJI/repository/cloud_database.dart';
import 'package:EJI/screens/common/matches_page.dart';

import 'package:EJI/screens/common/player_list.dart';
import 'package:EJI/settings/params.dart';
import 'package:EJI/shared/drawer_main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'training_list.dart';

class TeamTab extends StatelessWidget {
  TeamTab({Key key}) : super(key: key);

  final TextEditingController codeControler = TextEditingController();
  final CloudDatabase c = Get.put(CloudDatabase());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: secondaryColor,
        drawer: MyDrawer(),
        appBar: AppBar(
          elevation: 0,
          bottom: TabBar(
            tabs: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('المباريات',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                        color: fontColor)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('التداريب',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                        color: fontColor)),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            MatchesPage(),
            TrainingList(),
          ],
        ),
      ),
    );
  }
}

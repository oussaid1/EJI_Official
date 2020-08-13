import 'package:EJI/repository/cloud_database.dart';
import 'package:EJI/screens/admin_access/admin_drawer.dart';
import 'package:EJI/screens/common/add_anounce.dart';
import 'package:EJI/screens/common/announces_screen.dart';
import 'package:EJI/screens/common/team_home.dart';
import 'package:EJI/settings/params.dart';
import 'package:EJI/shared/drawer_main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnouncesTab extends StatelessWidget {
  AnouncesTab({Key key}) : super(key: key);

  final TextEditingController codeControler = TextEditingController();
  final CloudDatabase c = Get.put(CloudDatabase());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: c.isAdmin.value ? AdminDrawer() : MyDrawer(),
        appBar: AppBar(
          actions: [
             c.isAdmin.value? IconButton(
              icon: Icon(
                Icons.add_comment,
                color: secondaryColor,
              ),
              onPressed: () {
                Get.defaultDialog(
                  backgroundColor: Colors.blue[100],
                  title: ('Anounces'.tr),
                  middleText: '',
                  content: AddAnounce(),
                );
              } // Get.to(AddComment()),
              ): Container(),
          ],
          elevation: 0,
          bottom: TabBar(
            tabs: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Matches'.tr, style: maintext3),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Anounces'.tr, style: maintext3),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            TeamHomePage(),
            AnouncesScreen(),
          ],
        ),
      ),
    );
  }
}

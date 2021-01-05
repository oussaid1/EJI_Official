import 'package:EJI/repository/cloud_database.dart';
import 'package:EJI/screens/common/announces_screen.dart';
import 'package:EJI/screens/common/matches_page.dart';
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
        drawer: MyDrawer(),
        appBar: AppBar(
          elevation: 0,
          bottom: TabBar(
            tabs: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Matches'.tr,
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                        color: secondaryColor)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Anounces'.tr,
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                        color: secondaryColor)),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            MatchesPage(),
            AnouncesScreen(),
          ],
        ),
      ),
    );
  }
}

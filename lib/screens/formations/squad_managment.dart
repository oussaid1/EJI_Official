import 'package:EJI/controllers/variables_controler.dart';
import 'package:EJI/repository/cloud_database.dart';
import 'package:EJI/screens/admin_access/admin_drawer.dart';
import 'package:EJI/settings/params.dart';
import 'package:EJI/shared/drawer_main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SquadManagmentTab extends StatelessWidget {
  SquadManagmentTab({Key key}) : super(key: key);

  final TextEditingController codeControler = TextEditingController();
  final CloudDatabase db = (CloudDatabase());
  final VariablesControler varController = Get.put(VariablesControler());
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: varController.isAdmin.value ? AdminDrawer() : MyDrawer(),
        appBar: AppBar(
          elevation: 0,
          bottom: TabBar(
            tabs: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('BuildSquad'.tr,
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                        color: secondaryColor)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Formations'.tr,
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                        color: secondaryColor)),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [],
        ),
      ),
    );
  }
}

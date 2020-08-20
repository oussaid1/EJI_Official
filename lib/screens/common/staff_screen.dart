import 'package:EJI/model/staff.dart';
import 'package:EJI/repository/cloud_database.dart';
import 'package:EJI/screens/admin_access/admin_drawer.dart';
import 'package:EJI/settings/params.dart';
import 'package:EJI/shared/drawer_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class StaffPage extends StatelessWidget {
  final CloudDatabase c = Get.put(CloudDatabase());

  Staff staff;

  Widget _buildPresident() {
    return Container(
      width: Get.width - 60,
      decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: secondaryColor, width: 0.5)),
      height: Get.height / 7.3,
      child: new Image.asset(
        'assets/images/president.png',
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _buildTechnicalStuff() {
    return Container(
      decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: secondaryColor, width: 0.5)),
      child: new Image.asset(
        'assets/images/technicalstaff.png',
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _buildCouncellors() {
    return Container(
      decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: secondaryColor, width: 0.5)),
      child: new Image.asset(
        'assets/images/councellors.png',
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _buildDirectory() {
    return Container(
      decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: secondaryColor, width: 0.5)),
      child: new Image.asset(
        'assets/images/adminstaff.png',
        fit: BoxFit.contain,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: c.isAdmin.value ? AdminDrawer() : MyDrawer(),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('2019-2021',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w100,
                    color: fontColor)),
            Text('EJI Staff'.tr,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: fontColor)),
          ],
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/ejisplash.jpg',
            fit: BoxFit.fill,
          ),
          Center(
            child: ListView(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'CurrentSituation'.tr,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: fontColor),
                      textAlign: TextAlign.center,
                    ),
                    Text('2019-2022',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w200,
                            color: fontColor)),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildPresident(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _buildDirectory(),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _buildTechnicalStuff(),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _buildCouncellors(),
                ),
                SizedBox(
                  height: 60,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

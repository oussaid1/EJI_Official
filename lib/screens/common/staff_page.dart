import 'package:EJI/repository/cloud_database.dart';
import 'package:EJI/screens/admin_access/add_picture_archive.dart';
import 'package:EJI/screens/common/ahdath_screen.dart';
import 'package:EJI/screens/common/eji_law.dart';
import 'package:EJI/screens/common/info_screen.dart';
import 'package:EJI/screens/common/staff_screen.dart';
import 'package:EJI/settings/params.dart';
import 'package:EJI/shared/drawer_main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StaffPage extends StatefulWidget {
  @override
  _StaffPageState createState() => _StaffPageState();
}

class _StaffPageState extends State<StaffPage> {
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  final c = Get.put(CloudDatabase());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: c.isAdmin.value
          ? FloatingActionButton(
              child: Icon(Icons.add_a_photo),
              onPressed: () => Get.off(AddArPicture()))
          : new Container(),
      drawer: MyDrawer(),
      key: _scaffoldKey,
      backgroundColor: primaryColor,
      body: Stack(
        children: [
          Positioned(
            top: 10,
            left: 1,
            height: 240,
            child: Container(
              width: Get.width - 2,
              child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  child: Image.asset('assets/images/adminstaff.png',
                      fit: BoxFit.fill)),
            ),
          ),
          Positioned(
            top: 40,
            left: 10,
            child: Container(
              width: 50,
              child: IconButton(
                onPressed: () => _scaffoldKey.currentState.openDrawer(),
                icon: Icon(
                  Icons.menu,
                  color: primaryColor,
                  size: 30,
                ),
              ),
            ),
          ),
          Positioned(
            top: Get.height / 4,
            left: 10,
            width: Get.width - 20,
            height: 300,
            child: Container(
              height: 160,
              decoration: BoxDecoration(
                border: Border.all(color: secondaryColor),
                borderRadius: BorderRadius.circular(10.0),
                color: const Color(0xff101a24).withOpacity(0.8),
                boxShadow: [],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'الشؤون الإدارية للفريق',
                        style: TextStyle(
                          fontFamily: 'Courier New',
                          fontSize: 14,
                          color: secondaryColor,
                          fontStyle: FontStyle.italic,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'ادارة الفريق',
                        style: TextStyle(
                          fontFamily: 'Courier New',
                          fontSize: 28,
                          color: const Color(0xff17bcb5),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: FlatButton(
                      onPressed: () => Get.to(Staff()),
                      child: Text(
                        'هيكلة المكتب ',
                        style: TextStyle(
                          fontFamily: 'Courier New',
                          fontSize: 20,
                          color: whitefontColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Text(
                    'الرئيس - الطاقم الإداري -الطاقم التقني - المستشارون',
                    style: TextStyle(
                      fontFamily: 'Courier New',
                      fontSize: 14,
                      color: secondaryColor,
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: FlatButton(
                      onPressed: () => Get.to(AhdathScreen()),
                      child: Text(
                        'البرامج والاهداف ',
                        style: TextStyle(
                          fontFamily: 'Courier New',
                          fontSize: 20,
                          color: whitefontColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Text(
                    'البرامج والاهداف التي يسطرها الكتب و التي يشتغل عليها ',
                    style: TextStyle(
                      fontFamily: 'Courier New',
                      fontSize: 14,
                      color: secondaryColor,
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 80,
            width: Get.width - 20,
            height: 160,
            left: 10,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: secondaryColor),
                borderRadius: BorderRadius.circular(10.0),
                color: const Color(0xff101a24),
                boxShadow: [],
              ),
              child: Column(
                children: [
                  Text(
                    'الوثائق ',
                    style: TextStyle(
                      fontFamily: 'Courier New',
                      fontSize: 28,
                      color: const Color(0xff17bcb5),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 2.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            IconButton(
                                icon: Icon(
                                  Icons.info,
                                  color: secondaryColor,
                                ),
                                onPressed: null),
                            FlatButton(
                              onPressed: () {
                                AboutDialog(
                                  applicationIcon: Image.asset(
                                    'assets/images/ejilogo.png',
                                    width: 20,
                                    height: 20,
                                    fit: BoxFit.contain,
                                  ),
                                );
                              },
                              child: Text(
                                'حول التطبيق',
                                style: TextStyle(
                                  fontFamily: 'Courier New',
                                  fontSize: 16,
                                  color: secondaryColor,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: FlatButton(
                                onPressed: () => Get.to(EJILawScreen()),
                                child: Text(
                                  'القانون الأساسي للفريق',
                                  style: TextStyle(
                                    fontFamily: 'Courier New',
                                    fontSize: 16,
                                    color: whitefontColor,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: FlatButton(
                                onPressed: () => Get.to(InfoScreen()),
                                child: Text(
                                  'فلسفة الفريق',
                                  style: TextStyle(
                                    fontFamily: 'Courier New',
                                    fontSize: 16,
                                    color: whitefontColor,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

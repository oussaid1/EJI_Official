import 'package:EJI/repository/cloud_database.dart';
import 'package:EJI/screens/common/announces_screen.dart';
import 'package:EJI/screens/common/comments_screen.dart';
import 'package:EJI/settings/params.dart';
import 'package:EJI/shared/drawer_main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommunicationsPage extends StatefulWidget {
  @override
  _CommunicationsPageState createState() => _CommunicationsPageState();
}

class _CommunicationsPageState extends State<CommunicationsPage> {
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  final CloudDatabase cD = Get.put(CloudDatabase());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MyDrawer(),
        key: _scaffoldKey,
        backgroundColor: primaryColor,
        body: StreamBuilder(
            stream: null,
            builder: (context, snapshot) {
              return Stack(children: [
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
                        child: Image.asset('assets/images/finance.png',
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
                new Positioned(
                  top: 260,
                  width: Get.width - 20,
                  left: 10,
                  height: 300,
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      border: Border.all(color: secondaryColor),
                      borderRadius: BorderRadius.circular(10.0),
                      color: const Color(0xff101a24),
                      boxShadow: [],
                    ),
                    child: Column(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'سبورة الفريق',
                              style: TextStyle(
                                fontFamily: 'Amiri',
                                fontSize: 28,
                                color: const Color(0xff17bcb5),
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              'إعلانات واقتراحات و ملاحظات',
                              style: TextStyle(
                                fontFamily: 'Courier New',
                                fontSize: 14,
                                color: secondaryColor,
                                fontStyle: FontStyle.italic,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        FlatButton(
                          onPressed: () => Get.to(AnouncesScreen()),
                          child: Text(
                            'إعلانات ',
                            style: TextStyle(
                              fontFamily: 'Courier New',
                              fontSize: 20,
                              color: whitefontColor,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Text(
                          'اعلانات المكتب المسير للفريف ، للاعبين ، والعامة ... ',
                          style: TextStyle(
                            fontFamily: 'Courier New',
                            fontSize: 16,
                            color: secondaryColor,
                            fontStyle: FontStyle.italic,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        FlatButton(
                          onPressed: () => Get.to(CommentScreen()),
                          child: Text(
                            'اقتراحات و ملاحظات',
                            style: TextStyle(
                              fontFamily: 'Courier New',
                              fontSize: 20,
                              color: whitefontColor,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Text(
                          'يحق لكل منخرط اولاعب او غيرهما الادلاء باقتراحاته ونلاحظاته للفريق والمسيرين .ويتم الإجابة عليها من قبل المكتب .  ',
                          style: TextStyle(
                            fontFamily: 'Courier New',
                            fontSize: 14,
                            color: secondaryColor,
                            fontStyle: FontStyle.italic,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                )
              ]);
            }));
  }
}

import 'package:EJI/models/club_expenses.dart';
import 'package:EJI/repository/auth/auth_controler.dart';
import 'package:EJI/screens/common/ahdath_screen.dart';
import 'package:EJI/screens/common/picture_archive_list.dart';
import 'package:EJI/screens/common/anounces_tab.dart';
import 'package:EJI/screens/common/playerlist_tab.dart';
import 'package:EJI/screens/admin_access/club_transactions.dart';
import 'package:EJI/screens/common/comments_screen.dart';
import 'package:EJI/screens/common/eji_law.dart';
import 'package:EJI/screens/common/info_screen.dart';
import 'package:EJI/screens/common/staff_page.dart';
import 'package:EJI/screens/common/staff_screen.dart';
import 'package:EJI/screens/squad/main_formation.dart';
import 'package:EJI/settings/params.dart';
import 'package:flutter/cupertino.dart';
import 'package:EJI/repository/cloud_database.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class MyDrawer extends StatefulWidget {
  MyDrawer({Key key}) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final String image = "players/profileImages/ejilogo.png";
final AuthController authController= Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: Container(
          color: secondaryColor,
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName:
                       Text("EJI Idawlstane"),
                accountEmail:  Text(
                        'EJIBudget'.tr,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: accentColor),
                      ),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: secondaryColor,
                  child: Image.asset(
                    'assets/images/ejilogo.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.people),
                title: Text('Matches&Anounces'.tr),
                onTap: () => Get.to(AnouncesTab()),
              ),
              ListTile(
                leading: Icon(FontAwesomeIcons.list),
                //subtitle: Text('teamManagersub'.tr),
                subtitle: Text('AltimteSquadsub'.tr),
                title: Text('AltimteSquad'.tr),

                onTap: () {
                  Get.off(MainFormation());
                },
              ),
              ListTile(
                subtitle: Text('PlayersListsub'.tr),
                leading: Icon(Icons.people),
                title: Text('PlayersList'.tr),
                onTap: () => Get.to(PlayersList()),
              ),
              ListTile(
                leading: Icon(Icons.comment),
                title: Text('Comments'.tr),
                onTap: () => Get.to(CommentScreen()),
              ),
              ListTile(
                  leading: Icon(Icons.event),
                  title: Text('ProgramsAndEvents'.tr),
                  onTap: () => {
                        Get.to(AhdathScreen()),
                      }),
              ListTile(
                  leading: Icon(Icons.store),
                  title: Text('Staff'.tr),
                  onTap: () => {
                        Get.to(StaffPage()),
                      }),
              ListTile(
                leading: Icon(Icons.comment),
                title: Text('PictureArchive'.tr),
                onTap: () => Get.to(PicturesArchiveList()),
              ),
              ListTile(
                leading: Icon(FontAwesomeIcons.chartLine),
                title: Text('ClubTransactions'.tr),
                onTap: () => Get.to(ClubTransactions()),
              ),
              ListTile(
                leading: Icon(Icons.info),
                title: Text('EJIRegulations'.tr),
                onTap: () => Get.to(EJILawScreen()),
              ),
              ListTile(
                leading: Icon(Icons.info),
                title: Text('AboutEJI'.tr),
                onTap: () => Get.to(InfoScreen()),
              ),
              ListTile(
                subtitle: Text('SignOutsub'.tr),
                leading: Icon(Icons.exit_to_app),
                title: Text('SignOut'.tr),
                onTap: () => authController.signOut(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

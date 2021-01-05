// ignore: unused_import
import 'package:EJI/models/finance/club_expenses.dart';
import 'package:EJI/controllers/auth_controler.dart';
import 'package:EJI/screens/add/add_match.dart';
import 'package:EJI/screens/common/picture_archive_list.dart';
import 'package:EJI/screens/tabs/anounces_tab.dart';
import 'package:EJI/screens/common/playerlist_tab.dart';
import 'package:EJI/screens/tabs/club_transactions.dart';
import 'package:EJI/screens/common/comments_screen.dart';
import 'package:EJI/screens/common/eji_law.dart';
import 'package:EJI/screens/common/info_screen.dart';
import 'package:EJI/screens/common/ahdath_screen.dart';
import 'package:EJI/screens/squad/main_formation.dart';
import 'package:EJI/settings/params.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class AdminDrawer extends StatefulWidget {
  AdminDrawer({Key key}) : super(key: key);

  @override
  _AdminDrawerState createState() => _AdminDrawerState();
}

class _AdminDrawerState extends State<AdminDrawer> {
  final String image = "players/profileImages/ejilogo.png";

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
            children: [
              UserAccountsDrawerHeader(
                accountName:  Text(
                        "EJI Idawlstane",
                        style: TextStyle(color: fontColor),
                      ),

                accountEmail: Text(
                        'EJIBudget'.tr ,
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
                subtitle: Text('Matches&Anounces'.tr),
                title: Text('managematches&Anounces'.tr),
                onTap: () => Get.to(AnouncesTab()),
              ),
              ListTile(
                leading: Icon(FontAwesomeIcons.list),
                subtitle: Text('teamManagersub'.tr),
                title: Text('teamManager'.tr),
                onTap: () {
                  Get.off(MainFormation());
                },
              ),
              ListTile(
                leading: Icon(Icons.people),
                subtitle: Text('PlayersListsub'.tr),
                title: Text('PlayersList'.tr),
                onTap: () => Get.to(PlayersList()),
              ),
              ListTile(
                leading: Icon(Icons.comment),
                title: Text('PictureArchive'.tr),
                onTap: () => Get.to(PicturesArchiveList()),
              ),
              ListTile(
                  leading: Icon(Icons.store),
                  title: Text('Staff'.tr),
                  onTap: () => {

                      }),
              ListTile(
                  leading: Icon(Icons.event),
                  title: Text('ProgramsAndEvents'.tr),
                  onTap: () => {
                        Get.to(AhdathScreen()),
                      }),
              ListTile(
                leading: Icon(Icons.add_location),
                title: Text('AddMatch'.tr),
                subtitle: Text('AddMatch'.tr),
                onTap: () => Get.to(AddMatch()),
              ),
              ListTile(
                leading: Icon(Icons.attach_money),
                title: Text('ClubTransactions'.tr),
                subtitle: Text('Income and Spendings'.tr),
                onTap: () {
                  Get.to(
                    ClubTransactions(),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.comment),
                title: Text('Comments'.tr),
                onTap: () => Get.to(CommentScreen()),
              ),
              ListTile(
                leading: Icon(Icons.info),
                title: Text('EJIRegulations'.tr),
                onTap: () => Get.to(EJILawScreen()),
              ),
              ListTile(
                leading: Icon(Icons.info),
                title: Text('AboutEJI'.tr),
                subtitle: Text('AboutEJIsub'.tr),
                onTap: () => Get.to(InfoScreen()),
              ),
              ListTile(
                subtitle: Text('SignOutsub'.tr),
                leading: Icon(Icons.exit_to_app),
                title: Text('SignOut'.tr),
                onTap: () => AuthController().signOut(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

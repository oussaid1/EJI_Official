import 'package:EJI/screens/admin_access/add_dialogue.dart';
import 'package:EJI/screens/admin_access/add_match.dart';
import 'package:EJI/screens/admin_access/admin_playerlist_screen.dart';
import 'package:EJI/screens/admin_access/home_screen.dart';
import 'package:EJI/screens/common/info_screen.dart';
import 'package:EJI/screens/common/splash.dart';
import 'package:EJI/screens/common/team_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class AdminDrawer extends StatelessWidget {
  const AdminDrawer({Key key}) : super(key: key);
  final String image = "players/profileImages/logo.png";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("EJI Idawlstane"),
              accountEmail: Text("Eji.Idawlstan@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor:
                    Theme.of(context).platform == TargetPlatform.iOS
                        ? Colors.blue
                        : Colors.white,
                child: Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              subtitle: Text('teamsub'.tr),
              title: Text('team'.tr),
              onTap: () => Get.to(TeamHomePage()),
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.list),
              subtitle: Text('teamManagersub'.tr),
              title: Text('teamManager'.tr),
              onTap: () => Get.to(HomePage()),
            ),
            ListTile(
              leading: Icon(Icons.people),
              subtitle: Text('PlayersListsub'.tr),
              
              title: Text('PlayersList'.tr),
              onTap: () => Get.to(AdminPlayerList()),
            ),
            ListTile(
              
               leading: Icon(FontAwesomeIcons.personBooth),
                title: Text('Staff'.tr),
                subtitle: Text(
                  'Staffsub'.tr,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                trailing: Text(
                  'staffList'.tr,
                  style: TextStyle(fontSize: 14, color: Colors.red),
                ),
                onTap: () => {}),
            ListTile(
              leading: Icon(Icons.person_add),
              title: Text('AddPlayer'.tr),
              subtitle: Text('AddPlayersub'.tr),
              onTap: () => Get.to(AddPlayers()),
            ),
            ListTile(
              leading: Icon(Icons.person_add),
              title: Text('AddMatch'.tr),
              subtitle: Text('AddMatch'.tr),
              onTap: () => Get.to(AddMatch()),
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
              onTap: () => Get.to(SplashPage()),
            ),
          ],
        ),
      ),
    );
  }
}

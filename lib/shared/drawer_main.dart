import 'package:EJI/screens/common/info_screen.dart';
import 'package:EJI/screens/common/team_home.dart';
import 'package:EJI/screens/public/player_list.dart';
import 'package:EJI/screens/common/splash.dart';
import 'package:EJI/settings/params.dart';
import 'package:flutter/cupertino.dart';
import 'package:EJI/repository/cloud_database.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class MyDrawer extends StatelessWidget {
   MyDrawer({Key key}) : super(key: key);
  final String image = "players/profileImages/logo.png";
final CloudDatabase cD = Get.put(CloudDatabase());
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
              accountEmail:  Text(
                'EJIBudget'.tr + '${cD.clubBudget.value.toString()}',
                style: subtext4,
              ),
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
              leading: Icon(Icons.list),
              subtitle: Text('teamsub'.tr),
              title: Text('team'.tr),
              onTap: () => Get.to(TeamHomePage()),
            ),
            ListTile(
              subtitle: Text('PlayersListsub'.tr),
              leading: Icon(Icons.people),
              title: Text('PlayersList'.tr),
              onTap: () => Get.to(PlayerList()),
            ),
            ListTile(
              subtitle: Text('PlayerStatisticssub'.tr),
              leading: Icon(FontAwesomeIcons.chartLine),
              title: Text('PlayerStatistics'.tr),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(
                    Icons.star,
                    color: accentColor,size: 20,
                  ),
                  Icon(
                    Icons.star,size: 20,
                    color: accentColor,
                  ),
                  Icon(
                    Icons.star,size: 20,
                    color: accentColor,
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('AboutEJI'.tr),
              subtitle: Text(
                  'AboutEJIsub'.tr),
              onTap: () => Get.to(InfoScreen()),
            ),
            ListTile(
              subtitle: Text('SignOutsub'.tr),
              leading: Icon(Icons.exit_to_app),
              title: Text('SignOut'.tr),
              onTap: () => Get.offAll(SplashPage()),
            ),
          ],
        ),
      ),
    );
  }
}

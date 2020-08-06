import 'package:EJI/repository/repository.dart';
import 'package:EJI/screens/admin_access/add_dialogue.dart';
import 'package:EJI/screens/common/home_screen.dart';
import 'package:EJI/screens/common/info_screen.dart';
import 'package:EJI/screens/public/player_list.dart';
import 'package:EJI/screens/common/splash.dart';
import 'package:EJI/settings/params.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key key}) : super(key: key);
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
            FutureBuilder(
                future: FirestoreService.getProfileImage(context, image),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.connectionState != ConnectionState.done ||
                      !snapshot.hasData) {
                    return UserAccountsDrawerHeader(
                      accountName: Text("EJI Idawlstane"),
                      accountEmail: Text("Eji.Idawlstan@gmail.com"),
                      currentAccountPicture: CircleAvatar(
                          radius: 1,
                          backgroundColor:
                              Theme.of(context).platform == TargetPlatform.iOS
                                  ? Colors.blue
                                  : Colors.white,
                          child: CircularProgressIndicator()),
                    );
                  } else {
                    return UserAccountsDrawerHeader(
                      accountName: Text("EJI Idawlstane"),
                      accountEmail: Text("ashishrawat2911@gmail.com"),
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
                    );
                  }
                }),
            ListTile(
              leading: Icon(Icons.email),
              subtitle: Text('teamdetails'.tr),
              title: Text('Team'.tr),
              onTap: () => Get.to(HomePage()),
            ),
            ListTile(
              subtitle: Text(' players list and thier info'.tr),
              leading: Icon(Icons.person),
              title: Text('Players List'.tr),
              onTap: () => Get.to(PlayerList()),
            ),
            ListTile(
              subtitle: Text(' players statistics and thier rankings'.tr),
              leading: Icon(Icons.person_add),
              title: Text('Player Statistics'.tr),
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
              title: Text('About EJI'.tr),
              subtitle: Text(
                  'Information about EJI Team and Its Philosophy and Laws'.tr),
              onTap: () => Get.to(InfoScreen()),
            ),
            ListTile(
              subtitle: Text('sign out of the app'.tr),
              leading: Icon(Icons.exit_to_app),
              title: Text('Sign Out'.tr),
              onTap: () => Get.to(SplashPage()),
            ),
          ],
        ),
      ),
    );
  }
}

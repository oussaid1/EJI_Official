import 'package:EJI/controllers/auth_controler.dart';
import 'package:EJI/screens/common/communications.dart';
import 'package:EJI/screens/common/info_screen.dart';
import 'package:EJI/screens/common/players_page.dart';
import 'package:EJI/screens/common/staff_page.dart';
import 'package:EJI/screens/common/team_page.dart';
import 'package:EJI/screens/common/transactions_page.dart';
import 'package:EJI/settings/params.dart';
import 'package:flutter/cupertino.dart';
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
  final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: Container(
          color: secondaryColor,
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("EJI Idawlstane"),
                accountEmail: Text(
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
                leading: Icon(FontAwesomeIcons.trophy),
                title: Text('الفريق'),
                onTap: () => Get.to(
                  TeamPage(),
                ),
              ),
              ListTile(
                leading: Icon(FontAwesomeIcons.peopleCarry),
                title: Text('اللاعبين'),
                onTap: () => Get.to(PlayersPage()),
              ),
              ListTile(
                leading: Icon(FontAwesomeIcons.dollarSign),
                title: Text('خزينة الفريق'),
                onTap: () => Get.to(FinancePage()),
              ),
              ListTile(
                leading: Icon(FontAwesomeIcons.connectdevelop),
                title: Text(' التواصل'),
                onTap: () => Get.to(CommunicationsPage()),
              ),
              ListTile(
                leading: Icon(FontAwesomeIcons.home),
                title: Text('ادارة الفريق'),
                onTap: () => Get.to(StaffPage()),
              ),
              ListTile(
                leading: Icon(Icons.info),
                title: Text('AboutEJI'.tr),
                onTap: () => Get.to(InfoScreen()),
              ),
              Container(
                color: Colors.redAccent.withOpacity(0.6),
                child: ListTile(
                  subtitle: Text('SignOutsub'.tr),
                  leading: Icon(Icons.exit_to_app),
                  title: Text('SignOut'.tr),
                  onTap: () => authController.signOut(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

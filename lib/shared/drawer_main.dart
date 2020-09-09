import 'package:EJI/models/club_expenses.dart';
import 'package:EJI/repository/auth/auth_controler.dart';
import 'package:EJI/screens/common/info_screen.dart';
import 'package:EJI/screens/common/players_page.dart';
import 'package:EJI/screens/common/staff_page.dart';
import 'package:EJI/screens/common/team_page.dart';
import 'package:EJI/screens/common/transactions_page.dart';
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
  final CloudDatabase cD = Get.put(CloudDatabase());
  final AuthController dx = Get.put(AuthController());

  List<ClubSpendings> clubSpendings;

  List<ClubIncome> clubIncome;

  double d = 0;

  double c = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
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
                accountName: StreamBuilder(
                    stream: cD.getClubSpendings(),
                    builder:
                        (context, AsyncSnapshot<List<ClubSpendings>> snapshot) {
                      if (!snapshot.hasData || snapshot.hasError) {
                        return Text("EJI Idawlstane");
                      } else
                        clubSpendings = snapshot.data;
                      d = cD
                          .setBudget(ClubSpendings.getSpendings(clubSpendings));
                      return Text("EJI Idawlstane");
                    }),
                accountEmail: StreamBuilder(
                    stream: cD.getClubIncomes(),
                    builder:
                        (context, AsyncSnapshot<List<ClubIncome>> snapshot) {
                      if (!snapshot.hasData || snapshot.hasError) {
                        return Text(
                          'EJIBudget'.tr + 'DH ' + '-- ',
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: accentColor),
                        );
                      } else
                        clubIncome = snapshot.data;
                      c = ClubIncome.getIncome(clubIncome);

                      return Text(
                        'EJIBudget'.tr + 'DH ' '${(c - d).toString()} ',
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: accentColor),
                      );
                    }),
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
                leading: Icon(FontAwesomeIcons.home),
                title: Text('ادارة الفريق'),
                onTap: () => Get.to(StaffPage()),
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
                onTap: () => dx.signOut(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

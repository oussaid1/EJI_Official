import 'package:EJI/model/club_expenses.dart';
// ignore: unused_import
import 'package:EJI/model/player.dart';
import 'package:EJI/repository/cloud_database.dart';
import 'package:EJI/screens/admin_access/add_match.dart';
import 'package:EJI/screens/admin_access/picture_archive_list.dart';
import 'package:EJI/screens/common/anounces_tab.dart';
import 'package:EJI/screens/common/player_ranking.dart';
import 'package:EJI/screens/common/playerlist_tab.dart';
import 'package:EJI/screens/admin_access/club_transactions.dart';
import 'package:EJI/screens/admin_access/home_screen.dart';
import 'package:EJI/screens/common/comments_screen.dart';
import 'package:EJI/screens/common/eji_law.dart';
import 'package:EJI/screens/common/info_screen.dart';
import 'package:EJI/screens/common/splash.dart';
import 'package:EJI/screens/common/staff_screen.dart';
import 'package:EJI/screens/public/ahdath_screen.dart';
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
  final String image = "players/profileImages/logo.png";

  final CloudDatabase cD = Get.put(CloudDatabase());

  List<ClubSpendings> clubSpendings;

  List<ClubIncome> clubIncome;

  double d = 0;

  double c = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: StreamBuilder(
                  stream: cD.getClubSpendings('ClubSpendings'),
                  builder:
                      (context, AsyncSnapshot<List<ClubSpendings>> snapshot) {
                    if (!snapshot.hasData || snapshot.hasError) {
                      return Text("EJI Idawlstane");
                    } else
                      clubSpendings = snapshot.data;
                    d = cD.setBudget(ClubSpendings.getSpendings(clubSpendings));
                    return Text("EJI Idawlstane",style: TextStyle(color:fontColor),);
                  }),
              accountEmail: StreamBuilder(
                  stream: cD.getClubIncomes('ClubIncome'),
                  builder: (context, AsyncSnapshot<List<ClubIncome>> snapshot) {
                    if (!snapshot.hasData || snapshot.hasError) {
                      return Text(
                        'EJIBudget'.tr + 'DH ' + '-- ',
                        textDirection: TextDirection.rtl,
                        style: TextStyle(fontSize:18,fontWeight: FontWeight.w400,color: accentColor),
                      );
                    } else
                      clubIncome = snapshot.data;
                    c = ClubIncome.getIncome(clubIncome);

                    return Text(
                      'EJIBudget'.tr + 'DH ' '${(c - d).toString()} ',
                      textDirection: TextDirection.rtl,
                      style: TextStyle(fontSize:18,fontWeight: FontWeight.w400,color: accentColor),
                    );
                  }),
              currentAccountPicture: CircleAvatar(
                backgroundColor:
                    Theme.of(context).platform == TargetPlatform.iOS
                        ? Colors.blue
                        : fontColor,
                child: Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.fill,
                ),
              ),
              otherAccountsPictures: [
                //     Text('Sign-Out',style: TextStyle(fontSize:18,fontWeight: FontWeight.w400,color: fontColor),),
                //    IconButton(icon: Icon(FontAwesomeIcons.powerOff, size: 24,color: secondaryColor,), onPressed: (){}),
              ],
            ),
            Expanded(
              child: ListView(
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: <Widget>[
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
                      Get.to(HomePage());
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
                            Get.to(StaffPage()),
                          }),
                  ListTile(
                      leading: Icon(Icons.store),
                      title: Text('ProgramsAndEvents'.tr),
                      onTap: () => {
                            Get.to(AhdathScreen()),
                          }),
                  ListTile(
                    leading: Icon(FontAwesomeIcons.chartLine),
                    title: Text('PlayerStatistics'.tr),
                    subtitle: Text('PlayerStatisticssub'.tr),
                    onTap: () => Get.to(PlayerRanking()),
                  ),
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
                    onTap: () => Get.offAll(SplashPage()),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

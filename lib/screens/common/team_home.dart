import 'package:EJI/controllers/variables_controler.dart';
import 'package:EJI/models/team/matchday.dart';
import 'package:EJI/repository/cloud_database.dart';
import 'package:EJI/screens/add/add_match.dart';
import 'package:EJI/screens/common/match_details.dart';
import 'package:EJI/settings/params.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class TeamHomePage extends StatefulWidget {
  TeamHomePage({Key key}) : super(key: key);

  @override
  _TeamHomePageState createState() => _TeamHomePageState();
}

class _TeamHomePageState extends State<TeamHomePage> {
  List<MatchDay> lista;

  bool isSwitched = false;
  final CloudDatabase db = (CloudDatabase());
  final VariablesControler varController = Get.put(VariablesControler());
  bool isEconomicMode;
  double limit = 400;
  GetStorage mBox = GetStorage();
  @override
  void initState() {
//mBox.write('adminkey',false).then((value) => isAdmin= mBox != null ? mBox.read('adminkey') :true);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: [
        new Image.asset('assets/images/login.png', fit: BoxFit.fill),
        StreamBuilder(
            stream: db.getMatchDays('matchday'),
            builder:
                (BuildContext context, AsyncSnapshot<List<MatchDay>> snapshot) {
              if (snapshot.hasError || !snapshot.hasData) {
                return Center(
                    child: Icon(
                  Icons.list,
                  size: 100,
                  color: secondaryColor,
                ));
              } else {
                lista = snapshot.data;
              }

              return ListView.builder(
                itemCount: lista.length != 0 ? lista.length : 0,
                itemBuilder: (BuildContext context, int index) {
                  MatchDay matchDay = lista[index];
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Container(
                      height: 144,
                      child: Card(
                        margin: EdgeInsets.fromLTRB(8, 2, 8, 2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        color: primaryColor.withOpacity(0.6),
                        child: Column(
                          children: <Widget>[
                            Text(
                                'MatchDay'.tr +
                                    '${matchDay.matchdayDate.toString()}',
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w400,
                                    color: whitefontColor)),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                        '${matchDay.matchdayHome.toString()}',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                            color: accentColor)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: 74,
                                    decoration: BoxDecoration(
                                        color: secondaryColor.withOpacity(0.8),
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            color: secondaryColor, width: 0.5)),
                                    child: Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: matchDay.matchdayType.trim() !=
                                                    'مباراة مبرمجة'
                                                        .toString() ||
                                                matchDay.matchdayType.trim() !=
                                                    'Schedueled'
                                                        .tr
                                                        .trim()
                                                        .toString()
                                            ? Text(
                                                '${matchDay.matchdayHomeScore.toString()}' +
                                                    ' : ' +
                                                    '${matchDay.matchdayAwayScore.toString()}',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w400,
                                                    color: orange))
                                            : Text('--' + ' : ' + '--',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w400,
                                                    color: orange))),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                        '${matchDay.matchdayAway.toString()}',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                            color: accentColor)),
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      varController.isAdmin.value
                                          ? IconButton(
                                              icon: Icon(
                                                Icons.edit,
                                                color: secondaryColor,
                                              ),
                                              onPressed: () {
                                                Get.to(AddMatch(
                                                  matchDay: matchDay,
                                                  matchDayIndex: matchDay.id,
                                                ));
                                              })
                                          : SizedBox(width: 1, height: 1),
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(
                                          '${matchDay.matchdayType.toString()}',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400,
                                              color: fontColor),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text('MatchType'.tr,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w200,
                                                color: fontColor)),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            4, 4, 4, 4),
                                        child: Text('MatchDetails'.tr,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w200,
                                                color: fontColor)),
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.info),
                                        color: secondaryColor,
                                        onPressed: () {
                                          Get.to(
                                              MatchDetails(matchDay: matchDay));
                                        },
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
                  );
                },
              );
            }),
      ],
    ));
  }
}

import 'package:EJI/model/matchday.dart';
import 'package:EJI/repository/cloud_database.dart';
import 'package:EJI/screens/admin_access/admin_drawer.dart';
import 'package:EJI/settings/params.dart';
import 'package:EJI/shared/drawer_main.dart';
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
  List<MatchDay> lista = [
    new MatchDay(
        id: 'id',
        matchdayDate: 'matchdaydate',
        matchdayType: 'matchdaytype',
        matchdayReferee: 'matchdayreferee',
        matchdayHome: 'matchdayhome',
        matchdayAway: 'matchdayaway',
        matchdayHomeScore: 'matchdayhomescore',
        matchdayAwayScore: 'matchdayawayscore',
        matchdayHomeRedC: 2,
        matchdayAwayRedC: 4,
        matchdayHomeYellC: 1,
        matchdayAwayYellC: 2),
  ];
  bool isSwitched = false;
  final CloudDatabase c = Get.put(CloudDatabase());
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
        backgroundColor: primaryColor,
        drawer: c.isAdmin.value ? AdminDrawer() : MyDrawer(),
        appBar: AppBar(
          
        ),
        body: StreamBuilder(
            stream: c.getMatchDays('matchday'),
            builder:
                (BuildContext context, AsyncSnapshot<List<MatchDay>> snapshot) {
              if (snapshot.hasError || !snapshot.hasData) {
                return Center(
                    child: Icon(
                  Icons.person,
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
                      height: 130,
                      child: Card(
                        margin: EdgeInsets.fromLTRB(8, 2, 8, 2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        color: primaryColorShade,
                        child: Column(
                          children: <Widget>[
                            Text(
                                'MatchDay '.tr +
                                    '${matchDay.matchdayDate.toString()}',
                                style: maintext3),
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
                                        style: subtext3x),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: 74,
                                    decoration: BoxDecoration(
                                        color: primaryColorShade,
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            color: secondaryColor, width: 0.5)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Text('${matchDay.matchdayHomeScore.toString()}'+' : '+'${matchDay.matchdayAwayScore.toString()}',
                                          textAlign: TextAlign.center,
                                          style: subtext3xx),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                        '${matchDay.matchdayAway.toString()}',
                                        textAlign: TextAlign.center,
                                        style: subtext3x),
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text('MatchType'.tr,
                                            textAlign: TextAlign.center,
                                            style: hinttext),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(
                                          '${matchDay.matchdayType.toString()}',
                                          style: subtextxx,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: Row(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(4,4,4,4),
                                          child: Text('MatchDetails'.tr,
                                              textAlign: TextAlign.center,
                                              style: hinttext),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: IconButton(
                                            icon: Icon(
                                              Icons.info,
                                              color: secondaryColor,
                                            ),
                                            onPressed: () {},
                                          ),
                                        ),
                                      ],
                                    ),
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
            }));
  }
}
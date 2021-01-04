import 'package:EJI/models/club_expenses.dart';
import 'package:EJI/models/matchday.dart';
import 'package:EJI/models/training_day.dart';
import 'package:EJI/repository/cloud_database.dart';
import 'package:EJI/controllers/variables_controler.dart';
import 'package:EJI/screens/common/team_tab.dart';
import 'package:EJI/screens/squad/main_formation.dart';
import 'package:EJI/settings/params.dart';
import 'package:EJI/shared/drawer_main.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'picture_archive_list.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class TeamPage extends StatefulWidget {
  TeamPage({
    Key key,
  });
  @override
  _TeamPageState createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  final  db = Get.put(CloudDatabase());
  final  varController = Get.put(VariablesControler());

  List<ClubSpendings> clubSpendings;

  List _list2 = List<MatchDay>();
  List<ClubIncome> clubIncome;
  double d = 0;
  double c = 0;

  int trainingCount = 0;

  List<double> barData(List<TrainingDay> list) {
    List<double> data = <double>[0];
    if (list != null) {
      for (var i = 0; i < list.length; i++) {
        data.add(list[i].attendees.toDouble());
      }
    }

    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      key: scaffoldKey,
      body: Stack(
        fit: StackFit.expand,
        children: [
          new Image.asset('assets/images/login.png', fit: BoxFit.fill),
          Positioned(
            top: 10,
            left: 1,
            width: Get.width - 2,
            height: 260,
            child: Container(
              color: secondaryColor,
              child: new PicturesArchiveList(),
            ),
          ),
          Positioned(
            top: Get.height / 3.3,
            width: Get.width - 10,
            right: 5,
            height: 90,
            child: new Container(
              child: StreamBuilder(
                  stream:null,
                  builder: (context, AsyncSnapshot<List<MatchDay>> snapshot) {
                    if (snapshot.hasError || !snapshot.hasData) {
                      return new Container();
                    } else
                      _list2 = snapshot.data;

                    return CarouselSlider.builder(
                      itemCount: _list2 != null ? _list2.length : 0,
                      options: CarouselOptions(
                        height: 240,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                      ),
                      itemBuilder: (context, index) {
                        MatchDay matchDay = _list2[index];
                        return Padding(
                          padding: const EdgeInsets.only(top: 2.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: primaryColor.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            height: 60,
                            child: Column(
                              children: <Widget>[
                                Text(
                                    'MatchDay'.tr +
                                        '${matchDay.matchdayDate.toString()}',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: whitefontColor)),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Text(
                                            '${matchDay.matchdayHome.toString()}',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                color: accentColor)),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Container(
                                        width: 74,
                                        decoration: BoxDecoration(
                                          color:
                                              secondaryColor.withOpacity(0.8),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
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
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: orange))
                                                : Text('--' + ' : ' + '--',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: orange))),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Text(
                                            '${matchDay.matchdayAway.toString()}',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                color: accentColor)),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Text(
                                            '${matchDay.matchdayType.toString()}',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                color: fontColor),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Text('MatchType'.tr,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w200,
                                                  color: fontColor)),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }),
            ),
          ),
          new Positioned(
            bottom: 50,
            left: 10,
            width: Get.width - 20,
            child: new Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: primaryColor.withOpacity(0.8),
              ),
              height: 340,
              child: Column(
                children: [
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            FlatButton(
                              onPressed: () => Get.to(TeamTab()),
                              child: Text(
                                'التداريب ',
                                style: TextStyle(
                                  fontFamily: 'Courier New',
                                  fontSize: 20,
                                  color: whitefontColor,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                        'مجموع الحصص ' + '$trainingCount ',
                                        style: TextStyle(
                                          fontFamily: 'Courier New',
                                          fontSize: 18,
                                          color: fontColor,
                                          fontWeight: FontWeight.normal,
                                          fontStyle: FontStyle.italic,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),

                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'نسبة الحضور ',
                                  style: TextStyle(
                                    fontFamily: 'Courier New',
                                    fontSize: 16,
                                    color: secondaryColor,
                                    fontStyle: FontStyle.italic,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '21%',
                                  style: TextStyle(
                                    fontFamily: 'Courier New',
                                    fontSize: 18,
                                    color: accentColor,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: new Container(
                              width: 140,
                              height: 80,

                            )),
                      ],
                    ),
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [


                             Column(
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            FlatButton(
                                              onPressed: () =>
                                                  Get.to(TeamTab()),
                                              child: Text(
                                                'المباريات ',
                                                style: TextStyle(
                                                  fontFamily: 'Courier New',
                                                  fontSize: 20,
                                                  color: whitefontColor,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Obx(
                                                  () => Text(
                                                    '${varController.totalWin} ',
                                                    style: TextStyle(
                                                      fontFamily: 'Courier New',
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: accentColor,
                                                      fontStyle:
                                                          FontStyle.italic,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                                Text(
                                                  'الانتصارات ',
                                                  style: TextStyle(
                                                    fontFamily: 'Courier New',
                                                    fontSize: 16,
                                                    color: secondaryColor,
                                                    fontStyle: FontStyle.italic,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  '${varController.totalDraw} ',
                                                  style: TextStyle(
                                                    fontFamily: 'Courier New',
                                                    fontSize: 16,
                                                    color: Colors.yellow,
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle: FontStyle.italic,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                                Text(
                                                  'التعادلات ',
                                                  style: TextStyle(
                                                    fontFamily: 'Courier New',
                                                    fontSize: 14,
                                                    color: secondaryColor,
                                                    fontStyle: FontStyle.italic,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  '${varController.totalLoss} ',
                                                  style: TextStyle(
                                                    fontFamily: 'Courier New',
                                                    fontSize: 16,
                                                    color: orange,
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle: FontStyle.italic,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                                Text(
                                                  'الهزائم ',
                                                  style: TextStyle(
                                                    fontFamily: 'Courier New',
                                                    fontSize: 14,
                                                    color: secondaryColor,
                                                    fontStyle: FontStyle.italic,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],

                             ),


                        Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: new Container(
                                width: 200,
                                height: 160,
                                child: new charts.PieChart(pieData(),
                                    animate: true,
                                    defaultRenderer:
                                        new charts.ArcRendererConfig(
                                            arcWidth: 200)))),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            'تشكيلة الفريق حسب التنقيط ',
                            style: TextStyle(
                              fontFamily: 'Courier New',
                              fontSize: 12,
                              color: secondaryColor,
                              fontStyle: FontStyle.italic,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            'أرشيف التشكيلات التي لعب بها الفريق',
                            style: TextStyle(
                              fontFamily: 'Courier New',
                              fontSize: 12,
                              color: secondaryColor,
                              fontStyle: FontStyle.italic,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      FlatButton(
                        onPressed: () => Get.to(MainFormation()),
                        child: Text(
                          'تشكيلة الفريق ',
                          style: TextStyle(
                            fontFamily: 'Courier New',
                            fontSize: 20,
                            color: whitefontColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 30,
            left: 10,
            child: Container(
              width: 120,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => scaffoldKey.currentState.openDrawer(),
                    icon: Icon(
                      Icons.menu,
                      color: primaryColor,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<charts.Series<LinearSales, int>> pieData() {
    final data = [
      new LinearSales('Win', varController.totalWin,
          charts.ColorUtil.fromDartColor(Colors.green[400])),
      new LinearSales('Draw', varController.totalDraw,
          charts.ColorUtil.fromDartColor(Colors.yellow[400])),
      new LinearSales('Loss', varController.totalLoss,
          charts.ColorUtil.fromDartColor(Colors.red[400])),
    ];

    return [
      new charts.Series<LinearSales, int>(
        domainFn: (LinearSales a, index) => a.sales,
        id: 'WinStatus',
        measureFn: (LinearSales sales, _) => sales.sales,
        colorFn: (LinearSales s, index) => s.color,
        data: data,
      )
    ];
  }
}

class LinearSales {
  final String item;
  final int sales;
  final charts.Color color;

  LinearSales(this.item, this.sales, this.color);
}

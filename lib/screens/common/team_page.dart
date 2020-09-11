import 'dart:math';

import 'package:EJI/models/club_expenses.dart';
import 'package:EJI/models/matchday.dart';
import 'package:EJI/models/training_day.dart';
import 'package:EJI/repository/cloud_database.dart';
import 'package:EJI/screens/admin_access/admin_validator.dart';
import 'package:EJI/screens/common/matches_page.dart';
import 'package:EJI/screens/common/team_tab.dart';
import 'package:EJI/screens/squad/main_formation.dart';
import 'package:EJI/settings/params.dart';
import 'package:EJI/shared/drawer_main.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'picture_archive_list.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class TeamPage extends StatefulWidget {
  @override
  _TeamPageState createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  final CloudDatabase cD = Get.put(CloudDatabase());
  List<double> data = [
    1.0,
    1.1,
    1.0,
    1.2,
  ];
  List<ClubSpendings> clubSpendings;
  List _listCount = List<MatchDay>();
  List _list2 = List<MatchDay>();
  List _listTraining = List<TrainingDay>();
  List<ClubIncome> clubIncome;
  double d = 0;
  double c = 0;
  int winCount = 0;
  int drawCount = 0;
  int lossCount = 0;

  int trainingAttendees = 0;
  int trainingCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      key: scaffoldKey,
      body: Stack(
        children: [
          Positioned(
            top: 10,
            left: 1,
            width: Get.width - 2,
            height: 180,
            child: Container(
              color: secondaryColor,
              child: new PicturesArchiveList(),
            ),
          ),
          Positioned(
            top: Get.height / 3.7,
            width: Get.width - 10,
            right: 5,
            height: 90,
            child: new Container(
              child: StreamBuilder(
                  stream: cD.getMatchDays(),
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
                                color: primaryColorShadow,
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all()),
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
          StreamBuilder(
              stream: cD.getTrainingDays(),
              builder: (context, AsyncSnapshot<List<TrainingDay>> snapshot) {
                if (!snapshot.hasData || snapshot.hasError) {
                  return Container();
                } else
                  _listTraining = snapshot.data;
                trainingCount = TrainingDay.getCountTraining(_listTraining);

                return Container();
              }),
          new Positioned(
            bottom: 70,
            left: 10,
            width: Get.width - 20,
            child: new Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: primaryColorShadow,
              ),
              height: 370,
              child: Column(
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Text(
                                '21%',
                                style: TextStyle(
                                  fontFamily: 'Courier New',
                                  fontSize: 16,
                                  color: secondaryColor,
                                  fontStyle: FontStyle.italic,
                                ),
                                textAlign: TextAlign.center,
                              ),
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
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                '$trainingCount ',
                                style: TextStyle(
                                  fontFamily: 'Courier New',
                                  fontSize: 18,
                                  color: accentColor,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                'مجموع الحصص ',
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
                        ],
                      ),
                      Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: new Container(
                            width: 140,
                            height: 80,
                            child: Sparkline(
                              data: data,
                              lineColor: Colors.green,
                              fillMode: FillMode.below,
                              fillColor: primaryColorShadow,
                            ),
                          )),
                    ],
                  ),
                  StreamBuilder(
                      stream: cD.getMatchStatusHome('شباب اداولسطان'),
                      builder:
                          (context, AsyncSnapshot<List<MatchDay>> snapshot) {
                        if (!snapshot.hasData || snapshot.hasError) {
                          return Container();
                        } else
                          _listCount = snapshot.data;
                        winCount = MatchDay.getWinStatusHome(_listCount, 'win');

                        return Container();
                      }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '$winCount ',
                            style: TextStyle(
                              fontFamily: 'Courier New',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: accentColor,
                              fontStyle: FontStyle.italic,
                            ),
                            textAlign: TextAlign.center,
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
                            '$drawCount ',
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
                            '$lossCount ',
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
                      FlatButton(
                        onPressed: () => Get.to(MatchesPage()),
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
                    ],
                  ),
                  Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: new Container(
                        width: 120,
                        height: 120,
                        child: DonutPieChart.withSampleData(),
                      )),
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
              width: 60,
              child: IconButton(
                onPressed: () => scaffoldKey.currentState.openDrawer(),
                icon: Icon(
                  Icons.menu,
                  color: primaryColor,
                  size: 30,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DonutPieChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  DonutPieChart(this.seriesList, {this.animate});

  /// Creates a [PieChart] with sample data and no transition.
  factory DonutPieChart.withSampleData() {
    return new DonutPieChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new charts.PieChart(seriesList,
        animate: false,
        defaultRenderer: new charts.ArcRendererConfig(arcWidth: 120));
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<LinearSales, int>> _createSampleData() {
    final data = [
      new LinearSales(0, 100),
      new LinearSales(1, 75),
      new LinearSales(2, 25),
      new LinearSales(2, 25),
    ];

    return [
      new charts.Series<LinearSales, int>(
        id: 'Sales',
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

/// Sample linear data type.
class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}

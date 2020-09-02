import 'package:EJI/models/player.dart';
import 'package:EJI/repository/cloud_database.dart';
import 'package:EJI/settings/params.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SimpleLineChart extends StatefulWidget {
  const SimpleLineChart({Key key, @required this.playerRegNum})
      : super(key: key);

  @override
  _SimpleLineChartState createState() => _SimpleLineChartState();

  final String playerRegNum;
}

class _SimpleLineChartState extends State<SimpleLineChart> {
  final CloudDatabase c = Get.put(CloudDatabase());
  Player playerS;
  List<Player> playerStatsList = List<Player>();
  final List<OrdinalSales> data = [];
  final List<OrdinalSales> data2 = [];
  final List<OrdinalSales> data3 = [];
  final List<OrdinalSales> data4 = [];
  final List<OrdinalSales> data5 = [];

  List<charts.Series<OrdinalSales, DateTime>> _createSampleData(
      List<Player> list) {
    for (var i = 0; i < list.length; i++) {
      playerS = list[i];
      data.add(
        new OrdinalSales(
            DateTime.parse(playerS.scoreDate), playerS.desciplineScore),
      );
      data2.add(
        new OrdinalSales(
            DateTime.parse(playerS.scoreDate), playerS.trainingScore.toInt()),
      );
      data3.add(
        new OrdinalSales(
            DateTime.parse(playerS.scoreDate), playerS.positionMaster.toInt()),
      );
      data4.add(
        new OrdinalSales(
            DateTime.parse(playerS.scoreDate), playerS.availability.toInt()),
      );
      data5.add(
        new OrdinalSales(
            DateTime.parse(playerS.scoreDate), playerS.oVR.toInt()),
      );
    }

    return [
      new charts.Series<OrdinalSales, DateTime>(
        id: 'descipline',
        colorFn: (_, __) => moodColors[0]['descipline'],
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data,
      ),
      new charts.Series<OrdinalSales, DateTime>(
        id: 'training',
        colorFn: (_, __) => moodColors[0]['training'],
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data2,
      ),
      new charts.Series<OrdinalSales, DateTime>(
        id: 'positionMastery',
        colorFn: (_, __) => moodColors[0]['positionMastery'],
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data3,
      ),
      new charts.Series<OrdinalSales, DateTime>(
        id: 'availability',
        colorFn: (_, __) => moodColors[0]['availability'],
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data4,
      ),
      new charts.Series<OrdinalSales, DateTime>(
        id: 'Score',
        colorFn: (_, __) => moodColors[0]['Score'],
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data5,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        StreamBuilder(
          stream: c.getPlayers('Players'),
          builder: (BuildContext context, AsyncSnapshot<List<Player>> lista) {
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: new charts.TimeSeriesChart(
                _createSampleData(lista.data),
                animate: true,
                dateTimeFactory: const charts.LocalDateTimeFactory(),
              ),
            );
          },
        ),
      ],
    );
  }
}

/// Sample ordinal data type.

class OrdinalSales {
  final DateTime year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}

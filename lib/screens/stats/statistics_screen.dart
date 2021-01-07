import 'package:EJI/models/players/player.dart';
import 'package:EJI/repository/cloud_database.dart';
import 'package:EJI/settings/params.dart';
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

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

/// Sample ordinal data type.


import 'dart:ui';

import 'package:EJI/model/squad_player.dart';
import 'package:EJI/repository/cloud_database.dart';
import 'package:EJI/screens/admin_access/admin_drawer.dart';
import 'package:EJI/settings/params.dart';
import 'package:EJI/shared/drawer_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  SquadPlayer _squadPlayer = new SquadPlayer(
    abriviation: 'GK',
    avatar: 'GK',
    markings: 1,
    position: 'GK',
  );

Widget person= Icon(
        Icons.person,
        size: 30,
      );

  bool isSwitched = false;
  var plyer = Icon(
    Icons.person,
    size: 40,
  );
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
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {},
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          Image.asset('assets/images/field.png', fit: BoxFit.fill),
          Positioned(
              top: 300,
              left: 20,
              child: buildPositioned()),
          Positioned(
            top: 300,
            left: 120,
            child: DragTarget<Widget>(
              builder: ( context, inComing,
                   rejected) {
                return Container(
                  width: 160,
                  height: 160,
                  color: secondaryColor,
                );
              },
              onAccept: (data) { data=person;},
              onWillAccept: (data) {
                return true;
              },
            ),
          )
        ],
      ),
    );
  }

  Widget  buildPositioned() {
    return Draggable<Widget>(
      data: person,
      feedback: Icon(
        Icons.person,
        size: 30,
      ),
      childWhenDragging: Icon(
        Icons.person,
        size: 30,
      ),
      child: _squadPlayer,
    );
  }
}

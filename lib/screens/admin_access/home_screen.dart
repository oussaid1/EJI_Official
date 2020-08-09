import 'dart:ui';

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

 
  
  bool isSwitched = false;
   final CloudDatabase c = Get.put(CloudDatabase());
  bool isEconomicMode;
  double limit = 400;
  GetStorage mBox=GetStorage();
  @override
  void initState() {
//mBox.write('adminkey',false).then((value) => isAdmin= mBox != null ? mBox.read('adminkey') :true);
 
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      backgroundColor: primaryColor,
      drawer:c.isAdmin.value? AdminDrawer():MyDrawer(),
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
               
            },
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height,
                  child: Image.asset(
                    'assets/images/field.png',
                    fit: BoxFit.fill,
                  ),
                ),
                Row(
                  children: [
                    buildPositioned(),
                    buildPositioned(),
                    buildPositioned(),
                  ],
                ),
              ],
            ),
          ),
          Center(
            child: Transform(
                transform: Matrix4.translationValues(2, 2, 3),
                child: CircleAvatar()),
          ),
        ],
      ),
    );
  }

  Container buildPositioned() {
    return Container(
      child: Column(
        children: [
          IconButton(
            color: Colors.red[600],
            icon: Icon(
              Icons.person,
              size: 40,
            ),
            onPressed: () {},
          ),
          new Text('Yajor',style: TextStyle(color: Colors.red, fontSize: 23),),
        ],
      ),
    );
  }
}

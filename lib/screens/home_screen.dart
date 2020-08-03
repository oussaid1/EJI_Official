import 'dart:ui';

import 'package:EJI/repository/repository.dart';
import 'package:EJI/settings/params.dart';
import 'package:EJI/shared/drawer_main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

 
  
  
  bool isSwitched = false;
  bool isEconomicMode;
  double limit = 400;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final TotalBloc totalBloc = BlocProvider.of<TotalBloc>(BuildContext context);

    return Scaffold(
      backgroundColor: primaryColor,
      drawer: MyDrawer(),
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
                Positioned(
                  top: 160,
                  left: 69,
                  child: Container(
                    child: IconButton(
                      color: Colors.red[600],
                      icon: Icon(
                        Icons.person,
                        size: 40,
                      ),
                      onPressed: () {},
                    ),
                  ),
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
}

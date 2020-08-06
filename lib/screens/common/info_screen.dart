import 'package:EJI/settings/params.dart';
import 'package:EJI/shared/drawer_main.dart';
import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text(
          'About EJI',
          style: maintext3,
        ),
      ),
      backgroundColor: primaryColor,
      body: ListView(
        children: <Widget>[
          Wrap(children: <Widget>[
            Text(
              about[0]['arbout']().toString(),textDirection:TextDirection.rtl,
              style: subtext2,
            )
          ]),
        ],
      ),
    );
  }
}

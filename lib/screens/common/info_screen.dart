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
          Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 400,
                          child: Text(
                           
              about.toString(),
              style: subtext2,
               overflow:TextOverflow.ellipsis,
               maxLines: 60,
               textAlign: TextAlign.justify,
               textDirection: TextDirection.rtl,
            ),
                        ),
                      ),
          ),
        ],
      ),
    );
  }
}

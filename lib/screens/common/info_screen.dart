import 'package:EJI/screens/common/eji_law.dart';
import 'package:EJI/settings/params.dart';
import 'package:EJI/shared/drawer_main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text(
          'About EJI',
          style: TextStyle(fontSize:26,fontWeight: FontWeight.w600,color: fontColor),
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.drag_handle,
                color: secondaryColor,
              ),
              onPressed: () => Get.to(EJILawScreen())),
        ],
      ),
      backgroundColor: primaryColor,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 400,
              child: Text(
                about.toString(),
                style: TextStyle(fontSize:18,fontWeight: FontWeight.w400,color: fontColor),
                overflow: TextOverflow.ellipsis,
                maxLines: 60,
                textAlign: TextAlign.justify,
                textDirection: TextDirection.rtl,
              ),
            ),
          ),

          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}

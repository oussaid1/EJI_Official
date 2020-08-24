import 'package:EJI/model/matchday.dart';
import 'package:EJI/repository/cloud_database.dart';
import 'package:EJI/screens/admin_access/admin_drawer.dart';
import 'package:EJI/settings/params.dart';
import 'package:EJI/shared/drawer_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MatchDetails extends StatefulWidget {
  final MatchDay matchDay;
  MatchDetails({Key key, this.matchDay});

  @override
  _MatchDetailsState createState() => _MatchDetailsState();
}

class _MatchDetailsState extends State<MatchDetails> {
  MatchDay matchDay;
  final CloudDatabase c = Get.put(CloudDatabase());

  @override
  void initState() {
    if (widget.matchDay != null) {
      matchDay = widget.matchDay;
    }
    super.initState();
  }

  Widget _buildHome() {
    return Container(
      width: 170,
      decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: secondaryColor, width: 0.5)),
      height: 220,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 170,
            height: 50,
            decoration: BoxDecoration(
                color: secondaryColor.withOpacity(0.8),
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: secondaryColor, width: 0.5)),
            child: Text('${matchDay.matchdayHome.toString()}',
                textAlign: TextAlign.center, style: TextStyle(fontSize:18,fontWeight: FontWeight.w400,color: accentColor)),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 30,
                  height: 30,
                  child: Image.asset(
                    'assets/images/whistle.png',
                    fit: BoxFit.contain,
                  ),
                ),
                Container(
                  width: 74,
                  decoration: BoxDecoration(
                      color: secondaryColor.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: primaryColor, width: 0.5)),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text('${matchDay.matchdayHomeScore.toString()}',
                        textAlign: TextAlign.center, style: TextStyle(fontSize:18,fontWeight: FontWeight.w400,color: fontColor)),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 30,
                  height: 30,
                  child: Image.asset(
                    'assets/images/yellowcards.png',
                    fit: BoxFit.contain,
                  ),
                ),
                Container(
                  width: 74,
                  decoration: BoxDecoration(
                      color: secondaryColor.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: primaryColor, width: 0.5)),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text('${matchDay.matchdayHomeYellC.toString()}',
                        textAlign: TextAlign.center, style: TextStyle(fontSize:18,fontWeight: FontWeight.w400,color: fontColor)),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 30,
                  height: 30,
                  child: Image.asset(
                    'assets/images/redcards.png',
                    fit: BoxFit.contain,
                  ),
                ),
                Container(
                  width: 74,
                  decoration: BoxDecoration(
                      color: secondaryColor.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: primaryColor, width: 0.5)),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text('${matchDay.matchdayHomeRedC.toString()}',
                        textAlign: TextAlign.center, style: TextStyle(fontSize:18,fontWeight: FontWeight.w400,color: fontColor)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAway() {
    return Container(
      width: 170,
      decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: secondaryColor, width: 0.5)),
      height: 220,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 170,
            height: 50,
            decoration: BoxDecoration(
                color: secondaryColor.withOpacity(0.8),
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: secondaryColor, width: 0.5)),
            child: Text('${matchDay.matchdayAway.toString()}',
                textAlign: TextAlign.center, style: TextStyle(fontSize:18,fontWeight: FontWeight.w400,color: accentColor)),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 30,
                  height: 30,
                  child: Image.asset(
                    'assets/images/whistle.png',
                    fit: BoxFit.contain,
                  ),
                ),
                Container(
                  width: 74,
                  decoration: BoxDecoration(
                      color: secondaryColor.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: primaryColor, width: 0.5)),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text('${matchDay.matchdayAwayScore.toString()}',
                        textAlign: TextAlign.center, style: TextStyle(fontSize:18,fontWeight: FontWeight.w400,color: fontColor)),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 30,
                  height: 30,
                  child: Image.asset(
                    'assets/images/yellowcards.png',
                    fit: BoxFit.contain,
                  ),
                ),
                Container(
                  width: 74,
                  decoration: BoxDecoration(
                      color: secondaryColor.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: primaryColor, width: 0.5)),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text('${matchDay.matchdayAwayYellC.toString()}',
                        textAlign: TextAlign.center, style: TextStyle(fontSize:18,fontWeight: FontWeight.w400,color: fontColor)),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 30,
                  height: 30,
                  child: Image.asset(
                    'assets/images/redcards.png',
                    fit: BoxFit.contain,
                  ),
                ),
                Container(
                  width: 74,
                  decoration: BoxDecoration(
                      color: secondaryColor.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: primaryColor, width: 0.5)),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text('${matchDay.matchdayAwayRedC.toString()}',
                        textAlign: TextAlign.center, style: TextStyle(fontSize:18,fontWeight: FontWeight.w400,color: fontColor)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: c.isAdmin.value ? AdminDrawer() : MyDrawer(),
      appBar: AppBar(),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/login.png',
            fit: BoxFit.fill,
          ),
          Center(
            child: Container(
              width: Get.width - 20,
              height: Get.height / 1.8,
              child: ListView(
                children: <Widget>[
                  Card(
                    color: secondaryColor.withOpacity(0.8),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                  'MatchDay'.tr +
                                      '${matchDay.matchdayDate.toString()}',
                                  style: TextStyle(fontSize:26,fontWeight: FontWeight.w600,color: fontColor)),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                '${matchDay.matchdayType.toString()}',
                                style: TextStyle(fontSize:18,fontWeight: FontWeight.w400,color: fontColor),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text('MatchType'.tr,
                                  textAlign: TextAlign.center, style: TextStyle(fontSize:14,fontWeight: FontWeight.w200,color: fontColor)),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildHome(),
                              _buildAway(),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                               Text(
                                '  ${matchDay.matchdayReferee.toString()}',
                                style: TextStyle(fontSize:18,fontWeight: FontWeight.w400,color: fontColor),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                'MatchRef'.tr,
                                style: TextStyle(fontSize:14,fontWeight: FontWeight.w200,color: fontColor),
                                textAlign: TextAlign.center,
                              ),
                             
                            ],
                          ),
                        ),
                      ],
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
}

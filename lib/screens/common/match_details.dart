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
          color: secondaryColor,
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
                color: primaryColorShade,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: secondaryColor, width: 0.5)),
            child: Text('${matchDay.matchdayHome.toString()}',
                textAlign: TextAlign.center, style: subtext3x),
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
                  color: secondaryColor,
                  child: Image.asset(
                    'assets/images/whistle.png',
                    fit: BoxFit.contain,
                  ),
                ),
                Container(
                  width: 74,
                  decoration: BoxDecoration(
                      color: primaryColorShade,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: secondaryColor, width: 0.5)),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text('${matchDay.matchdayHomeScore.toString()}',
                        textAlign: TextAlign.center, style: subtext3xx),
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
                  color: secondaryColor,
                  child: Image.asset(
                    'assets/images/yellowcards.png',
                    fit: BoxFit.contain,
                  ),
                ),
                Container(
                  width: 74,
                  decoration: BoxDecoration(
                      color: primaryColorShade,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: secondaryColor, width: 0.5)),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text('${matchDay.matchdayHomeYellC.toString()}',
                        textAlign: TextAlign.center, style: subtext3xx),
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
                  color: secondaryColor,
                  child: Image.asset(
                    'assets/images/redcards.png',
                    fit: BoxFit.contain,
                  ),
                ),
                Container(
                  width: 74,
                  decoration: BoxDecoration(
                      color: primaryColorShade,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: secondaryColor, width: 0.5)),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text('${matchDay.matchdayHomeRedC.toString()}',
                        textAlign: TextAlign.center, style: subtext3xx),
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
          color: secondaryColor,
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
                color: primaryColorShade,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: secondaryColor, width: 0.5)),
            child: Text('${matchDay.matchdayAway.toString()}',
                textAlign: TextAlign.center, style: subtext3x),
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
                  color: secondaryColor,
                  child: Image.asset(
                    'assets/images/whistle.png',
                    fit: BoxFit.contain,
                  ),
                ),
                Container(
                  width: 74,
                  decoration: BoxDecoration(
                      color: primaryColorShade,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: secondaryColor, width: 0.5)),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text('${matchDay.matchdayAwayScore.toString()}',
                        textAlign: TextAlign.center, style: subtext3xx),
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
                  color: secondaryColor,
                  child: Image.asset(
                    'assets/images/yellowcards.png',
                    fit: BoxFit.contain,
                  ),
                ),
                Container(
                  width: 74,
                  decoration: BoxDecoration(
                      color: primaryColorShade,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: secondaryColor, width: 0.5)),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text('${matchDay.matchdayAwayYellC.toString()}',
                        textAlign: TextAlign.center, style: subtext3xx),
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
                  color: secondaryColor,
                  child: Image.asset(
                    'assets/images/redcards.png',
                    fit: BoxFit.contain,
                  ),
                ),
                Container(
                  width: 74,
                  decoration: BoxDecoration(
                      color: primaryColorShade,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: secondaryColor, width: 0.5)),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text('${matchDay.matchdayAwayRedC.toString()}',
                        textAlign: TextAlign.center, style: subtext3xx),
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
            'assets/images/ejisplash.jpg',
            fit: BoxFit.fill,
          ),
          Center(
            child: Container(
              width: Get.width - 20,
              height: Get.height / 1.8,
              child: ListView(
                children: <Widget>[
                  Card(
                    color: primaryColorShade,
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
                                  style: maintext3),
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
                                style: subtextxx,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text('MatchType'.tr,
                                  textAlign: TextAlign.center, style: hinttext),
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
                                style: subtextxx,
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                'MatchRef'.tr,
                                style: hinttext,
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

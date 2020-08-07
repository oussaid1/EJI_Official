import 'package:EJI/model/matchday.dart';
import 'package:EJI/repository/cloud_database.dart';
import 'package:EJI/screens/admin_access/add_match.dart';
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
//mBox.write('adminkey',false).then((value) => isAdmin= mBox != null ? mBox.read('adminkey') :true);
    if (widget.matchDay != null) {
       matchDay =widget.matchDay;


    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      drawer: c.isAdmin.value ? AdminDrawer() : MyDrawer(),
      appBar: AppBar(),
      body: Center(
        child: Container(
          width:Get.width-40,
          height: Get.height/2,
          child: Card(
            color: primaryColorShade,
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(
                    height: 300,
                    child: Column(
                      children: <Widget>[
                        Text('MatchDay'.tr + '${matchDay.matchdayDate.toString()}',
                            style: subtext3),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text('${matchDay.matchdayHome.toString()}',
                                    textAlign: TextAlign.center, style: subtext3x),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 74,
                                decoration: BoxDecoration(
                                    color: primaryColorShade,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: secondaryColor, width: 0.5)),
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Text(
                                      '${matchDay.matchdayHomeScore.toString()}' +
                                          ' : ' +
                                          '${matchDay.matchdayAwayScore.toString()}',
                                      textAlign: TextAlign.center,
                                      style: subtext3xx),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text('${matchDay.matchdayAway.toString()}',
                                    textAlign: TextAlign.center, style: subtext3x),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                 
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text('MatchType'.tr,
                                        textAlign: TextAlign.center,
                                        style: hinttext),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                      '${matchDay.matchdayType.toString()}',
                                      style: subtextxx,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                   Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  c.isAdmin.value
                                      ? IconButton(
                                          icon: Icon(
                                            Icons.edit,
                                            color: secondaryColor,
                                          ),
                                          onPressed: () {
                                            Get.to(AddMatch(
                                              matchDay: matchDay,
                                              matchDayIndex: matchDay.id,
                                            ));
                                          })
                                      : SizedBox(width: 1, height: 1),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text('MatchType'.tr,
                                        textAlign: TextAlign.center,
                                        style: hinttext),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                      '${matchDay.matchdayType.toString()}',
                                      style: subtextxx,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              
                            ],
                          ),
                        ),
                                ],
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
          ),
        ),
      ),
    );
  }
}

import 'package:EJI/models/club_expenses.dart';
import 'package:EJI/models/matchday.dart';
import 'package:EJI/repository/cloud_database.dart';
import 'package:EJI/settings/params.dart';
import 'package:EJI/shared/drawer_main.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

class TeamPage extends StatefulWidget {
  @override
  _TeamPageState createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  final CloudDatabase cD = Get.put(CloudDatabase());

  List<ClubSpendings> clubSpendings;
  List _list = List<MatchDay>();
  List<ClubIncome> clubIncome;

  double d = 0;
  double c = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      key: scaffoldKey,
      backgroundColor: primaryColor,
      body: Stack(
        children: [
          Positioned(
            top: 10,
            left: 1,
            height: 180,
            child: Container(
              width: Get.width - 2,
              child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  child: Image.asset('assets/images/c.jpg', fit: BoxFit.fill)),
            ),
          ),
          Positioned(
            top: Get.height / 3.7,
            width: Get.width - 10,
            right: 5,
            height: 90,
            child: new Container(
              child: StreamBuilder(
                  stream: cD.getMatchDays(),
                  builder: (context, AsyncSnapshot<List<MatchDay>> snapshot) {
                    if (snapshot.hasError || !snapshot.hasData) {
                      return new Container();
                    } else
                      _list = snapshot.data;

                    return CarouselSlider.builder(
                      itemCount: _list != null ? _list.length : 0,
                      options: CarouselOptions(
                        height: 240,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                      ),
                      itemBuilder: (context, index) {
                        MatchDay matchDay = _list[index];
                        return Padding(
                          padding: const EdgeInsets.only(top: 2.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(color: Colors.grey)),
                            height: 60,
                            child: Column(
                              children: <Widget>[
                                Text(
                                    'MatchDay'.tr +
                                        '${matchDay.matchdayDate.toString()}',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: whitefontColor)),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Text(
                                            '${matchDay.matchdayHome.toString()}',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                color: accentColor)),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Container(
                                        width: 74,
                                        decoration: BoxDecoration(
                                            color:
                                                secondaryColor.withOpacity(0.8),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                color: secondaryColor,
                                                width: 0.5)),
                                        child: Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: matchDay.matchdayType.trim() !=
                                                        'مباراة مبرمجة'
                                                            .toString() ||
                                                    matchDay.matchdayType.trim() !=
                                                        'Schedueled'
                                                            .tr
                                                            .trim()
                                                            .toString()
                                                ? Text(
                                                    '${matchDay.matchdayHomeScore.toString()}' +
                                                        ' : ' +
                                                        '${matchDay.matchdayAwayScore.toString()}',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: orange))
                                                : Text('--' + ' : ' + '--',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: orange))),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Text(
                                            '${matchDay.matchdayAway.toString()}',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                color: accentColor)),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Text(
                                            '${matchDay.matchdayType.toString()}',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                color: fontColor),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Text('MatchType'.tr,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w200,
                                                  color: fontColor)),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }),
            ),
          ),
          new Positioned(
            bottom: 70,
            left: 10,
            width: Get.width - 10,
            child: new Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(6),
                color: primaryColor,
              ),
              height: 360,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'أنشطة الفريق ، من مباريات وتداريب ',
                        style: TextStyle(
                          fontFamily: 'Courier New',
                          fontSize: 14,
                          color: secondaryColor,
                          fontStyle: FontStyle.italic,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'الفريق',
                        style: TextStyle(
                          fontFamily: 'Courier New',
                          fontSize: 24,
                          color: const Color(0xff17bcb5),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.arrow_back,
                                color: accentColor,
                              ),
                              Text(
                                'تفاصيل ',
                                style: TextStyle(
                                  fontFamily: 'Courier New',
                                  fontSize: 14,
                                  color: fontColor,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          Text(
                            'المباريات ',
                            style: TextStyle(
                              fontFamily: 'Courier New',
                              fontSize: 20,
                              color: whitefontColor,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    '21',
                                    style: TextStyle(
                                      fontFamily: 'Courier New',
                                      fontSize: 16,
                                      color: secondaryColor,
                                      fontStyle: FontStyle.italic,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    'الانتصارات ',
                                    style: TextStyle(
                                      fontFamily: 'Courier New',
                                      fontSize: 14,
                                      color: secondaryColor,
                                      fontStyle: FontStyle.italic,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: new Container(
                                  color: secondaryColor,
                                  width: 120,
                                  height: 120,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    '21',
                                    style: TextStyle(
                                      fontFamily: 'Courier New',
                                      fontSize: 16,
                                      color: secondaryColor,
                                      fontStyle: FontStyle.italic,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    'التعادلات ',
                                    style: TextStyle(
                                      fontFamily: 'Courier New',
                                      fontSize: 14,
                                      color: secondaryColor,
                                      fontStyle: FontStyle.italic,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: new Container(
                                  color: secondaryColor,
                                  width: 120,
                                  height: 120,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    '21',
                                    style: TextStyle(
                                      fontFamily: 'Courier New',
                                      fontSize: 16,
                                      color: secondaryColor,
                                      fontStyle: FontStyle.italic,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    'الهزائم ',
                                    style: TextStyle(
                                      fontFamily: 'Courier New',
                                      fontSize: 14,
                                      color: secondaryColor,
                                      fontStyle: FontStyle.italic,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: new Container(
                                  color: secondaryColor,
                                  width: 120,
                                  height: 120,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      Text(
                        'التداريب ',
                        style: TextStyle(
                          fontFamily: 'Courier New',
                          fontSize: 20,
                          color: whitefontColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                '21%',
                                style: TextStyle(
                                  fontFamily: 'Courier New',
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: accentColor,
                                  fontStyle: FontStyle.italic,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                'نسبة الحضور ',
                                style: TextStyle(
                                  fontFamily: 'Courier New',
                                  fontSize: 16,
                                  color: whitefontColor,
                                  fontStyle: FontStyle.italic,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                '21',
                                style: TextStyle(
                                  fontFamily: 'Courier New',
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: accentColor,
                                  fontStyle: FontStyle.italic,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                'مجموع الحصص ',
                                style: TextStyle(
                                  fontFamily: 'Courier New',
                                  fontSize: 16,
                                  color: whitefontColor,
                                  fontStyle: FontStyle.italic,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: 10,
            child: Container(
              width: 50,
              child: IconButton(
                onPressed: () => scaffoldKey.currentState.openDrawer(),
                icon: Icon(
                  Icons.menu,
                  color: primaryColor,
                  size: 30,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

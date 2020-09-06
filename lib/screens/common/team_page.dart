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
                onPressed: () => MyDrawer(),
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

class AdministrationWidget extends StatelessWidget {
  const AdministrationWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: const Color(0xff101a24),
        boxShadow: [],
      ),
      child: Column(
        children: [
          Text(
            'ادارة الفريق',
            style: TextStyle(
              fontFamily: 'Courier New',
              fontSize: 22,
              color: const Color(0xff17bcb5),
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            'الشؤون الإدارية للفريق',
            style: TextStyle(
              fontFamily: 'Courier New',
              fontSize: 12,
              color: secondaryColor,
              fontStyle: FontStyle.italic,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            'هيكلة المكتب ',
            style: TextStyle(
              fontFamily: 'Courier New',
              fontSize: 16,
              color: whitefontColor,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            'الرئيس - الطاقم الإداري -الطاقم التقني - المستشارون',
            style: TextStyle(
              fontFamily: 'Courier New',
              fontSize: 12,
              color: secondaryColor,
              fontStyle: FontStyle.italic,
            ),
            textAlign: TextAlign.right,
          ),
          Text(
            'البرامج والاهداف ',
            style: TextStyle(
              fontFamily: 'Courier New',
              fontSize: 16,
              color: whitefontColor,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            'البرامج والاهداف التي يسطرها الكتب و التي يشتغل عليها ',
            style: TextStyle(
              fontFamily: 'Courier New',
              fontSize: 12,
              color: secondaryColor,
              fontStyle: FontStyle.italic,
            ),
            textAlign: TextAlign.right,
          ),
          Text(
            'المستودع ',
            style: TextStyle(
              fontFamily: 'Courier New',
              fontSize: 16,
              color: whitefontColor,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            'ممتلكات الفريق ، المادية والمعنوية. أرشيف الفريق. واحصاءات ، ',
            style: TextStyle(
              fontFamily: 'Courier New',
              fontSize: 12,
              color: secondaryColor,
              fontStyle: FontStyle.italic,
            ),
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }
}

class DocumentsWidget extends StatelessWidget {
  const DocumentsWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: const Color(0xff101a24),
        boxShadow: [],
      ),
      child: Column(
        children: [
          Text(
            'الوثائق ',
            style: TextStyle(
              fontFamily: 'Courier New',
              fontSize: 22,
              color: const Color(0xff17bcb5),
            ),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              'القانون الأساسي للفريق',
              style: TextStyle(
                fontFamily: 'Courier New',
                fontSize: 16,
                color: whitefontColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              'فلسفة الفريق',
              style: TextStyle(
                fontFamily: 'Courier New',
                fontSize: 16,
                color: whitefontColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Row(
            children: [
              IconButton(
                  icon: Icon(
                    Icons.info,
                    color: secondaryColor,
                  ),
                  onPressed: null),
              Text(
                'حول التطبيق',
                style: TextStyle(
                  fontFamily: 'Courier New',
                  fontSize: 16,
                  color: secondaryColor,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TeamBoardWidget extends StatelessWidget {
  const TeamBoardWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: const Color(0xff101a24),
        boxShadow: [],
      ),
      child: Column(
        children: [
          Text(
            'سبورة الفريق',
            style: TextStyle(
              fontFamily: 'Amiri',
              fontSize: 22,
              color: const Color(0xff17bcb5),
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            'إعلانات واقتراحات و ملاحظات ... ',
            style: TextStyle(
              fontFamily: 'Courier New',
              fontSize: 12,
              color: secondaryColor,
              fontStyle: FontStyle.italic,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            'إعلانات ',
            style: TextStyle(
              fontFamily: 'Courier New',
              fontSize: 16,
              color: whitefontColor,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            'اعلانات المكتب المسير للفريف ، للاعبين ، والعامة ... ',
            style: TextStyle(
              fontFamily: 'Courier New',
              fontSize: 12,
              color: secondaryColor,
              fontStyle: FontStyle.italic,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            'اقتراحات و ملاحظات',
            style: TextStyle(
              fontFamily: 'Courier New',
              fontSize: 14,
              color: whitefontColor,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            'يحق لكل نخرط اولاعب او غيرهما الادلاء باقتراحاته ونلاحظاته للفريق والمسيرين .ويتم الإجابة عليها من قبل المكتب .  ',
            style: TextStyle(
              fontFamily: 'Courier New',
              fontSize: 12,
              color: secondaryColor,
              fontStyle: FontStyle.italic,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class TeamWidget extends StatelessWidget {
  const TeamWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: const Color(0xff101a24),
        boxShadow: [],
      ),
      child: Column(
        children: [
          Text(
            'الفريق',
            style: TextStyle(
              fontFamily: 'Courier New',
              fontSize: 22,
              color: const Color(0xff17bcb5),
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            'أنشطة الفريق ، من مباريات وتداريب ',
            style: TextStyle(
              fontFamily: 'Courier New',
              fontSize: 12,
              color: secondaryColor,
              fontStyle: FontStyle.italic,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
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
                      Text(
                        '21%',
                        style: TextStyle(
                          fontFamily: 'Courier New',
                          fontSize: 16,
                          color: secondaryColor,
                          fontStyle: FontStyle.italic,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'نسبة الحضور ',
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                        'مجموع الحصص ',
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
                ],
              ),
              Column(
                children: [
                  Text(
                    'المباريات ',
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                ],
              ),
            ],
          ),
          Column(
            children: [
              Text(
                'تشكيلة الفريق ',
                style: TextStyle(
                  fontFamily: 'Courier New',
                  fontSize: 14,
                  color: whitefontColor,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                'تشكيلة الفريق حسب التنقيط ',
                style: TextStyle(
                  fontFamily: 'Courier New',
                  fontSize: 12,
                  color: secondaryColor,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                'أرشيف التشكيلات التي لعب بها الفريق',
                style: TextStyle(
                  fontFamily: 'Courier New',
                  fontSize: 12,
                  color: secondaryColor,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PlayerWidget extends StatelessWidget {
  const PlayerWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: const Color(0xff101a24),
        boxShadow: [],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'اللاعبين ',
            style: TextStyle(
              fontFamily: 'Courier New',
              fontSize: 22,
              color: const Color(0xff17bcb5),
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            'اللاعبين المنخرطين و المسجلين لموسم 2020',
            maxLines: 2,
            style: TextStyle(
              fontFamily: 'Courier New',
              fontSize: 12,
              color: secondaryColor,
              fontStyle: FontStyle.italic,
            ),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      'شبان ',
                      style: TextStyle(
                        fontFamily: 'Courier New',
                        fontSize: 16,
                        color: whitefontColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      '22 لاعب',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 12,
                        color: secondaryColor,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'فتيان ',
                      style: TextStyle(
                        fontFamily: 'Courier New',
                        fontSize: 16,
                        color: whitefontColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      '22 لاعب',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 12,
                        color: secondaryColor,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'صغار ',
                      style: TextStyle(
                        fontFamily: 'Courier New',
                        fontSize: 16,
                        color: whitefontColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      '22 لاعب',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 12,
                        color: secondaryColor,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  'بطاقة اللاعب ',
                  style: TextStyle(
                    fontFamily: 'Courier New',
                    fontSize: 18,
                    color: whitefontColor,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text(
                  'بطاقةالمعلومات الشخصية لللاعب. تقيمات المدرب. حسب\n الحضور والانضباط واتقان المركز . ',
                  style: TextStyle(
                    fontFamily: 'Courier New',
                    fontSize: 12,
                    color: secondaryColor,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 4,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TransactionsWidget extends StatefulWidget {
  const TransactionsWidget({Key key, this.incomeSum, this.spendingSum})
      : super(key: key);
  final double incomeSum;
  final double spendingSum;
  @override
  _TransactionsWidgetState createState() => _TransactionsWidgetState();
}

class _TransactionsWidgetState extends State<TransactionsWidget> {
  final CloudDatabase cD = Get.put(CloudDatabase());

  List<ClubSpendings> clubSpendings;

  List<ClubIncome> clubIncome;

  double d = 0;

  double c = 0;
  @override
  void initState() {
    if (widget.incomeSum != null && widget.spendingSum != null) {
      c = widget.incomeSum;
      d = widget.incomeSum;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: const Color(0xff101a24),
        boxShadow: [],
      ),
      child: Column(
        children: [
          Text(
            'المعاملات المالية',
            style: TextStyle(
              fontFamily: 'Courier New',
              fontSize: 20,
              color: const Color(0xff17bcb5),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            width: 160,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 18,
                      color: const Color(0xff2bf08c),
                    ),
                    children: [
                      TextSpan(
                        text:
                            '${widget.incomeSum ?? -widget.spendingSum ?? 0}  ',
                      ),
                      TextSpan(
                        text: 'DH',
                        style: TextStyle(
                          fontFamily: 'Agency FB',
                          color: secondaryColor,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'الميزانية',
                  style: TextStyle(
                    fontFamily: 'Courier New',
                    fontSize: 18,
                    color: whitefontColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Container(
            width: 160,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 18,
                      color: fontColor,
                    ),
                    children: [
                      TextSpan(
                        text: '${widget.spendingSum ?? 0}  ',
                      ),
                      TextSpan(
                        text: 'DH',
                        style: TextStyle(
                          fontFamily: 'Agency FB',
                          color: secondaryColor,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'المصاريف',
                  style: TextStyle(
                    fontFamily: 'Courier New',
                    fontSize: 18,
                    color: whitefontColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Container(
            width: 160,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text.rich(
                      TextSpan(
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 18,
                          color: fontColor,
                        ),
                        children: [
                          TextSpan(
                            text: '$c ',
                          ),
                          TextSpan(
                            text: 'DH',
                            style: TextStyle(
                              fontFamily: 'Agency FB',
                              color: secondaryColor,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'المداخيل ',
                      style: TextStyle(
                        fontFamily: 'Courier New',
                        fontSize: 16,
                        color: whitefontColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  ' ... مقتنيات ومصاريف الفريق و المداخيل',
                  style: TextStyle(
                    fontFamily: 'Courier New',
                    fontSize: 12,
                    color: secondaryColor,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

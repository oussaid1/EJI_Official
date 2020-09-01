import 'package:EJI/models/club_expenses.dart';
import 'package:EJI/repository/cloud_database.dart';
import 'package:EJI/settings/params.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeCards extends StatefulWidget {
  @override
  _HomeCardsState createState() => _HomeCardsState();
}

class _HomeCardsState extends State<HomeCards> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: primaryColor,
      body: ListView(padding: EdgeInsets.all(4), children: [
        TransactionsWidget(),
        PlayerWidget(),
        TeamWidget(),
        TeamBoardWidget(),
        AdministrationWidget(),
        DocumentsWidget(),
      ]),
    );
  }
}

class AdministrationWidget extends StatelessWidget {
  const AdministrationWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: const Color(0xff101a24),
          boxShadow: [
            BoxShadow(
              color: const Color(0xff17bcb5),
              offset: Offset(0, 0),
              blurRadius: 4,
            ),
          ],
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
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: const Color(0xff101a24),
          boxShadow: [
            BoxShadow(
              color: const Color(0xff17bcb5),
              offset: Offset(0, 0),
              blurRadius: 4,
            ),
          ],
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
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: const Color(0xff101a24),
          boxShadow: [
            BoxShadow(
              color: const Color(0xff17bcb5),
              offset: Offset(0, 0),
              blurRadius: 4,
            ),
          ],
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
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: const Color(0xff101a24),
          boxShadow: [
            BoxShadow(
              color: const Color(0xff17bcb5),
              offset: Offset(0, 0),
              blurRadius: 4,
            ),
          ],
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        width: 190,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: const Color(0xff101a24),
          boxShadow: [
            BoxShadow(
              color: const Color(0xff17bcb5),
              offset: Offset(0, 0),
              blurRadius: 4,
            ),
          ],
        ),
        child: Column(
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
      ),
    );
  }
}

class TransactionsWidget extends StatefulWidget {
  const TransactionsWidget({
    Key key,
  }) : super(key: key);

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
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: cD.getClubIncomes(),
        builder: (context, AsyncSnapshot<List<ClubIncome>> snapshot) {
          if (!snapshot.hasData || snapshot.hasError) {
            c = 0;
          }

          clubIncome = snapshot.data;
          c = ClubIncome.getIncome(clubIncome);
          return StreamBuilder(
              stream: cD.getClubSpendings(),
              builder: (context, AsyncSnapshot<List<ClubSpendings>> snapshot) {
                if (!snapshot.hasData || snapshot.hasError) {
                  d = 0;
                } else
                  clubSpendings = snapshot.data;
                d = cD.setBudget(ClubSpendings.getSpendings(clubSpendings));
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: const Color(0xff101a24),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xff17bcb5),
                          offset: Offset(0, 0),
                          blurRadius: 4,
                        ),
                      ],
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                    text: '${c - d}  ',
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
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                        text: '$d  ',
                                      ),
                                      TextSpan(
                                        text: ' ',
                                        style: TextStyle(
                                          color: const Color(0xff2bf08c),
                                        ),
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
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                        text: ' ',
                                        style: TextStyle(
                                          color: const Color(0xff2bf08c),
                                        ),
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
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                ' ... مقتنيات ومصاريف الفريق و المداخيل',
                                maxLines: 2,
                                style: TextStyle(
                                  fontFamily: 'Courier New',
                                  fontSize: 12,
                                  color: secondaryColor,
                                  fontStyle: FontStyle.italic,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              });
        });
  }
}

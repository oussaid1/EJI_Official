import 'package:EJI/models/club_expenses.dart';
import 'package:EJI/repository/cloud_database.dart';
import 'package:EJI/screens/admin_access/club_transactions.dart';
import 'package:EJI/screens/common/announces_screen.dart';
import 'package:EJI/screens/common/comments_screen.dart';
import 'package:EJI/settings/params.dart';
import 'package:EJI/shared/drawer_main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FinancePage extends StatefulWidget {
  @override
  _FinancePageState createState() => _FinancePageState();
}

class _FinancePageState extends State<FinancePage> {
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  final CloudDatabase cD = Get.put(CloudDatabase());

  List<ClubSpendings> clubSpendings;

  List<ClubIncome> clubIncome;

  double d = 0;

  double c = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MyDrawer(),
        key: _scaffoldKey,
        backgroundColor: primaryColor,
        body: StreamBuilder(
            stream: null,
            builder: (context, snapshot) {
              return Stack(children: [
                StreamBuilder(
                    stream: cD.getClubIncomes(),
                    builder:
                        (context, AsyncSnapshot<List<ClubIncome>> snapshot) {
                      if (!snapshot.hasData || snapshot.hasError) {
                        return new Container();
                      } else
                        clubIncome = snapshot.data;
                      c = ClubIncome.getIncome(clubIncome);
                      return new Container();
                    }),
                StreamBuilder(
                    stream: cD.getClubSpendings(),
                    builder:
                        (context, AsyncSnapshot<List<ClubSpendings>> snapshot) {
                      if (!snapshot.hasData || snapshot.hasError) {
                        return new Container();
                      } else
                        clubSpendings = snapshot.data;
                      d = ClubSpendings.getSpendings(clubSpendings);
                      return new Container();
                    }),
                Positioned(
                  top: 10,
                  left: 1,
                  height: 240,
                  child: Container(
                    width: Get.width - 2,
                    child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                        child: Image.asset('assets/images/finance.png',
                            fit: BoxFit.fill)),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 10,
                  child: Container(
                    width: 50,
                    child: IconButton(
                      onPressed: () => _scaffoldKey.currentState.openDrawer(),
                      icon: Icon(
                        Icons.menu,
                        color: primaryColor,
                        size: 30,
                      ),
                    ),
                  ),
                ),
                Positioned(
                    top: Get.height / 4.2,
                    width: Get.width - 20,
                    left: 10,
                    height: 220,
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: secondaryColor),
                        color: const Color(0xff101a24).withOpacity(0.8),
                        boxShadow: [],
                      ),
                      child: Column(
                        children: [
                          Text(
                            'المعاملات المالية',
                            style: TextStyle(
                              fontFamily: 'Courier New',
                              fontSize: 28,
                              color: const Color(0xff17bcb5),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Container(
                            width: 260,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text.rich(
                                  TextSpan(
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 20,
                                      color: const Color(0xff2bf08c),
                                    ),
                                    children: [
                                      TextSpan(
                                        text: '${c - d} ',
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
                                    fontSize: 20,
                                    color: whitefontColor,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 260,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text.rich(
                                  TextSpan(
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 20,
                                      color: fontColor,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: '$d ',
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
                                    fontSize: 20,
                                    color: whitefontColor,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 260,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text.rich(
                                      TextSpan(
                                        style: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontSize: 20,
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
                                        fontSize: 20,
                                        color: whitefontColor,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 120,
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.arrow_back,
                                            color: accentColor,
                                          ),
                                          FlatButton(
                                            onPressed: () =>
                                                Get.to(ClubTransactions()),
                                            child: Text(
                                              'تفاصيل ',
                                              style: TextStyle(
                                                fontFamily: 'Courier New',
                                                fontSize: 14,
                                                color: fontColor,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        ' ... مقتنيات ومصاريف و مداخيل الفريق ',
                                        style: TextStyle(
                                          fontFamily: 'Courier New',
                                          fontSize: 14,
                                          color: secondaryColor,
                                          fontStyle: FontStyle.italic,
                                        ),
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
                new Positioned(
                  bottom: 80,
                  width: Get.width - 20,
                  left: 10,
                  height: 240,
                  child: Container(
                    height: 160,
                    decoration: BoxDecoration(
                      border: Border.all(color: secondaryColor),
                      borderRadius: BorderRadius.circular(10.0),
                      color: const Color(0xff101a24),
                      boxShadow: [],
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'إعلانات واقتراحات و ملاحظات',
                              style: TextStyle(
                                fontFamily: 'Courier New',
                                fontSize: 14,
                                color: secondaryColor,
                                fontStyle: FontStyle.italic,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              'سبورة الفريق',
                              style: TextStyle(
                                fontFamily: 'Amiri',
                                fontSize: 28,
                                color: const Color(0xff17bcb5),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        FlatButton(
                          onPressed: () => Get.to(AnouncesScreen()),
                          child: Text(
                            'إعلانات ',
                            style: TextStyle(
                              fontFamily: 'Courier New',
                              fontSize: 20,
                              color: whitefontColor,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Text(
                          'اعلانات المكتب المسير للفريف ، للاعبين ، والعامة ... ',
                          style: TextStyle(
                            fontFamily: 'Courier New',
                            fontSize: 16,
                            color: secondaryColor,
                            fontStyle: FontStyle.italic,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        FlatButton(
                          onPressed: () => Get.to(CommentScreen()),
                          child: Text(
                            'اقتراحات و ملاحظات',
                            style: TextStyle(
                              fontFamily: 'Courier New',
                              fontSize: 20,
                              color: whitefontColor,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Text(
                          'يحق لكل منخرط اولاعب او غيرهما الادلاء باقتراحاته ونلاحظاته للفريق والمسيرين .ويتم الإجابة عليها من قبل المكتب .  ',
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
                  ),
                )
              ]);
            }));
  }
}

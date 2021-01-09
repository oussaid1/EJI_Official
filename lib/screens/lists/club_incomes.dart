import 'package:EJI/controllers/finance/finance_controller.dart';
import 'package:EJI/controllers/variables/variables_controler.dart';
import 'package:EJI/models/finance/club_expenses.dart';
import 'package:EJI/repository/cloud_database.dart';
import 'package:EJI/screens/add/add_income.dart';
// ignore: unused_import
import 'package:EJI/screens/add/add_spendings.dart';
import 'package:EJI/settings/params.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClubIncomeScreen extends StatefulWidget {
  ClubIncomeScreen({Key key}) : super(key: key);
  @override
  _ClubIncomeScreenState createState() => _ClubIncomeScreenState();
}

class _ClubIncomeScreenState extends State<ClubIncomeScreen> {
  List<ClubIncome> clubIncome;
  List<ClubIncome> selectedclubIncome;
  bool sort;
  int rowIndex;
  final varController = Get.put(VariablesControler());

  final db = CloudDatabase();
  @override
  void initState() {
    sort = false;
    selectedclubIncome = [];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: varController.isAdmin.value
          ? Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 50),
              child: FloatingActionButton(
                elevation: 8,
                onPressed: () {
                  Get.defaultDialog(
                    title: 'AddIncome'.tr,
                    content: Expanded(child: AddIncome()),
                  );
                },
                child: Icon(
                  Icons.add,
                  size: 40,
                  color: primaryColor,
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(100.0))),
              ),
            )
          : null,
      body: Center(
        child: StreamBuilder(
            stream: db.getClubIncomes(),
            builder: (context, AsyncSnapshot<List<ClubIncome>> snapshot) {
              if (!snapshot.hasData || snapshot.hasError) {
                return Container(
                  child: Icon(Icons.list),
                );
              } else
                clubIncome = snapshot.data;
              return ListView(
                children: [
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: DataTable(
                      columnSpacing: 12,
                      dividerThickness: 2,
                      horizontalMargin: 12,
                      sortColumnIndex: 3,
                      sortAscending: true,
                      columns: [
                        DataColumn(
                          tooltip: 'For',
                          label: Text(
                            "GivenFor".tr,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: secondaryColor),
                          ),
                          numeric: false,
                        ),
                        DataColumn(
                          label: Text(
                            "GivenBy".tr,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: secondaryColor),
                          ),
                          numeric: false,
                        ),
                        DataColumn(
                          label: Text(
                            "GivenOnDate".tr,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: secondaryColor),
                          ),
                          numeric: false,
                        ),
                        DataColumn(
                          label: Text(
                            "GivenAmount".tr,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: secondaryColor),
                          ),
                          numeric: false,
                        ),
                      ],
                      rows: clubIncome
                          .map(
                            (clubIncome) => DataRow(
                                selected: selectedclubIncome.contains(clubIncome),
                                cells: [
                                  DataCell(Text(clubIncome.givenFor.toString()),
                                      onTap: () => varController.isAdmin.value
                                          ? Get.to(AddIncome(
                                              clubIncome: clubIncome,
                                            ))
                                          : null),
                                  DataCell(
                                    Text(clubIncome.givenBy.toString()),
                                  ),
                                  DataCell(
                                    Text(clubIncome.givenOnDate.toString()),
                                  ),
                                  DataCell(
                                    Text(
                                      clubIncome.givenAmount.toString(),
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w900,
                                        color: primaryColor,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ]),
                          )
                          .toList(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${ClubIncome.getIncome(clubIncome).toString()}'.tr,
                          style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w900,
                              color: secondaryColor),
                        ),
                        Text(
                          'Total'.tr,
                          style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w900,
                              color: secondaryColor),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                ],
              );
            }),
      ),
    );
  }
}

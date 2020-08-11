import 'package:EJI/model/club_expenses.dart';
import 'package:EJI/repository/cloud_database.dart';
import 'package:EJI/screens/admin_access/add_income.dart';
// ignore: unused_import
import 'package:EJI/screens/admin_access/add_spendings.dart';
import 'package:EJI/settings/params.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
  final CloudDatabase c = Get.put(CloudDatabase());
  @override
  void initState() {
    sort = false;
    selectedclubIncome = [];
    //clubSpendings = ClubSpendings.getSpendings();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:c.isAdmin.value ?  Padding(
        padding: const EdgeInsets.only(bottom: 100),
        child: FloatingActionButton(
          elevation: 8,
          onPressed: () {
             Get.defaultDialog(
                  title: 'AddIncome'.tr,
                  content: Expanded(child: AddIncome()),
                );
          },
          child: Icon(
            FontAwesomeIcons.dollarSign,
            size: 36,
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16.0))),
        ),
      ): null,
      
      body: Center(
        child: StreamBuilder(
            stream: c.getClubIncomes('ClubIncome'),
            builder: (context, AsyncSnapshot<List<ClubIncome>> snapshot) {
              if (!snapshot.hasData || snapshot.hasError) {
                return Container(
                  child: Icon(Icons.list),
                );
              } else
                clubIncome = snapshot.data;
              return Column(
                children: [
                  DataTable(
                    columnSpacing: 20,
                    dividerThickness: 2,
                    horizontalMargin: 12,
                    sortColumnIndex: 3,
                    sortAscending: true,
                    columns: [
                      DataColumn(
                        tooltip: 'kk',
                        label: Text(
                          "GivenFor".tr,
                          style: subtext2xy,
                        ),
                        numeric: false,
                      ),
                      DataColumn(
                        label: Text(
                          "GivenBy".tr,
                          style: subtext2xy,
                        ),
                        numeric: false,
                      ),
                      DataColumn(
                        label: Text(
                          "GivenOnDate".tr,
                          style: subtext2xy,
                        ),
                        numeric: false,
                      ),
                      DataColumn(
                        label: Text(
                          "GivenAmount".tr,
                          style: subtext2xy,
                        ),
                        numeric: false,
                      ),
                    ],
                    rows: clubIncome
                        .map(
                          (clubIncome) => DataRow(
                              selected: selectedclubIncome.contains(clubIncome),
                              cells: [
                                DataCell(
                                  Text(clubIncome.givenFor.toString()),
                                  onTap: () => c.isAdmin.value ?
                                    Get.to(AddIncome(
                                      clubIncome: clubIncome,
                                    )): null 
                                  
                                ),
                                DataCell(
                                  Text(clubIncome.givenBy.toString()),
                                ),
                                DataCell(
                                  Text(clubIncome.givenOnDate.toString()),
                                ),
                                DataCell(
                                  Text(clubIncome.givenAmount.toString()),
                                ),
                              ]),
                        )
                        .toList(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total'.tr,
                          style: maintext2,
                        ),
                        Text(
                          '${ClubIncome.getIncome(clubIncome).toString()}'.tr,
                          style: maintext2,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}

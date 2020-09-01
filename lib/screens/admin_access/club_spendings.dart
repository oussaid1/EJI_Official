import 'package:EJI/models/club_expenses.dart';
import 'package:EJI/repository/cloud_database.dart';
import 'package:EJI/screens/admin_access/add_spendings.dart';
import 'package:EJI/settings/params.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClubSpendingsScreen extends StatefulWidget {
  ClubSpendingsScreen({Key key}) : super(key: key);

  @override
  _ClubSpendingsScreenState createState() => _ClubSpendingsScreenState();
}

class _ClubSpendingsScreenState extends State<ClubSpendingsScreen> {
  List<ClubSpendings> clubSpendings;
  List<ClubSpendings> selectedclubSpendings;
  bool sort;
  int rowIndex;
  final CloudDatabase c = Get.put(CloudDatabase());
  @override
  void initState() {
    sort = false;
    selectedclubSpendings = [];
    //clubSpendings = ClubSpendings.getSpendings();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StreamBuilder(
            stream: c.getClubSpendings(),
            builder: (context, AsyncSnapshot<List<ClubSpendings>> snapshot) {
              if (!snapshot.hasData || snapshot.hasError) {
                return Container(
                  child: Icon(Icons.list),
                );
              } else
                clubSpendings = snapshot.data;
              return ListView(
                children: [
                  DataTable(
                    columnSpacing: 20,
                    dividerThickness: 2,
                    horizontalMargin: 12,
                    sortColumnIndex: 3,
                    sortAscending: true,
                    columns: [
                      DataColumn(
                        label: Text(
                          "spentOn".tr,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                              color: secondaryColor),
                        ),
                        numeric: false,
                      ),
                      DataColumn(
                        label: Text(
                          "spentBy".tr,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                              color: secondaryColor),
                        ),
                        numeric: false,
                      ),
                      DataColumn(
                        label: Text(
                          "spentOnDate".tr,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                              color: secondaryColor),
                        ),
                        numeric: false,
                      ),
                      DataColumn(
                        label: Text(
                          "spentAmount".tr,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                              color: secondaryColor),
                        ),
                        numeric: false,
                      ),
                    ],
                    rows: clubSpendings
                        .map(
                          (clubSpendings) => DataRow(
                              selected:
                                  selectedclubSpendings.contains(clubSpendings),
                              cells: [
                                DataCell(
                                  Text(clubSpendings.spentOn.toString()),
                                  onTap: () {
                                    Get.to(AddSpendings(
                                      clubSpendings: clubSpendings,
                                    ));
                                  },
                                ),
                                DataCell(
                                  Text(clubSpendings.spentBy.toString()),
                                ),
                                DataCell(
                                  Text(clubSpendings.spentOnDate.toString()),
                                ),
                                DataCell(
                                  Text(clubSpendings.spentAmount.toString()),
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
                          '${ClubSpendings.getSpendings(clubSpendings).toString()}'
                              .tr,
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
                ],
              );
            }),
      ),
      floatingActionButton: c.isAdmin.value
          ? Padding(
              padding: const EdgeInsets.only(bottom: 100),
              child: FloatingActionButton(
                elevation: 8,
                onPressed: () {
                  Get.defaultDialog(
                    title: 'AddSpendings'.tr,
                    content: Expanded(child: AddSpendings()),
                  );
                },
                child: Icon(
                  Icons.add_shopping_cart,
                  size: 36,
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16.0))),
              ),
            )
          : null,
    );
  }
}

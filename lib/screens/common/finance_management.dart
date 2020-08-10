import 'package:EJI/model/club_expenses.dart';
import 'package:EJI/repository/cloud_database.dart';
import 'package:EJI/screens/admin_access/add_spendings.dart';
import 'package:EJI/settings/params.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClubFinanceScreen extends StatefulWidget {
  ClubFinanceScreen({Key key}) : super(key: key);

  @override
  _ClubFinanceScreenState createState() => _ClubFinanceScreenState();
}

class _ClubFinanceScreenState extends State<ClubFinanceScreen> {
  List<ClubSpendings> clubSpendings;
  List<ClubSpendings> selectedclubSpendings;
  bool sort;
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
      appBar: AppBar(
        actions: [
          IconButton(
                    onPressed: () {Get.to(AddSpendings());},
                    icon: Icon(Icons.add_to_home_screen),
                  ),
          IconButton(
              icon: Icon(Icons.add_shopping_cart, color: Colors.yellow),
              onPressed: () {
                Get.defaultDialog(

                  confirm: RaisedButton(
                    onPressed: () {},
                    child: Text('Add'),
                  ),
                  cancel: RaisedButton(
                    onPressed: () {},
                    child: Text('Cancel'),
                  ),
                );
              })
        ],
      ),
      body: Center(
        child: StreamBuilder(
            stream: c.getClubSpendings('ClubSpendings'),
            builder: (context, AsyncSnapshot<List<ClubSpendings>> snapshot) {
              if (!snapshot.hasData || snapshot.hasError) {
                return Container(
                  child: Icon(Icons.list),
                );
              } else
                clubSpendings = snapshot.data;
              return Column(
                children: [
                  DataTable(
                    columns: [
                      DataColumn(
                        label: Text("spentOn"),
                        numeric: false,
                      ),
                      DataColumn(
                        label: Text("spentBy"),
                        numeric: false,
                      ),
                      DataColumn(
                        label: Text("spentOnDate"),
                        numeric: false,
                      ),
                      DataColumn(
                        label: Text("spentAmunt"),
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
                                    // write your code..
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
                ],
              );
            }),
      ),
    );
  }
}

import 'package:EJI/repository/cloud_database.dart';
import 'package:EJI/screens/admin_access/admin_drawer.dart';
import 'package:EJI/screens/admin_access/club_incomes.dart';
import 'package:EJI/screens/admin_access/club_spendings.dart';
import 'package:EJI/shared/drawer_main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClubTransactions extends StatelessWidget {
  ClubTransactions({Key key}) : super(key: key);

  final TextEditingController codeControler = TextEditingController();
  final CloudDatabase c = Get.put(CloudDatabase());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: c.isAdmin.value ? AdminDrawer() : MyDrawer(),
        appBar: AppBar(
          
          elevation: 0,
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.monetization_on),text: ('Incomes'.tr),),
              Tab(icon: Icon(Icons.money_off),text: ('Spendings'.tr),),
            ],
          ),
        ), 
        body: TabBarView(
          children: [
            
            ClubIncomeScreen(),
            ClubSpendingsScreen(),
          ],
        ),
      ),
    );
  }
}

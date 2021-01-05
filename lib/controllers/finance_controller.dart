import 'package:EJI/models/finance/club_expenses.dart';
import 'package:EJI/repository/cloud_database.dart';
import 'package:get/get.dart';

class FinanceController extends GetxController {

  Rx<List<ClubSpendings>> _spendingsList = Rx<List<ClubSpendings>>();
  Rx<List<ClubIncome>> _incomesList = Rx<List<ClubIncome>>();

  List<ClubSpendings> get spendings => _spendingsList.value;
  List<ClubIncome> get incomes => _incomesList.value;

  @override
  void onInit() {
   _incomesList.bindStream(CloudDatabase().getClubIncomes());
   _spendingsList.bindStream(CloudDatabase().getClubSpendings());
    super.onInit();
  }

}
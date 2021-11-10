import 'package:get/get.dart';
import 'package:personal_portfolio/models/balanceApp_user_model.dart';
import 'package:personal_portfolio/models/balance_model.dart';

class BudgetAppController extends GetxController {
  List<String> balanceTexts = ['Total Balance', 'Total Money', 'Total Loan'];

  BalanceAppUserModel balanceAppUserModel = BalanceAppUserModel(
      name: 'Onur', balance: 2350, loan: 850, movements: []);

  double get userTotalBalance =>
      (balanceAppUserModel.balance) + (balanceAppUserModel.loan);

  double get loanRad => 360 - balanceRad;

  double get balanceRad =>
      (balanceAppUserModel.balance / balanceAppUserModel.loan) * 90;

  double get balance => balanceAppUserModel.balance;
  double get loan => balanceAppUserModel.loan;
}

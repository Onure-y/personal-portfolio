import 'package:flutter/material.dart';
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

  ScrollController scrollController = new ScrollController();

  int currentIndex = 0;

  bool isMenuOpen = false;

  void changeMenuState() {
    isMenuOpen = !isMenuOpen;
    update();
  }

  void moveToRight(double offSet) {
    double currentOffset = currentIndex == 2 ? 0 : offSet * (currentIndex + 1);
    print('currentindex = $currentIndex currentOffset = $currentOffset');
    scrollController.animateTo(currentOffset,
        duration: Duration(milliseconds: 900), curve: Curves.easeInOut);
    currentIndex != 2 ? currentIndex++ : currentIndex = 0;
  }

  void moveToLeft(double offSet) {
    double currentOffset =
        currentIndex == 0 ? offSet * 2 : offSet * (currentIndex - 1);
    print('currentindex = $currentIndex currentOffset = $currentOffset');
    scrollController.animateTo(currentOffset,
        duration: Duration(milliseconds: 900), curve: Curves.easeInOut);
    currentIndex != 0 ? currentIndex-- : currentIndex = 2;
  }
}

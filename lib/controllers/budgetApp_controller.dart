import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_portfolio/components/BudgetAppComp/interaction_comp.dart';
import 'package:personal_portfolio/models/balanceApp_user_model.dart';

class BudgetAppController extends GetxController {
  List<String> balanceTexts = ['Total Balance', 'Total Money', 'Total Loan'];

  BalanceAppUserModel balanceAppUserModel = BalanceAppUserModel(
      name: 'Onur', balance: 2350, loan: 850, movements: []);

  List<InteractionComp> allTransactions = [
    InteractionComp(text: 'Rise Software', money: '735', isLoan: false),
    InteractionComp(text: 'Ensar Batuhan', money: '1150', isLoan: true),
    InteractionComp(text: 'Extra Software', money: '345', isLoan: false),
  ];

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
  bool isAddTransactionPageOpen = false;

  void changeMenuState() {
    isMenuOpen = !isMenuOpen;
    update();
  }

  void changeAddTransactionPageState() {
    isMenuOpen = !isMenuOpen;
    isAddTransactionPageOpen = !isAddTransactionPageOpen;
    update();
  }

  void moveToRight(double offSet) {
    double currentOffset = currentIndex == 2 ? 0 : offSet * (currentIndex + 1);
    scrollController.animateTo(currentOffset,
        duration: Duration(milliseconds: 900), curve: Curves.easeInOut);
    currentIndex != 2 ? currentIndex++ : currentIndex = 0;
  }

  void moveToLeft(double offSet) {
    double currentOffset =
        currentIndex == 0 ? offSet * 2 : offSet * (currentIndex - 1);
    scrollController.animateTo(currentOffset,
        duration: Duration(milliseconds: 900), curve: Curves.easeInOut);
    currentIndex != 0 ? currentIndex-- : currentIndex = 2;
  }

  void addInteractionToList() {}
}

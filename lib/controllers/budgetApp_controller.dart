import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_portfolio/components/BudgetAppComp/interaction_comp.dart';
import 'package:personal_portfolio/models/balanceApp_user_model.dart';
import 'package:personal_portfolio/models/keyboardNum_model.dart';

class BudgetAppController extends GetxController {
  List<String> balanceTexts = ['Total Balance', 'Total Money', 'Total Loan'];

  BalanceAppUserModel balanceAppUserModel = BalanceAppUserModel(
      name: 'Onur', balance: 2350, loan: 850, movements: []);

  List<KeyboardNumModel> numKeyboards = [
    KeyboardNumModel(text: '1', value: '1', isNumber: true),
    KeyboardNumModel(text: '2', value: '2', isNumber: true),
    KeyboardNumModel(text: '3', value: '3', isNumber: true),
    KeyboardNumModel(text: '', value: '0', isNumber: false),
    KeyboardNumModel(text: '4', value: '4', isNumber: true),
    KeyboardNumModel(text: '5', value: '5', isNumber: true),
    KeyboardNumModel(text: '6', value: '6', isNumber: true),
    KeyboardNumModel(text: '', value: '0', isNumber: false),
    KeyboardNumModel(text: '7', value: '7', isNumber: true),
    KeyboardNumModel(text: '8', value: '8', isNumber: true),
    KeyboardNumModel(text: '9', value: '9', isNumber: true),
    KeyboardNumModel(text: '', value: '0', isNumber: false),
    KeyboardNumModel(text: '', value: '0', isNumber: false),
    KeyboardNumModel(text: '0', value: '0', isNumber: true),
    KeyboardNumModel(text: '', value: '0', isNumber: false),
    KeyboardNumModel(text: 'OK', value: '0', isNumber: false),
  ];

  List<InteractionComp> allTransactions = [
    InteractionComp(text: 'Rise Software', money: '735', isLoan: false),
    InteractionComp(text: 'Ensar Batuhan', money: '1150', isLoan: true),
    InteractionComp(text: 'Extra Software', money: '345', isLoan: false),
  ];

  List<String> transactionBalanceList = [];
  String priceValue = '';

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

  TextEditingController priceController = TextEditingController();

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

  void addValueToTransactionList(String value) {
    transactionBalanceList.add(value);
    updatePriceValue();
    update();
  }

  void updatePriceValue() {
    priceValue = transactionBalanceList.join('');
    update();
  }

  void addInteractionToList() {}
}

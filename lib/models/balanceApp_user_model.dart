import 'package:personal_portfolio/models/movements_model.dart';

class BalanceAppUserModel {
  String name;
  double balance;
  double loan;
  List<MovementModel> movements;

  BalanceAppUserModel({
    required this.name,
    required this.balance,
    required this.loan,
    required this.movements,
  });
}

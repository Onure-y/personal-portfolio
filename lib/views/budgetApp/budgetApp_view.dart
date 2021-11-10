import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_portfolio/components/BudgetAppComp/budgetAppContainer_comp.dart';
import 'package:personal_portfolio/components/BudgetAppComp/myPainter_comp.dart';
import 'package:personal_portfolio/constants.dart';
import 'package:personal_portfolio/controllers/budgetApp_controller.dart';
import 'package:personal_portfolio/models/balance_model.dart';

class BudgetAppHomeScreen extends StatelessWidget {
  const BudgetAppHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<BudgetAppController>(
        init: BudgetAppController(),
        builder: (BudgetAppController controller) {
          return Container(
            height: size.height * 0.85 - 100,
            width: ((size.width - 100) / 2) * 0.415,
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                  image: AssetImage('images/budget-bg-1.png'),
                  fit: BoxFit.fill),
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  width: ((size.width - 100) / 2) * 0.415,
                  height: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.person),
                      Text('Onur', style: navBarTextStyle),
                      Icon(Icons.settings),
                    ],
                  ),
                ),
                Container(
                  height: 210,
                  width: size.width * 4,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      BudgetAppContainer(
                        balanceModel: BalanceModel(
                          text: 'Total Money',
                          totalBalance: controller.balance,
                          balanceRad: 360,
                          loanRad: 0,
                        ),
                      ),
                      BudgetAppContainer(
                        balanceModel: BalanceModel(
                          text: 'Total Balance',
                          totalBalance: controller.userTotalBalance,
                          balanceRad: controller.balanceRad,
                          loanRad: controller.loanRad,
                        ),
                      ),
                      BudgetAppContainer(
                        balanceModel: BalanceModel(
                          text: 'Total Loan',
                          totalBalance: controller.loan,
                          balanceRad: 0,
                          loanRad: 360,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}

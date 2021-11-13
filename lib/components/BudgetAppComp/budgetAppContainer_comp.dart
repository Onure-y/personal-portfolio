import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_portfolio/components/BudgetAppComp/myPainter_comp.dart';
import 'package:personal_portfolio/constants.dart';
import 'package:personal_portfolio/controllers/budgetApp_controller.dart';
import 'package:personal_portfolio/models/balance_model.dart';

class BudgetAppContainer extends StatelessWidget {
  const BudgetAppContainer({Key? key, required this.balanceModel})
      : super(key: key);
  final BalanceModel balanceModel;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GetBuilder<BudgetAppController>(
        init: BudgetAppController(),
        builder: (BudgetAppController controller) {
          return Container(
            height: 180,
            width: ((size.width - 100) / 2) * 0.415,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    icon: Icon(Icons.arrow_left),
                    onPressed: () {
                      controller.moveToLeft(((size.width - 100) / 2) * 0.415);
                    }),
                Container(
                  height: 200,
                  width: 170,
                  child: Column(
                    children: [
                      Container(
                        height: 170,
                        width: 170,
                        child: CustomPaint(
                          child: Center(
                              child: Text(
                                  '${balanceModel.totalBalance.toStringAsFixed(2)} TL',
                                  style: budgetTextStyle,
                                  textAlign: TextAlign.center)),
                          painter: MySecondaryPainter(
                              balanceModel.loanRad, Colors.yellow),
                          foregroundPainter: MyPainter(
                            balanceModel.balanceRad,
                            Color(0xff298BFE),
                          ),
                        ),
                      ),
                      Text(balanceModel.text, style: budgetTextStyle),
                    ],
                  ),
                ),
                IconButton(
                    icon: Icon(Icons.arrow_right),
                    onPressed: () {
                      controller.moveToRight(((size.width - 100) / 2) * 0.415);
                    }),
              ],
            ),
          );
        });
  }
}

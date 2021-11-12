import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_portfolio/constants.dart';
import 'package:personal_portfolio/controllers/budgetApp_controller.dart';

class BudgetAppAddTransactionScreen extends StatelessWidget {
  const BudgetAppAddTransactionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<BudgetAppController>(
        init: BudgetAppController(),
        builder: (BudgetAppController controller) {
          return Container(
            height: size.height * 0.85 - 100,
            width: ((size.width - 100) / 2) * 0.415,
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  width: ((size.width - 100) / 2) * 0.415,
                  height: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        child: Icon(Icons.arrow_back),
                        onTap: () {
                          controller.changeAddTransactionPageState();
                        },
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text('Add Transaction', style: menuTitleTextStyle),
                    ],
                  ),
                ),
                Flexible(
                  child: Container(
                    width: ((size.width - 100) / 2) * 0.415,
                    color: Colors.blue,
                    child: Column(
                      children: [],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}

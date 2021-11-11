import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:personal_portfolio/components/BudgetAppComp/budgetAppContainer_comp.dart';
import 'package:personal_portfolio/components/BudgetAppComp/interaction_comp.dart';
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
                      InkWell(
                        child: Icon(Icons.person),
                        onTap: () {
                          controller.changeMenuState();
                        },
                      ),
                      Text('Onur', style: navBarTextStyle),
                      Icon(Icons.settings),
                    ],
                  ),
                ),
                Container(
                  height: 210,
                  width: size.width * 4,
                  child: CustomScrollView(
                    controller: controller.scrollController,
                    scrollDirection: Axis.horizontal,
                    physics: NeverScrollableScrollPhysics(),
                    slivers: [
                      SliverFixedExtentList(
                          delegate: SliverChildListDelegate([
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
                                text: 'Total Money',
                                totalBalance: controller.balance,
                                balanceRad: 360,
                                loanRad: 0,
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
                          ]),
                          itemExtent: ((size.width - 100) / 2) * 0.415)
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    width: ((size.width - 100) / 2) * 0.415,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Last Interaction',
                            style: intreactionTitleTextStyle),
                        Divider(),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InteractionComp(
                                  text: 'Rise Software',
                                  money: '350',
                                  isLoan: false),
                              SizedBox(
                                height: 10,
                              ),
                              InteractionComp(
                                  text: 'Ensar Batuhan',
                                  money: '760',
                                  isLoan: true),
                              SizedBox(
                                height: 10,
                              ),
                              InteractionComp(
                                  text: 'Extra Software',
                                  money: '250',
                                  isLoan: false),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}

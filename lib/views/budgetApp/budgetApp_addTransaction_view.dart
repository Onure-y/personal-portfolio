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
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            width: ((size.width - 100) / 2) * 0.415,
                            height: 150,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(50.0),
                                  child: TextFormField(
                                    enabled: false,
                                    controller: controller.priceController,
                                    decoration: InputDecoration(
                                      labelText: controller.priceValue,
                                      labelStyle: numKeyboardsStyle,
                                      suffixText: 'TL',
                                      isDense: true,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Spacer(),
                        Container(
                          width: ((size.width - 100) / 2) * 0.415,
                          child: GridView.count(
                            crossAxisCount: 4,
                            shrinkWrap: true,
                            children: List.generate(
                              16,
                              (index) {
                                return Material(
                                  child: InkWell(
                                    onTap: controller
                                                .numKeyboards[index].text ==
                                            ''
                                        ? null
                                        : controller.numKeyboards[index].text !=
                                                'OK'
                                            ? () => controller
                                                .addValueToTransactionList(
                                                    controller
                                                        .numKeyboards[index]
                                                        .text)
                                            : () {},
                                    child: Container(
                                      child: Center(
                                        child: Text(
                                          controller.numKeyboards[index].text,
                                          style: numKeyboardsStyle,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
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

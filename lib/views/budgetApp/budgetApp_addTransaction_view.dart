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
                            child: Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  TextFormField(
                                    controller: controller.sourceNameController,
                                    decoration: InputDecoration(
                                      labelText: 'Source Name',
                                      isDense: true,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0),
                                    child: TextFormField(
                                      enabled: false,
                                      controller: controller.priceController,
                                      decoration: InputDecoration(
                                        labelText: controller.priceValue,
                                        labelStyle: numKeyboardsStyle,
                                        isDense: true,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
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
                                            ? controller.numKeyboards[index]
                                                        .text ==
                                                    '<-'
                                                ? () => controller
                                                    .deleteValueFromTransactionList()
                                                : () => controller
                                                    .addValueToTransactionList(
                                                        controller
                                                            .numKeyboards[index]
                                                            .text)
                                            : () {
                                                String text = controller
                                                    .sourceNameController.text;
                                                String money =
                                                    controller.priceValue;
                                                bool isLoan = false;
                                                controller.addInteractionToList(
                                                    text, money, isLoan);
                                              },
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

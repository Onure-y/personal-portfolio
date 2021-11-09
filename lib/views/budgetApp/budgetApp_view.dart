import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_portfolio/components/BudgetAppComp/myPainter_comp.dart';
import 'package:personal_portfolio/constants.dart';

class BudgetAppHomeScreen extends StatelessWidget {
  const BudgetAppHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.85 - 100,
      width: ((size.width - 100) / 2) * 0.415,
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
            image: AssetImage('images/budget-bg-1.png'), fit: BoxFit.fill),
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
          Center(
            child: Container(
              height: 200,
              width: (((size.width - 100) / 2) * 0.415) * 0.7,
              child: CustomPaint(
                child: Center(child: Text('2100', textAlign: TextAlign.center)),
                painter: MySecondaryPainter(110, Colors.yellow),
                foregroundPainter: MyPainter(250.0, Color(0xff298BFE)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

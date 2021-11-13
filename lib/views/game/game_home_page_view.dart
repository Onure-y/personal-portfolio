import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_portfolio/constants.dart';
import 'package:personal_portfolio/controllers/game_controller.dart';

class GameHomeScreen extends GetWidget<GameController> {
  const GameHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.85 - 100,
      width: ((size.width - 100) / 2) * 0.415,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/bg-3.gif'), fit: BoxFit.fill),
      ),
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.55,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                controller.changeGameState();
              },
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(120, 60), primary: mainButtonColor),
              child: Text(
                'Play',
                style: primaryTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

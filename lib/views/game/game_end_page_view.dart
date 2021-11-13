import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_portfolio/constants.dart';
import 'package:personal_portfolio/controllers/game_controller.dart';

class GameEndScreen extends GetWidget<GameController> {
  const GameEndScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.85 - 100,
      width: ((size.width - 100) / 2) * 0.415,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/bg-2.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        margin: EdgeInsets.all(20.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: size.width * 0.8,
              height: size.height * 0.7,
              decoration: BoxDecoration(
                color: Colors.white60,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Colors.purple.shade800, width: 3),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 230,
                    height: 150,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: controller.correctAnswers > 0
                                  ? AssetImage('images/star-1.png')
                                  : AssetImage('images/star-2.png'),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                  image: controller.correctAnswers > 1
                                      ? AssetImage('images/star-1.png')
                                      : AssetImage('images/star-2.png'),
                                ))),
                          ],
                        ),
                        Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: controller.correctAnswers > 2
                                  ? AssetImage('images/star-1.png')
                                  : AssetImage('images/star-2.png'),
                            ))),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: FractionalOffset(0.5, 0.07),
              child: Container(
                alignment: FractionalOffset(0.5, 0.5),
                width: 200,
                height: 50,
                child: Text(
                  'Level Complate',
                  style: primaryTextStyle,
                  textAlign: TextAlign.center,
                ),
                decoration: BoxDecoration(
                  color: Colors.purple.shade700,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: Colors.white70),
                ),
              ),
            ),
            Container(
              alignment: FractionalOffset(0.5, 0.93),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    child: Icon(Icons.home),
                    onPressed: () {
                      controller.resetGame();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.purple.shade700,
                      padding: EdgeInsets.all(15.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

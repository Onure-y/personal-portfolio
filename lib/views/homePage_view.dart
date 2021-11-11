import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:personal_portfolio/components/chatBotComp/chatbot_comp.dart';
import 'package:personal_portfolio/constants.dart';
import 'package:personal_portfolio/controllers/budgetApp_controller.dart';
import 'package:personal_portfolio/controllers/chatBot_controller.dart';
import 'package:personal_portfolio/controllers/game_controller.dart';
import 'package:personal_portfolio/views/budgetApp/budgetApp_menu_view.dart';
import 'package:personal_portfolio/views/budgetApp/budgetApp_view.dart';
import 'package:personal_portfolio/views/game/game_end_page_view.dart';
import 'package:personal_portfolio/views/game/game_home_page_view.dart';
import 'package:personal_portfolio/views/game/game_page_view.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: size.height * 4,
          width: size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [backgroundGradientColor1, backgroundGradientColor2],
            ),
          ),
          child: Column(
            children: [
              GetBuilder<ChatBotController>(
                  init: ChatBotController(),
                  builder: (ChatBotController controller) {
                    return Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                      height: 80,
                      width: size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('OEY', style: logoTextStyle),
                          Container(
                            alignment: Alignment.center,
                            width: size.width * 0.35,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                TextButton(
                                  child: Text('Work', style: primaryTextStyle),
                                  onPressed: () {},
                                ),
                                TextButton(
                                  child: Text('About', style: primaryTextStyle),
                                  onPressed: () {},
                                ),
                                TextButton(
                                  child:
                                      Text('Contact', style: primaryTextStyle),
                                  onPressed: () {
                                    controller.changeChatBotState();
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
              Stack(
                children: [
                  Container(
                    height: size.height - 80,
                    width: size.width,
                    padding: EdgeInsets.all(30),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 150),
                      width: double.infinity,
                      height: double.infinity,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              height: (size.height - 140) * 0.8,
                              width: (size.width - 60) * 0.5,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black,
                                      blurRadius: 4,
                                      offset: Offset(4, 8)),
                                ],
                                borderRadius: BorderRadius.circular(50),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    secondContainerGradientColor1,
                                    secondContainerGradientColor2,
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              height: (size.height - 140) * 0.6,
                              width: (size.width - 60) * 0.4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  50,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black,
                                      blurRadius: 4,
                                      offset: Offset(4, 8)),
                                ],
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    containerGradientColor1,
                                    containerGradientColor2,
                                  ],
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(50.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Hi, I’m Onur.",
                                            style: logoTextStyle),
                                        Text("I’m Mobile Developer",
                                            style: logoTextStyle),
                                        Text("And Designer",
                                            style: logoTextStyle),
                                      ],
                                    ),
                                    Text(
                                        'Lorem scasc askc asjkcma ascmasc aksnmclkans xasda',
                                        style: primaryTextStyle),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(50.0),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                width: 400,
                                height: 400,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                    colors: [
                                      circleContainerGradientColor1,
                                      circleContainerGradientColor2
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              width: 400,
                              height: 400,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                  colors: [
                                    circleContainerGradientColor1,
                                    circleContainerGradientColor2
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 30.0),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Image.asset('images/phones.png'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GetBuilder<ChatBotController>(
                      init: ChatBotController(),
                      builder: (ChatBotController controller) {
                        if (controller.isChatBotOpen) {
                          return Align(
                            alignment: Alignment(0.9, 0),
                            child: Container(
                              padding: EdgeInsets.all(30.0),
                              width: (size.width - 60) * 0.33,
                              height: size.height * 0.8,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    backgroundGradientColor2,
                                    backgroundGradientColor1,
                                  ],
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Chat Bot',
                                          style: chatBotTitleStyle),
                                      InkWell(
                                        child: Icon(Icons.cancel,
                                            color: backgroundGradientColor2),
                                        onTap: () {
                                          controller.changeChatBotState();
                                        },
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Divider(color: Colors.white),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  ChatBot(),
                                ],
                              ),
                            ),
                          );
                        } else {
                          return Container();
                        }
                      }),
                ],
              ),
              Container(
                width: size.width,
                height: size.height + size.height * 0.3,
                padding: EdgeInsets.all(50),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(15, 10),
                          blurRadius: 40,
                          color: Colors.black)
                    ],
                    borderRadius: BorderRadius.circular(40),
                    gradient: LinearGradient(
                      colors: [
                        containerGradientColor1,
                        containerGradientColor2
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Container(
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 200),
                          height: double.infinity,
                          width: (size.width - 100) / 2,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Horoscope Puzzle', style: labelTextStyle),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Lorem Acbsc aerhb casmb',
                                        style: primaryTextStyle),
                                    Text('acmfd a aasda sa kscjk asjckll',
                                        style: primaryTextStyle),
                                    Text('naklsc Lorem   as dsad Acbsc',
                                        style: primaryTextStyle),
                                    Text('aerhb casmb acmfd a akscjk',
                                        style: primaryTextStyle),
                                    Text('asjckll naklsc Lorem Acbsc',
                                        style: primaryTextStyle),
                                    Text('aerhb casmb acmfd a akscjk',
                                        style: primaryTextStyle),
                                    Text('asjckll naklsc',
                                        style: primaryTextStyle),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: size.height * 0.9,
                          width: (size.width - 100) / 2,
                          child: Center(
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  height: size.height * 0.85,
                                  width: ((size.width - 100) / 2) * 0.45,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          offset: Offset(15, 10),
                                          blurRadius: 40,
                                          color: Colors.black)
                                    ],
                                    image: DecorationImage(
                                        image: AssetImage('images/body.png'),
                                        fit: BoxFit.fill),
                                  ),
                                ),
                                GetBuilder(
                                    init: GameController(),
                                    builder: (GameController controller) {
                                      if (controller.gameState) {
                                        return Center(
                                          child: GameScreen(),
                                        );
                                      }
                                      if (controller.isGameEnded) {
                                        return Center(
                                          child: GameEndScreen(),
                                        );
                                      } else {
                                        return Center(
                                          child: GameHomeScreen(),
                                        );
                                      }
                                    }),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: size.width,
                height: size.height + size.height * 0.5,
                padding: EdgeInsets.all(50),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    gradient: LinearGradient(
                      colors: [
                        containerGradientColor1,
                        containerGradientColor2
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: size.height * 0.9,
                        width: (size.width - 100) / 2,
                        child: Center(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                height: size.height * 0.85,
                                width: ((size.width - 100) / 2) * 0.45,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(15, 10),
                                        blurRadius: 40,
                                        color: Colors.black)
                                  ],
                                  image: DecorationImage(
                                      image: AssetImage('images/body.png'),
                                      fit: BoxFit.fill),
                                ),
                              ),
                              GetBuilder<BudgetAppController>(
                                  init: BudgetAppController(),
                                  builder: (BudgetAppController controller) {
                                    if (controller.isMenuOpen) {
                                      return BudgetAppMenuScreen();
                                    } else {
                                      return BudgetAppHomeScreen();
                                    }
                                  }),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

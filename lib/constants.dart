import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final Color backgroundGradientColor1 = Color(0xff020607);
final Color backgroundGradientColor2 = Color(0xff37464F);

final Color containerGradientColor1 = Color(0xff37474F);
final Color containerGradientColor2 = Color(0xff201F22);

final Color secondContainerGradientColor1 = Color.fromRGBO(139, 136, 143, 1);
final Color secondContainerGradientColor2 = Color.fromRGBO(98, 114, 123, 0.64);

final Color circleContainerGradientColor1 = Color.fromRGBO(142, 142, 142, 0.3);
final Color circleContainerGradientColor2 = Color.fromRGBO(218, 218, 218, 0.4);

final TextStyle logoTextStyle = GoogleFonts.lato(
    fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white);

final TextStyle primaryTextStyle =
    GoogleFonts.lato(fontSize: 24, color: Colors.white);

final TextStyle questionTextStyle = GoogleFonts.lato(
    fontSize: 26, color: Colors.white, fontWeight: FontWeight.w400);

final TextStyle labelTextStyle = GoogleFonts.lato(
    fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white);

// Game Constant Values

final Color mainButtonColor = Color(0xff7B1FA2);

final answerStyle = GoogleFonts.magra(
  textStyle: TextStyle(
    color: Colors.white,
    fontSize: 24,
    fontWeight: FontWeight.w200,
  ),
);

final kPrimaryGradient = LinearGradient(
  colors: [Color.fromRGBO(85, 37, 134, 1), Color.fromRGBO(153, 105, 199, 1)],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);

// Budget App Constant Values

final TextStyle navBarTextStyle = GoogleFonts.lato(
    fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black);

final TextStyle budgetTextStyle = GoogleFonts.lato(
    fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black);

final TextStyle intreactionTitleTextStyle =
    GoogleFonts.lato(fontSize: 16, color: Colors.black);

final TextStyle balanceTextStyle = GoogleFonts.lato(
    fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green);
final TextStyle loanTextStyle = GoogleFonts.lato(
    fontSize: 16, fontWeight: FontWeight.bold, color: Colors.red);

final TextStyle intreactionTextStyle = GoogleFonts.lato(
    fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black);

final TextStyle menuTitleTextStyle = GoogleFonts.lato(
    fontSize: 18, fontWeight: FontWeight.w800, color: Colors.black);

// ChatBot Constant Values

final TextStyle chatBotTitleStyle =
    GoogleFonts.lato(fontSize: 18, color: Colors.white);

final TextStyle chatBotMessageStyle =
    GoogleFonts.lato(fontSize: 16, color: Colors.white);

final TextStyle sendMessageTextStyle =
    GoogleFonts.lato(fontSize: 14, color: Colors.white54);

final TextStyle textFormFieldStly =
    GoogleFonts.lato(fontSize: 14, color: Colors.black);

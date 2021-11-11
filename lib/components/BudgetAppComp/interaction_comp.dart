import 'package:flutter/material.dart';
import 'package:personal_portfolio/constants.dart';

class InteractionComp extends StatelessWidget {
  const InteractionComp(
      {Key? key, required this.text, required this.money, required this.isLoan})
      : super(key: key);
  final String text;
  final String money;
  final bool isLoan;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      width: ((size.width - 100) / 2) * 0.35,
      height: 45,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: intreactionTextStyle),
          Text('$money TL', style: isLoan ? loanTextStyle : balanceTextStyle)
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class WalletScreenButtonsWidget extends StatelessWidget {
  final double width;
  final double height;
  final String untitle;
  final String icon;
  final double iconSize;
  final double textSize;
  final bool isFirst;
  const WalletScreenButtonsWidget(
      {super.key,
      required this.width,
      required this.height,
      required this.untitle,
      required this.icon,
      required this.iconSize,
      required this.textSize,
      required this.isFirst});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: width,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9.46),
          border: Border.all(width: isFirst ? 1 : 0, color:isFirst? Colors.white:Colors.transparent),
          color: const Color(0xff10223F)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              icon,
              width: iconSize,
              height: 50,
            ),
          ),
          Center(
            child: Text(
              untitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: textSize),
            ),
          )
        ],
      ),
    );
  }
}

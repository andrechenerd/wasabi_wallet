import 'package:flutter/material.dart';

class GreenButton extends StatelessWidget {
  final double width;
  final String text;
  final Color color;
  final VoidCallback? onTap;
  const GreenButton(
      {super.key,
      required this.width,
      required this.text,
      this.onTap,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        alignment: Alignment.center,
        height: 46,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(7), color: color),
        child: Text(
          text,
          style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15.77,
              color: Color(0xff222222)),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class InfoCards extends StatelessWidget {
  final Color color;
  final String text;
  final String untitle;
  final double width;
  const InfoCards(
      {super.key,
      required this.color,
      required this.text,
      required this.untitle,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: width,
          height: 46.68,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3.15), color: color),
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w700, fontSize: 19),
          ),
        ),
        const SizedBox(height: 5,),
        SizedBox(
            width: 222,
            child: Text(
              untitle,
              style: const TextStyle(
                  color: Color(0xffA1A1A1),
                  fontWeight: FontWeight.w700,
                  fontSize: 11.36),
            ))
      ],
    );
  }
}

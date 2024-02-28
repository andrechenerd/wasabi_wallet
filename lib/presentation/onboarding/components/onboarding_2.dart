import 'package:flutter/material.dart';
import 'package:wasabi_wallet/core/constants/colors.dart';

import '../../../core/utils/info_card_widget.dart';

class Onboarding2 extends StatefulWidget {
  const Onboarding2({super.key});

  @override
  State<Onboarding2> createState() => _Onboarding2State();
}

class _Onboarding2State extends State<Onboarding2> {
  final List<Widget> cards = [
    const Center(
      child: InfoCards(
        color: Color(0xffAF5D4E),
        text: 'Service Fee',
        untitle: 'You will pay a flat fee of 0.3% for every coin you receive.',
        width: 148,
      ),
    ),
    const Center(
      child: InfoCards(
        color: Color(0xffAF5D4E),
        text: 'Network Fee',
        untitle: 'The market standard in mining fee always applies.',
        width: 148,
      ),
    ),
    const Center(
      child: InfoCards(
        color: Color(0xff007A50),
        text: 'Plebs Don’t Pay',
        untitle: 'You will pay a flat fee of 0.3% for every coin you receive.',
        width: 177,
      ),
    ),
    const Center(
      child: InfoCards(
        color: Color(0xff007A50),
        text: 'Friends Don’t Pay',
        untitle: 'You will pay a flat fee of 0.3% for every coin you receive.',
        width: 177,
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          const Center(
              child: Text(
            'Coinjoin Fees',
            style: TextStyle(
                fontWeight: FontWeight.w500, fontSize: 28, color: Colors.white),
          )),
          const SizedBox(
            height: 72,
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 3,
              children: cards,
            ),
          )
        ],
      ),
    );
  }
}

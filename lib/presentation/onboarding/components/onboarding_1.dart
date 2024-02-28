import 'package:flutter/material.dart';
import 'package:wasabi_wallet/core/constants/icons.dart';

import '../../../core/constants/colors.dart';

class Onboarding1 extends StatefulWidget {
  const Onboarding1({super.key});

  @override
  State<Onboarding1> createState() => _Onboarding1State();
}

class _Onboarding1State extends State<Onboarding1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(
            flex: 164,
          ),
          Center(
              child: Image.asset(
            AppIcons.wasabiLogo,
            width: 110,
            height: 82,
          )),
          const Spacer(
            flex: 49,
          ),
          const Text(
            'Start using Wasabi Wallet',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 28.39),
          ),
          const Spacer(
            flex: 12,
          ),
          const Text(
            'Rule #1: Wasabi is for defense only',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: AppColors.lightGrey,
                fontWeight: FontWeight.w500,
                fontSize: 15.77),
          ),
          const Spacer(
            flex: 284,
          ),
        ],
      ),
    );
  }
}

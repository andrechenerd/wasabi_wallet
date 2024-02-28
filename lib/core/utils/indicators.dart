import 'package:flutter/material.dart';

import '../../presentation/onboarding/cubit.dart';

class Indicator extends StatelessWidget {
  final OnboardingScreenCubit cubit;
  const Indicator({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(cubit.pages.length, (index) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            margin: const EdgeInsets.only(right: 14),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: index == cubit.state.currentIndex
                    ? const Color(0xffD9D9D9)
                    : const Color(0xffD9D9D9).withOpacity(0.5)),
            curve: Curves.easeInCirc,
            width: 15.77,
            height: 15.77,
          );
        }),
      ),
    );
  }
}

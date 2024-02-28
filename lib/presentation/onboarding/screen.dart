import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasabi_wallet/core/constants/colors.dart';
import 'package:wasabi_wallet/core/utils/green_button.dart';
import 'package:wasabi_wallet/presentation/onboarding/state.dart';

import '../../core/constants/icons.dart';
import '../../core/constants/images.dart';
import '../../core/utils/indicators.dart';
import 'cubit.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _cubit = OnboardingScreenCubit();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<OnboardingScreenCubit, OnboardingScreenState>(
            bloc: _cubit,
            builder: (context, state) {
              return Stack(
                children: [
                  Image.asset(
                    AppImages.wasabiLogo,
                    width: double.maxFinite,
                    height: double.maxFinite,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(100),
                    child: Stack(
                      children: [
                        PageView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          controller: _cubit.pageCTRL,
                          itemCount: _cubit.pages.length,
                          itemBuilder: (context, index) {
                            return _cubit.pages[index];
                          },
                        ),
                        _cubit.pageCTRL.hasClients && _cubit.pageCTRL.page == 1
                            ? GestureDetector(
                                onTap: () {
                                  _cubit.onPreviouse();
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, left: 42),
                                  child: Image.asset(
                                    AppIcons.backArrow,
                                    width: 30,
                                    height: 19,
                                  ),
                                ),
                              )
                            : const SizedBox(),
                        Column(
                          children: [
                            const Spacer(
                              flex: 500,
                            ),
                            Indicator(
                              cubit: _cubit,
                            ),
                            const Spacer(
                              flex: 50,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 41, right: 48),
                              child: Row(
                                children: [
                                  const Spacer(),
                                  GreenButton(
                                    width: 170,
                                    text: _cubit.pageCTRL.hasClients &&
                                            _cubit.pageCTRL.page == 1
                                        ? 'Get Started'
                                        : 'Continue',
                                    color: AppColors.lightGreen,
                                    onTap: () {
                                      _cubit.onNext(context);
                                    },
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }));
  }
}

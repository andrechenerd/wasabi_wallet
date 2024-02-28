import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasabi_wallet/presentation/onboarding/components/onboarding_1.dart';
import 'package:wasabi_wallet/presentation/onboarding/state.dart';

import '../add_wallet/add_wallet_screen.dart';
import 'components/onboarding_2.dart';

class OnboardingScreenCubit extends Cubit<OnboardingScreenState> {
  OnboardingScreenCubit() : super(OnboardingScreenState.initial());
  final _pageCTRL = PageController();
  final pages = [const Onboarding1(), const Onboarding2()];
  PageController get pageCTRL => _pageCTRL;

  bool _isLoading = false;

  Future<void> onNext(BuildContext context) async {
    if (_isLoading) return;
    if (state.currentIndex == pages.length - 1) {
      Navigator.pushAndRemoveUntil(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const AddWalletScreen(),
          transitionDuration: const Duration(milliseconds: 400),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
        (route) => false,
      );
    }
    _isLoading = true;
    try {
      await _pageCTRL.nextPage(
          duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
      emit(state.copyWith(currentIndex: state.currentIndex + 1));
    } catch (e) {
      print(e);
    }
    _isLoading = false;
  }

  Future<void> onPreviouse() async {
    if (_isLoading) return;
    _isLoading = true;
    try {
      await _pageCTRL.previousPage(
          duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
      emit(state.copyWith(currentIndex: state.currentIndex - 1));
    } catch (e) {
      print(e);
    }
    _isLoading = false;
  }

  @override
  Future<void> close() {
    _pageCTRL.dispose();
    return super.close();
  }
}

import 'package:equatable/equatable.dart';

class OnboardingScreenState extends Equatable {
  final int currentIndex;
  const OnboardingScreenState({
    required this.currentIndex,
  });

  OnboardingScreenState copyWith({
    int? currentIndex,
  }) {
    return OnboardingScreenState(
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }

  factory OnboardingScreenState.initial() {
    return const OnboardingScreenState(currentIndex: 0);
  }
  @override
  List<Object> get props => [currentIndex];
}

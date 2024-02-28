import 'package:equatable/equatable.dart';

class CategoriesScreenState extends Equatable {
  final bool isSelected;
  final int? selectedCard;

  const CategoriesScreenState({required this.isSelected, this.selectedCard});

  CategoriesScreenState copyWith({
    bool? isSelected,
    int? selectedCard,
  }) {
    return CategoriesScreenState(
      isSelected: isSelected ?? this.isSelected,
      selectedCard: selectedCard ?? this.selectedCard,
    );
  }

  factory CategoriesScreenState.initial() {
    return const CategoriesScreenState(isSelected: false, selectedCard: null);
  }

  @override
  List<Object?> get props => [isSelected, selectedCard];
}

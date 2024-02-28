import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasabi_wallet/presentation/categories_screen/state.dart';

class CategoriesCubit extends Cubit<CategoriesScreenState> {
  CategoriesCubit() : super(CategoriesScreenState.initial());

  void setSelectedCard(int index) {
    emit(state.copyWith(isSelected: true, selectedCard: index));
  }

  void clearSelectedCard() {
    emit(state.copyWith(isSelected: false, selectedCard: null));
  }

  void isSelectedCheck(bool isSelected) {
    emit(state.copyWith(isSelected: isSelected));
  }
}

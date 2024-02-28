import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasabi_wallet/presentation/add_wallet/steps/import_wallet_state.dart';

import '../../../data/repositories/wallet_repo.dart';

class ImportWalletCubit extends Cubit<ImportWalletScreenState> {
  ImportWalletCubit() : super(ImportWalletScreenState.initial());

  Future<void> importWallet({
    required VoidCallback onSuccess,
    required String mnemonic,
  }) async {
    try {
      await WalletRepo().importWallet(mnemonic);
      if (WalletRepo().lastWallet == null) return;
      onSuccess();
    } catch (e) {
      print(e);
    }
  }

  void setRecoveryWords(List<String> words) {
    emit(state.copyWith(
      recoveryWords: words,
    ));
  }
}

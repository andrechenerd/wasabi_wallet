import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasabi_wallet/presentation/add_wallet/state.dart';

import '../../data/repositories/wallet_repo.dart';

class WalletCubit extends Cubit<WalletState> {
  WalletCubit() : super(WalletState.initial());

  void emitWalletName(String name) {
    emit(state.copyWith(walletName: name));
  }

  void emitRecoveryWords(List<String> words) {
    emit(state.copyWith(recoveryWorlds: words));
  }

  Future<void> createWallet(VoidCallback onSuccess) async {
    try {
      await WalletRepo().createWallet();
      if (WalletRepo().lastWallet == null) return;
      onSuccess();
    } catch (e) {
      print(e);
    }
  }
}

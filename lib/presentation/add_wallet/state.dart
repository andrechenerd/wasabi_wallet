// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class WalletState extends Equatable {
  final String walletName;
  final List<String> recoveryWorlds;

  const WalletState({
    required this.walletName,
    required this.recoveryWorlds,
  });

  WalletState copyWith({String? walletName, List<String>? recoveryWorlds}) {
    return WalletState(
        recoveryWorlds: recoveryWorlds ?? this.recoveryWorlds,
        walletName: walletName ?? this.walletName);
  }

  factory WalletState.initial() {
    return const WalletState(walletName: '', recoveryWorlds: []);
  }
  @override
  List<Object> get props => [walletName, recoveryWorlds];
}

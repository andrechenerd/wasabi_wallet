// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class ImportWalletScreenState extends Equatable {
  final List<String> recoveryWords;
  final int currentFlow;
  const ImportWalletScreenState(
      {required this.currentFlow, required this.recoveryWords});

  ImportWalletScreenState copyWith({
    int? currentFlow,
    List<String>? recoveryWords,
  }) {
    return ImportWalletScreenState(
      currentFlow: currentFlow ?? this.currentFlow,
      recoveryWords: recoveryWords ?? this.recoveryWords,
    );
  }

  @override
  List<Object> get props => [currentFlow, recoveryWords];

  factory ImportWalletScreenState.initial() {
    return const ImportWalletScreenState(currentFlow: 0, recoveryWords: []);
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:window_size/window_size.dart';

import 'app/app.dart';
import 'data/repositories/exchange_rates_repo.dart';
import 'data/repositories/hive_repo.dart';
import 'data/repositories/wallet_repo.dart';

void main() async {
  if (Platform.isLinux) {
    setWindowTitle('Wasabi Wallet');
    setWindowMaxSize(const Size(1920, 1080));
    setWindowMinSize(const Size(1029, 700));
  }
  WidgetsFlutterBinding.ensureInitialized();
  await HiveRepo().init();
  await WalletRepo().importLastSavedWallet();
  ExchangeRatesRepo().manuallySetRates().then((value) {
    ExchangeRatesRepo().startRateUpdateTimer();
  });
  runApp(const MyApp());
}

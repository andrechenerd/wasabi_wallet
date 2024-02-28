import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasabi_wallet/core/constants/colors.dart';
import 'package:wasabi_wallet/presentation/add_wallet/cubit.dart';
import 'package:wasabi_wallet/presentation/onboarding/screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: const {},
      home: MultiBlocProvider(
        providers: [BlocProvider(create: (context) => WalletCubit())],
        child: const OnboardingScreen(),
      ),
      // home: MultiBlocProvider(
      //     providers: [BlocProvider(create: (context) => WalletCubit())],
      //     child: const OnboardingScreen()),
    );
  }
}


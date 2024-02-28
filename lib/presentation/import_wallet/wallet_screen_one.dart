import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasabi_wallet/core/constants/colors.dart';
import 'package:wasabi_wallet/core/utils/green_button.dart';
import 'package:wasabi_wallet/data/repositories/wallet_repo.dart';
import 'package:wasabi_wallet/presentation/add_wallet/cubit.dart';
import 'package:wasabi_wallet/presentation/add_wallet/state.dart';

import '../../../core/constants/icons.dart';
import '../recovery_worlds/screen.dart';

// class WalletBlock extends StatefulWidget {
//   const WalletBlock({super.key});

//   @override
//   State<WalletBlock> createState() => _WalletBlockState();
// }

// class _WalletBlockState extends State<WalletBlock> {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider.va<WalletCubit>(
//       create: (context) => WalletCubit(),
//       child: const AddWalletStepOne(),
//     );
//   }
// }

class WalletScreenOne extends StatefulWidget {
  const WalletScreenOne({super.key});

  @override
  State<WalletScreenOne> createState() => _AddWalletState();
}

class _AddWalletState extends State<WalletScreenOne> {
  final WalletCubit cubit = WalletCubit();
  final walletCTRL = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<WalletCubit, WalletState>(
        bloc: cubit,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => WalletCubit(),
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/bg_image.png',
                  width: double.maxFinite,
                  height: double.maxFinite,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(100),
                  child: Container(
                    width: double.maxFinite,
                    height: double.maxFinite,
                    decoration: const BoxDecoration(
                      color: AppColors.bgColor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Spacer(
                          flex: 53,
                        ),
                        Row(
                          children: [
                            const Spacer(
                              flex: 37,
                            ),
                            GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Image.asset(
                                AppIcons.backArrow,
                                width: 31,
                                height: 18,
                              ),
                            ),
                            const Spacer(
                              flex: 24,
                            ),
                            const Text(
                              "Wallet Name",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  fontSize: 26),
                            ),
                            const Spacer(
                              flex: 655,
                            ),
                          ],
                        ),
                        const Spacer(
                          flex: 50,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 60, right: 90),
                                child: Stack(
                                  children: [
                                    TextField(
                                      style:
                                          const TextStyle(color: Colors.white),
                                      controller: walletCTRL,
                                      decoration: const InputDecoration(
                                          filled: true,
                                          fillColor: Color(0xff1F2F42),
                                          hintText: "Wallet Name",
                                          hintStyle:
                                              TextStyle(color: Colors.white),
                                          border: OutlineInputBorder()),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      left: 0,
                                      right: 0,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 1, right: 1),
                                        child: Container(
                                          height: 7,
                                          color: const Color(0xff497497),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Spacer(
                          flex: 393,
                        ),
                        Row(
                          children: [
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 41),
                              child: GreenButton(
                                  color: AppColors.lightGreen,
                                  onTap: () {
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                BlocProvider<WalletCubit>(
                                                    create: (context) =>
                                                        WalletCubit(),
                                                    child: RecoveryWorldsScreen(
                                                      words: WalletRepo()
                                                          .lastWallet!
                                                          .menmonicPhrase
                                                          .split(" "),
                                                    ))),
                                        (route) => false);
                                    if (walletCTRL.text.isEmpty) return;
                                    cubit.emitWalletName(walletCTRL.text);
                                    cubit.createWallet(
                                      () {},
                                    );
                                  },
                                  width: 171,
                                  text: "Continue"),
                            ),
                          ],
                        ),
                        const Spacer(
                          flex: 40,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

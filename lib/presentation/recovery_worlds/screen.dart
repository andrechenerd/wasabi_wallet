import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasabi_wallet/core/constants/icons.dart';
import 'package:wasabi_wallet/core/utils/green_button.dart';
import 'package:wasabi_wallet/presentation/add_wallet/add_wallet_screen.dart';
import 'package:wasabi_wallet/presentation/add_wallet/cubit.dart';
import 'package:wasabi_wallet/presentation/confirm_recovery/screen.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/images.dart';

class RecoveryWorldsScreen extends StatefulWidget {
  final List<String> words;
  const RecoveryWorldsScreen({Key? key, required this.words}) : super(key: key);

  @override
  State<RecoveryWorldsScreen> createState() => _RecoveryWorldsScreenState();
}

class _RecoveryWorldsScreenState extends State<RecoveryWorldsScreen> {
  List<String> texts = [
    'account',
    'list',
    'broccoli',
    'repeat',
    'place',
    'seat',
    'movie',
    'error',
    'virus',
    'connect',
    'analyst',
    'hurt'
  ];
  List indexList = [
    "1",
    "5",
    "9",
    "2",
    "6",
    "10",
    "3",
    "7",
    "11",
    "4",
    "8",
    "12",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Image.asset(
        AppImages.wasabiLogo,
        width: double.maxFinite,
        height: double.maxFinite,
        fit: BoxFit.cover,
      ),
      Padding(
          padding: const EdgeInsets.all(80),
          child: Container(
            color: AppColors.bgColor,
            width: double.maxFinite,
            height: double.maxFinite,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  const Spacer(
                    flex: 25,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          PageRouteBuilder(
                              pageBuilder: (_, __, ___) => AddWalletScreen()),
                          (route) => false);
                    },
                    child: Image.asset(
                      AppIcons.backArrow,
                      width: 30,
                      height: 18,
                    ),
                  ),
                  const Spacer(
                    flex: 10,
                  ),
                  const Text(
                    'Recovery Words',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w300),
                  ),
                  const Spacer(
                    flex: 604,
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(right: 30, left: 55, top: 11),
                child: Text(
                  'Write down the recovery words in the correct order and store them in a safe place. They are needed to recover your wallet.',
                  style: TextStyle(fontSize: 12, color: Color(0xffA09D9D)),
                ),
              ),
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 70, left: 100),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 5,
                      ),
                      padding: EdgeInsets.zero,
                      itemCount: widget.words.length,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            if (index != 0 &&
                                index != 3 &&
                                index != 6 &&
                                index != 9)
                              Container(
                                width: 1,
                                height: 300,
                                color: const Color(0xff8F8F8F),
                              ),
                            Padding(
                                padding:
                                    const EdgeInsets.only(left: 60, top: 10),
                                child: Text(
                                  "${indexList[index]}.${widget.words[index]}",
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.white),
                                )),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 25),
                child: Center(
                  child: Text(
                    "You will not be able to see these words again once the wallet is created.",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xffA09D9D),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Spacer(
                      flex: 90,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            PageRouteBuilder(
                                pageBuilder: (_, __, ___) => AddWalletScreen()),
                            (route) => false);
                      },
                      child: const Text(
                        'Cancel',
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ),
                    const Spacer(
                      flex: 527,
                    ),
                    GreenButton(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                                pageBuilder: (_, __, ___) => BlocProvider(
                                      create: (context) => WalletCubit(),
                                      child: ConfirmRecovery(
                                        words: widget.words,
                                      ),
                                    )));
                      },
                      width: 171,
                      text: 'Continue',
                      color: AppColors.lightGreen,
                    ),
                    const Spacer(
                      flex: 41,
                    ),
                  ],
                ),
              ),
            ]),
          )),
    ]));
  }
}

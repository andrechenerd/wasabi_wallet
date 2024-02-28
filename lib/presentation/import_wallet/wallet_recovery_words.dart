import 'package:flutter/material.dart';
import 'package:wasabi_wallet/core/constants/icons.dart';
import 'package:wasabi_wallet/core/utils/green_button.dart';
import 'package:wasabi_wallet/presentation/confirm_recovery/screen.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/images.dart';

class WalletRecoveryWords extends StatefulWidget {
  const WalletRecoveryWords({Key? key}) : super(key: key);

  @override
  State<WalletRecoveryWords> createState() => _WalletRecoveryWordsState();
}

class _WalletRecoveryWordsState extends State<WalletRecoveryWords> {
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
      body: Stack(
        children: [
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      const Spacer(
                        flex: 25,
                      ),
                      Image.asset(
                        AppIcons.backArrow,
                        width: 30,
                        height: 18,
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
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 5,
                        ),
                        padding: EdgeInsets.zero,
                        itemCount: texts.length,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 60, top: 10),
                                child: Text(
                                  "${indexList[index]}.${texts[index]}",
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 25),
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
                            Navigator.pop(context);
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
                                    pageBuilder: (_, __, ___) =>
                                        const ConfirmRecovery(words: [],)));
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:wasabi_wallet/core/constants/colors.dart';
import 'package:wasabi_wallet/core/constants/icons.dart';
import 'package:wasabi_wallet/data/repositories/hive_repo.dart';
import 'package:wasabi_wallet/presentation/add_wallet/steps/import_wallet_cubit.dart';
import 'package:wasabi_wallet/presentation/add_wallet/steps/import_wallet_state.dart';
import 'package:wasabi_wallet/presentation/categories_screen/categories_screen.dart';

import '../../../core/utils/add_password_dialog.dart';
import '../../../core/utils/green_button.dart';
import '../cubit.dart';

class AddWalletsStepsTwo extends StatefulWidget {
  const AddWalletsStepsTwo({
    Key? key,
  }) : super(key: key);

  @override
  State<AddWalletsStepsTwo> createState() => _AddWalletState();
}

class _AddWalletState extends State<AddWalletsStepsTwo> {
  String text = "";
  TextEditingController ctrl = TextEditingController();
  final focus = FocusNode();
  bool _isShowingTextField = true;
  List<String> wordsList = [];

  final ImportWalletCubit cubit = ImportWalletCubit();

  @override
  Widget build(BuildContext context) {
    print(HiveRepo().savedMnemonics);
    return Scaffold(
      body: BlocBuilder<ImportWalletCubit, ImportWalletScreenState>(
        bloc: cubit,
        builder: (context, state) {
          return Stack(
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
                            onTap: () {
                              Navigator.pop(context);
                            },
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
                            "Recovery Words",
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
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isShowingTextField = true;
                            focus.requestFocus();
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 68, right: 91),
                          child: Container(
                            width: double.maxFinite,
                            height: text.isEmpty ? 47 : 150,
                            decoration: BoxDecoration(
                                color: text.isEmpty
                                    ? const Color(0xff1F2F42)
                                    : Colors.transparent),
                            child: _isShowingTextField
                                ? TextField(
                                    style: const TextStyle(color: Colors.white),
                                    focusNode: focus,
                                    controller: ctrl,
                                    decoration: const InputDecoration(
                                        hintStyle: TextStyle(
                                            color: Color(0xffABA8A8),
                                            fontWeight: FontWeight.w500),
                                        hintText:
                                            'Type in your recovery words in the correct order',
                                        fillColor: Color(0xff1F2F42),
                                        filled: true),
                                    onChanged: (value) {
                                      final text = value.trim();
                                      final splited = text.split(" ");

                                      cubit.setRecoveryWords(splited);
                                    },
                                    onSubmitted: (value) {
                                      setState(() {
                                        _isShowingTextField = false;
                                        text = value.trim();
                                      });
                                      if (text.isNotEmpty) {
                                        wordsList.add(value.trim());
                                        cubit
                                            .setRecoveryWords(value.split(" "));
                                      } else {
                                        wordsList.clear();
                                        cubit.setRecoveryWords([]);
                                      }
                                    },
                                  )
                                : Padding(
                                    padding: const EdgeInsets.only(
                                        right: 190, left: 68),
                                    child: Container(
                                      color: text.isEmpty
                                          ? Colors.transparent
                                          : const Color(0xff3B4045)
                                              .withOpacity(0.5),
                                      child: text.isEmpty
                                          ? Container(
                                              alignment: Alignment.centerLeft,
                                              child: const Text(
                                                'Type in your recovery words in the correct order',
                                                style: TextStyle(
                                                    color: Color(0xffABA8A8),
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 15),
                                              ),
                                            )
                                          : Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 18, left: 18, right: 28),
                                              child: Wrap(
                                                children: List.generate(
                                                    text.split(" ").length,
                                                    (index) {
                                                  return Container(
                                                    padding:
                                                        const EdgeInsets.all(5),
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            width: 1,
                                                            color:
                                                                Colors.white),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(6)),
                                                    margin:
                                                        const EdgeInsets.only(
                                                            right: 10,
                                                            bottom: 22),
                                                    child: Text(
                                                      '${index + 1}.${text.split(" ")[index]}',
                                                      style: const TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  );
                                                }),
                                              ),
                                            ),
                                    ),
                                  ),
                          ),
                        ),
                      ),
                      const Spacer(
                        flex: 329,
                      ),
                      const Center(
                        child: Text(
                          "Advanced Recovery Options",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              color: Colors.white),
                        ),
                      ),
                      const Spacer(
                        flex: 46,
                      ),
                      Row(
                        children: [
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 41),
                            child: GreenButton(
                                onTap: () async {
                                  if (state.recoveryWords.length == 12) {
                                    cubit.importWallet(
                                      onSuccess: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return BlocProvider<WalletCubit>(
                                              create: (context) =>
                                                  WalletCubit(),
                                              child: const AddPasswordDialog(
                                                screen: CategoriesScreen(),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      mnemonic: state.recoveryWords.join(" "),
                                    );
                                  }
                                },
                                color: state.recoveryWords.length == 12
                                    ? AppColors.lightGreen
                                    : AppColors.lightGrey,
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
          );
        },
      ),
    );
  }
}

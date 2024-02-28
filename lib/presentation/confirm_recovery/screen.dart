import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasabi_wallet/core/constants/icons.dart';
import 'package:wasabi_wallet/core/utils/add_password_dialog.dart';
import 'package:wasabi_wallet/core/utils/green_button.dart';
import 'package:wasabi_wallet/core/utils/recovery_words_widget.dart';
import 'package:wasabi_wallet/presentation/add_wallet/cubit.dart';
import 'package:wasabi_wallet/presentation/succsess_screen/succsess_screen.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/images.dart';

class ConfirmRecovery extends StatefulWidget {
  final List<String> words;
  const ConfirmRecovery({Key? key, required this.words}) : super(key: key);

  @override
  State<ConfirmRecovery> createState() => _ConfirmRecoveryState();
}

class _ConfirmRecoveryState extends State<ConfirmRecovery> {
  List addText = [];
  int indexText = 0;
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppImages.wasabiLogo,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.1),
            child: Container(
              color: AppColors.bgColor,
              width: double.infinity,
              height: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 38,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset(
                          AppIcons.backArrow,
                          width: 30,
                          height: 18,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text(
                        'Confirm Recovery Words',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w300),
                      ),
                      const Spacer(),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 30, left: 50, top: 11),
                    child: Text(
                      'Click the recovery word #1',
                      style: TextStyle(fontSize: 12, color: Color(0xffA09D9D)),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 40, right: 190),
                    width: double.infinity,
                    child: Wrap(
                      children: List.generate(
                        widget.words.length,
                        (index) => Padding(
                          padding: const EdgeInsets.only(left: 5, top: 10),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                if (selectedIndex == index) {
                                  addText.remove(widget.words[index]);
                                  selectedIndex = -1;
                                } else {
                                  addText.add(widget.words[index]);
                                  selectedIndex = index;
                                }
                              });
                            },
                            child: RecoveryWidget(
                              text: widget.words[index],
                              width: 60,
                              height: 25,
                              isSelected: selectedIndex == index,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Expanded(
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        childAspectRatio: 0.2,
                      ),
                      itemCount: widget.words.length,
                      itemBuilder: (context, index) {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            if (index != 0 &&
                                index != 1 &&
                                index != 2 &&
                                index != 3)
                              Container(
                                width: 1,
                                height: 172,
                                color: const Color(0xff8F8F8F),
                              ),
                            const SizedBox(
                              width: 50,
                            ),
                            addText.isEmpty
                                ? Text(
                                    '${index + 1}.',
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  )
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            addText.removeAt(index);
                                          });
                                        },
                                        child: Text(
                                          "${index + 1}.${addText.length > index ? addText[index] : ''}",
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                          ],
                        );
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(bottom: 15, right: 20),
                          child: GreenButton(
                              onTap: () {
                                if (widget.words.length == addText.length &&
                                    widget.words.every(
                                        (word) => addText.contains(word))) {
                                  showDialog(
                                    context: context,
                                    builder: (context) => const AddPasswordDialog(
                                      screen:
                                          SuccsessScreen(name: 'name'),
                                    ),
                                  );
                                } else {
                                  return;
                                }
                              },
                              width: 171,
                              text: "Continue",
                              color: AppColors.lightGreen)),
                    ],
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

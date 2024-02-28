import 'package:flutter/material.dart';
import 'package:wasabi_wallet/core/constants/colors.dart';
import 'package:wasabi_wallet/core/utils/green_button.dart';

import '../../data/repositories/hive_repo.dart';

class AddPasswordDialog extends StatefulWidget {
  final Widget screen;
  const AddPasswordDialog({
    super.key,
    required this.screen,
  });

  @override
  State<AddPasswordDialog> createState() => _AddPasswordDialogState();
}

class _AddPasswordDialogState extends State<AddPasswordDialog> {
  TextEditingController pin = TextEditingController();
  TextEditingController confirmPin = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 400,
        height: 305,
        decoration: BoxDecoration(
            color: const Color(0xff0B1633),
            borderRadius: BorderRadius.circular(9.6),
            border: Border.all(
              width: 0.64,
              color: Colors.white,
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20, left: 39),
              child: Text(
                "Add Password",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.w400),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10, left: 39),
              child: Text(
                "Type the password of the wallet if there is one",
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xffACACAC),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 27, left: 39),
              child: SizedBox(
                height: 40,
                width: 275,
                child: TextField(
                  controller: pin,
                  style: const TextStyle(color: Colors.white),
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Type a password",
                      contentPadding: const EdgeInsets.only(top: 9.6, left: 15),
                      hintStyle: const TextStyle(
                          fontSize: 16, color: Color(0xff96979A)),
                      filled: true,
                      fillColor: const Color(0xff202934),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.12),
                        borderSide: const BorderSide(width: 1),
                      )),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 27, left: 39),
              child: SizedBox(
                height: 40,
                width: 275,
                child: TextField(
                  controller: confirmPin,
                  style: const TextStyle(color: Colors.white),
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Confirm the password",
                      contentPadding: const EdgeInsets.only(top: 9.6, left: 15),
                      hintStyle: const TextStyle(
                          fontSize: 16, color: Color(0xff96979A)),
                      filled: true,
                      fillColor: const Color(0xff202934),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.12),
                        borderSide: const BorderSide(width: 1),
                      )),
                ),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 44),
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Text(
                      "Cancel",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: GreenButton(
                      onTap: () {
                        if (pin.text != confirmPin.text) return;
                        HiveRepo().setIsNotFirstAppOpen();
                        Navigator.pushAndRemoveUntil(
                            context,
                            PageRouteBuilder(
                                pageBuilder: (_, __, ___) => widget.screen),
                            (route) => false);
                      },
                      width: 129,
                      text: "Continue",
                      color: pin.text != confirmPin.text
                          ? AppColors.lightGrey
                          : AppColors.lightGreen),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

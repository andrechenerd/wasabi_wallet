import 'package:flutter/material.dart';
import 'package:wasabi_wallet/core/utils/green_button.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/icons.dart';
import '../../core/constants/images.dart';
import '../wallet_loading_screen/wallet_loading.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
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
          padding: const EdgeInsets.all(100),
          child: Container(
            color: AppColors.bgColor,
            width: double.maxFinite,
            height: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    AppIcons.wasabiCash,
                    width: 300,
                  ),
                ),
                const Center(
                  child: Text(
                    'Wallet',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 24),
                  ),
                ),
                const SizedBox(
                  height: 43,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 136, right: 136),
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    cursorColor: Colors.transparent,
                    cursorHeight: 15,
                    decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: const TextStyle(
                            color: Color(0xffD3D1D1),
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        filled: true,
                        fillColor: const Color(0xff202934),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 136),
                  child: Row(
                    children: [
                      const Spacer(),
                      GreenButton(
                          width: 107,
                          text: 'open',
                          color: AppColors.lightGreen,
                          onTap: () {
                            Navigator.push(
                                context,
                                PageRouteBuilder(
                                    pageBuilder: (_, __, ___) =>
                                        const WalletLoading()));
                          }),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}

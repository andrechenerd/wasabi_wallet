import 'package:flutter/material.dart';
import 'package:wasabi_wallet/core/constants/colors.dart';
import 'package:wasabi_wallet/core/constants/images.dart';
import 'package:wasabi_wallet/presentation/add_wallet/add_wallet_screen.dart';

class WalletLoading extends StatefulWidget {
  const WalletLoading({super.key});

  @override
  State<WalletLoading> createState() => _WalletLoadingState();
}

class _WalletLoadingState extends State<WalletLoading>
    with TickerProviderStateMixin {
  late AnimationController controller;
  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 10))
          ..addListener(() {
            setState(() {});
          });
    controller.repeat(reverse: true);
    Future.delayed(const Duration(seconds: 10), () {
      Navigator.pushReplacement(
          context,
          PageRouteBuilder(
              pageBuilder: (_, __, ___) => const AddWalletScreen()));
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(
            flex: 42,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 38),
            child: Text(
              'Wallet',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 35),
            ),
          ),
          const Spacer(
            flex: 35,
          ),
          Container(
            width: double.maxFinite,
            height: 2,
            color: AppColors.lightGrey,
          ),
          const Spacer(
            flex: 96,
          ),
          Center(
            child: Image.asset(
              AppImages.earth,
              height: 400,
            ),
          ),
          const Spacer(
            flex: 65,
          ),
          const Center(
            child: Text(
              'DOwnloading and processing Bitcoin network data',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 24),
            ),
          ),
          const Spacer(
            flex: 20,
          ),
          const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 193),
              child: Text(
                'Wasabi does this without any third party knowing about your balance and financial activity. This process may take some time depending on the size your wallet',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xffA09D9D),
                    fontWeight: FontWeight.w600,
                    fontSize: 15),
              ),
            ),
          ),
          const Spacer(
            flex: 65,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 161, right: 161),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: LinearProgressIndicator(
                  minHeight: 10,
                  color: const Color(0xff6698DB),
                  value: controller.value,
                  backgroundColor: const Color(0xff484C54),
                ),
              ),
            ),
          ),
          const Spacer(
            flex: 19,
          ),
          Center(
            child: Text(
              '${(controller.value * 100).toStringAsFixed(0)}% completed - 10 minutes and 27 seconds remaining',
              style: const TextStyle(
                  color: Color(0xffA09D9D),
                  fontWeight: FontWeight.w600,
                  fontSize: 13),
            ),
          ),
          const Spacer(
            flex: 87,
          ),
        ],
      ),
    );
  }
}

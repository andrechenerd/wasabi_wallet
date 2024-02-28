import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasabi_wallet/core/constants/icons.dart';
import 'package:wasabi_wallet/core/utils/green_button.dart';
import 'package:wasabi_wallet/presentation/add_wallet/cubit.dart';
import 'package:wasabi_wallet/presentation/categories_screen/cubit.dart';
import 'package:wasabi_wallet/presentation/categories_screen/state.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/images.dart';
import '../../core/utils/category_card_widget.dart';
import '../succsess_screen/succsess_screen.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({
    super.key,
  });

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    final CategoriesCubit cubit = CategoriesCubit();

    return Scaffold(
      body: BlocBuilder<CategoriesCubit, CategoriesScreenState>(
        bloc: cubit,
        builder: (context, state) {
          final List cards = [
            CategoryCardsWidget(
              icon: AppIcons.coin,
              isSelected: state.selectedCard == 0,
              title: 'Minimize Costs',
              untitle:
                  'For savers.Only participates in coinjoins during the cheapest parts of the week.',
              onTap: () {
                cubit.setSelectedCard(0);
              },
            ),
            CategoryCardsWidget(
              icon: AppIcons.speed,
              isSelected: state.selectedCard == 1,
              title: 'Maximize Speed',
              untitle:
                  'Getting things done.Geared towards speed and convenience',
              onTap: () {
                cubit.setSelectedCard(1);
              },
            ),
            CategoryCardsWidget(
              icon: AppIcons.security,
              isSelected: state.selectedCard == 2,
              title: 'Maximize Privacy',
              untitle:
                  'Choice of the paranoid. Optimizes for privacy at all costs.',
              onTap: () {
                cubit.setSelectedCard(2);
              },
            ),
          ];
          return Stack(
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer(
                        flex: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 37,
                        ),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Image.asset(
                                AppIcons.backArrow,
                                width: 30,
                                height: 19,
                              ),
                            ),
                            const SizedBox(
                              width: 25,
                            ),
                            const Text(
                              'Coinjoin Strategy',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 27),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(
                        flex: 22,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 68, right: 68),
                        child: Text(
                          'Wasabi takes care of your financial privacy by automatically starting to coinjoin all your funds fol a fixed 0.3% coordination fee + the mining fees.Select a coinjoin strategy that fits you best',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 17),
                        ),
                      ),
                      const Spacer(
                        flex: 40,
                      ),
                      Row(
                        children: List.generate(
                            cards.length,
                            (index) => Expanded(
                                    child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 50),
                                  child: cards[index],
                                ))),
                      ),
                      const Spacer(
                        flex: 47,
                      ),
                      const Center(
                        child: Text(
                          'Customize',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                      const Spacer(
                        flex: 31,
                      ),
                      Row(
                        children: [
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 35),
                            child: GreenButton(
                              width: 172,
                              text: 'Continue',
                              color: state.selectedCard == null
                                  ? AppColors.lightGrey
                                  : AppColors.lightGreen,
                              onTap: () {
                                if (state.selectedCard == null) return;
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => BlocProvider(
                                              create: (context) =>
                                                  WalletCubit(),
                                              child: BlocProvider(
                                                create: (context) =>
                                                    WalletCubit(),
                                                child: const SuccsessScreen(
                                                  name: '',
                                                ),
                                              ),
                                            )));
                              },
                            ),
                          ),
                        ],
                      ),
                      const Spacer(
                        flex: 32,
                      )
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

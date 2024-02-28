// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CategoryCardsWidget extends StatelessWidget {
  final String title;
  final String icon;
  final String untitle;
  final bool isSelected;
  final VoidCallback onTap;
  const CategoryCardsWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.untitle,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 279,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            color: const Color(0xff14293D),
            border: Border.all(
                width: isSelected ? 1 : 0,
                color: isSelected
                    ? const Color(0xff00E0FF)
                    : const Color(0xff14293D))),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              const Spacer(
                flex: 43,
              ),
              Text(
                title,
                style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    fontSize: 17),
              ),
              const Spacer(
                flex: 18,
              ),
              Image.asset(
                icon,
                width: 95,
                height: 102,
              ),
              const Spacer(
                flex: 13,
              ),
              Text(
                untitle,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 13.32),
              ),
              const Spacer(
                flex: 43,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

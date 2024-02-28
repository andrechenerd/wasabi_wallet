import 'package:flutter/material.dart';
import 'package:wasabi_wallet/core/constants/colors.dart';

class RecoveryWidget extends StatefulWidget {
  const RecoveryWidget(
      {super.key,
      required this.text,
      required this.width,
      required this.height,
      required this.isSelected});
  final String text;
  final double width;
  final double height;
  final bool isSelected;

  @override
  State<RecoveryWidget> createState() => _RecoveryWidgetState();
}

class _RecoveryWidgetState extends State<RecoveryWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.4),
            border: Border.all(width: 1.28, color: widget.isSelected?AppColors.lightGrey:Colors.white)),
        child: Text(
          widget.text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

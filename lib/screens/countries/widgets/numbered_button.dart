import 'package:flutter/material.dart';
import 'package:kafiil_test/helper/colors.dart';
import 'package:kafiil_test/helper/constants.dart';

class NumberedButton extends StatelessWidget {
  const NumberedButton({super.key, required this.selected, required this.text});

  final bool selected;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: screenWidth(context) * .006),
        decoration: BoxDecoration(
          border: Border.all(
            color: selected ? AppColors.primaryGreen : AppColors.grey200,
          ),
          color: selected ? AppColors.primaryGreen : Colors.transparent,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Container(
          padding: EdgeInsets.all(screenWidth(context) * .035),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: selected? Colors.white: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

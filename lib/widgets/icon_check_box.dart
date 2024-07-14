import 'package:flutter/material.dart';
import 'package:kafiil_test/helper/colors.dart';
import 'package:kafiil_test/helper/constants.dart';

class IconCheckBox extends StatelessWidget {
  const IconCheckBox({super.key,required this.img, required this.name});
  final String img;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          activeColor: AppColors.primaryGreen,
          value: true,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          onChanged: (value) {},
        ),
        Image.asset(
          'assets/images/$img.png',
          width: screenWidth(context) * .052,
        ),
        SizedBox(
          width: screenWidth(context) * .02,
        ),
        Text(
          name,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppColors.grey500,
          ),
        ),
      ],
    );
  }
}

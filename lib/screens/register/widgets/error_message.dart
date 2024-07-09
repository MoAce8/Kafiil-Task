import 'package:flutter/material.dart';
import 'package:kafiil_test/helper/colors.dart';
import 'package:kafiil_test/helper/constants.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({super.key, required this.visible});

  final bool visible;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: Container(
        width: screenWidth(context) * .9,
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth(context)*.06,
            vertical: screenHeight(context)*.008
        ),
        decoration: BoxDecoration(
          color: AppColors.errorBack,
          borderRadius: BorderRadius.circular(4),
        ),
        child:  Row(
          children: [
            const Icon(
              Icons.info_outline,
              color: AppColors.errorText,
              size: 18,

            ),
            SizedBox(width: screenWidth(context)*.02,),
            const Text(
              'Fill the required fields',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: AppColors.errorText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

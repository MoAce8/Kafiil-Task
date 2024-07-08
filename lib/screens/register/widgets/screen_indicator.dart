import 'package:flutter/material.dart';
import 'package:kafiil_test/helper/colors.dart';
import 'package:kafiil_test/helper/constants.dart';

class ScreenIndicator extends StatelessWidget {
  const ScreenIndicator({
    super.key,
    required this.firstScreen,
    this.onTap,
  });

  final bool firstScreen;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Expanded(
              flex: 1,
              child: SizedBox(),
            ),
            SizedBox(
              width: screenWidth(context) * .025,
            ),
            const Text(
              'Register',
              style: TextStyle(
                color: AppColors.primaryGreen,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
            const Expanded(
              flex: 2,
              child: SizedBox(),
            ),
            Text(
              'Complete Data',
              style: TextStyle(
                color: firstScreen ? AppColors.grey200 : AppColors.primaryGreen,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
            const Expanded(
              flex: 1,
              child: SizedBox(),
            ),
          ],
        ),
        SizedBox(
          height: screenHeight(context) * .01,
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: AppColors.primaryGreen,
                height: screenHeight(context) * .003,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:
                    firstScreen ? Colors.transparent : AppColors.primaryGreen,
                border: Border.all(
                  color: AppColors.primaryGreen,
                  width: 2,
                ),
              ),
              height: screenHeight(context) * .03,
              width: screenHeight(context) * .03,
              child: Center(
                child: firstScreen
                    ? const Text(
                        '1',
                        style: TextStyle(
                          color: AppColors.primaryGreen,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      )
                    : GestureDetector(
                        onTap: onTap,
                        child: const Icon(
                          Icons.check,
                          size: 14,
                          color: Colors.white,
                        ),
                      ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                color: firstScreen ? AppColors.grey200 : AppColors.primaryGreen,
                height: screenHeight(context) * .003,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: firstScreen ? AppColors.grey200 : Colors.transparent,
                border: Border.all(
                  color:
                      firstScreen ? AppColors.grey200 : AppColors.primaryGreen,
                  width: 2,
                ),
              ),
              height: screenHeight(context) * .03,
              width: screenHeight(context) * .03,
              child: Center(
                child: firstScreen
                    ? null
                    : const Text(
                        '2',
                        style: TextStyle(
                          color: AppColors.primaryGreen,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: AppColors.grey200,
                height: screenHeight(context) * .003,
              ),
            ),
          ],
        )
      ],
    );
  }
}

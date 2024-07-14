import 'package:flutter/material.dart';
import 'package:kafiil_test/helper/colors.dart';
import 'package:kafiil_test/helper/constants.dart';

class DividedRow extends StatelessWidget {
  const DividedRow({super.key, required this.divided});
  final bool divided;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth(context) * .11,
              vertical: screenHeight(context) * .008),
          child: const Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  'Egypt',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w500),
                ),
              ),
              Expanded(flex: 2, child: SizedBox()),
              Expanded(
                flex: 1,
                child: Text(
                  'Cairo',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
        Visibility(
          visible: divided,
            child: const Divider(
          color: AppColors.grey100,
        )),
      ],
    );
  }
}

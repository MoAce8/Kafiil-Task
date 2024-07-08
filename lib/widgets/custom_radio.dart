import 'package:flutter/material.dart';
import 'package:kafiil_test/helper/colors.dart';

class AppRadio extends StatelessWidget {
  const AppRadio({
    super.key,
    required this.groupValue,
    required this.value,
    required this.onChanged,
  });

  final String groupValue;
  final String value;
  final void Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
          fillColor: WidgetStateColor.resolveWith(
            (states) {
              if (groupValue == value) {
                return AppColors.primaryGreen;
              } else {
                return AppColors.grey300;
              }
            },
          ),
          // activeColor: AppColors.primaryGreen,
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
        ),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:kafiil_test/helper/colors.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.background = AppColors.primaryGreen,
    this.isUperCase = false,
    required this.text,
    required this.function,
  });

  final Color background;
  final bool isUperCase;
  final String text;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: background,
          padding: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: function,
        child: Center(
          child: Text(
            isUperCase ? text.toUpperCase() : text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500
            ),
          ),
        ),
      ),
    );
  }
}

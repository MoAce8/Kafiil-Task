import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kafiil_test/helper/colors.dart';
import 'package:kafiil_test/helper/constants.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.controller,
    this.suffix,
    this.obscure = false,
    this.keyboard,
    this.validator,
    this.inputFormatters,
    this.denySpaces = false,
    this.onChanged,
    this.maxLines = 1,
    this.minLines,
    this.prefix,
    this.title,
    this.readOnly = false,
    this.textCenter = false,
    this.onTap,
    this.onSubmitted,
  });

  final TextEditingController? controller;
  final Function(String? s)? onChanged;
  final Widget? suffix;
  final Widget? prefix;
  final bool obscure;
  final TextInputType? keyboard;
  final List<TextInputFormatter>? inputFormatters;
  final bool denySpaces;
  final String? Function(String? st)? validator;
  final int? maxLines;
  final int? minLines;
  final String? title;
  final bool readOnly;
  final bool textCenter;
  final void Function()? onTap;
  final void Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Text(
            title!,
            style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColors.grey500),
          ),
        if (title != null)
          SizedBox(
            height: screenHeight(context) * .006,
          ),
        TextField(
          inputFormatters: inputFormatters ?? [],
          controller: controller,
          obscureText: obscure,
          keyboardType: keyboard,
          onChanged: onChanged,
          maxLines: maxLines == 1 ? minLines ?? 1 : maxLines,
          minLines: minLines,
          readOnly: readOnly,
          textAlign: textCenter ? TextAlign.center : TextAlign.start,
          onTap: onTap,
          onSubmitted: onSubmitted,

          // style: const TextStyle(fontSize: 16),
          decoration: InputDecoration(
              focusedErrorBorder: buildBorder(),
              contentPadding: const EdgeInsets.all(16),
              fillColor: AppColors.grey50,
              filled: true,
              border: buildBorder(),
              prefixIcon: prefix,
              suffixIcon: suffix,
              suffixIconColor: Colors.grey,
              suffixIconConstraints:
                  BoxConstraints(maxHeight: screenHeight(context) * 0.04)),
        ),
      ],
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none);
  }
}

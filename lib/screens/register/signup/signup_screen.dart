import 'package:flutter/material.dart';
import 'package:kafiil_test/helper/colors.dart';
import 'package:kafiil_test/helper/constants.dart';
import 'package:kafiil_test/screens/register/widgets/screen_indicator.dart';
import 'package:kafiil_test/widgets/app_button.dart';
import 'package:kafiil_test/widgets/custom_radio.dart';
import 'package:kafiil_test/widgets/custom_text_form_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key, required this.function});

  final void Function() function;

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool passwordVisible = true;
  bool confPasswordVisible = true;

  List userType = [
    'Seller',
    'Buyer',
    'Both',
  ];
  String groupVal = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ScreenIndicator(firstScreen: true),
            SizedBox(
              height: screenHeight(context) * .05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: screenWidth(context) * .44,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'First Name',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColors.grey500),
                      ),
                      SizedBox(
                        height: screenHeight(context) * .006,
                      ),
                      const AppTextFormField(),
                    ],
                  ),
                ),
                SizedBox(
                  width: screenWidth(context) * .44,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Last Name',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColors.grey500),
                      ),
                      SizedBox(
                        height: screenHeight(context) * .006,
                      ),
                      const AppTextFormField(),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: screenHeight(context) * .015,
            ),
            const Text(
              'Email Address',
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.grey500),
            ),
            SizedBox(
              height: screenHeight(context) * .006,
            ),
            const AppTextFormField(),
            SizedBox(
              height: screenHeight(context) * .015,
            ),
            const Text(
              'Password',
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.grey500),
            ),
            SizedBox(
              height: screenHeight(context) * .006,
            ),
            AppTextFormField(
              suffix: IconButton(
                icon: Icon(
                  passwordVisible
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                ),
                onPressed: () {
                  setState(() {
                    passwordVisible = !passwordVisible;
                  });
                },
              ),
            ),
            SizedBox(
              height: screenHeight(context) * .015,
            ),
            const Text(
              'Confirm Password',
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.grey500),
            ),
            SizedBox(
              height: screenHeight(context) * .006,
            ),
            AppTextFormField(
              suffix: IconButton(
                icon: Icon(
                  confPasswordVisible
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                ),
                onPressed: () {
                  setState(() {
                    confPasswordVisible = !confPasswordVisible;
                  });
                },
              ),
            ),
            SizedBox(
              height: screenHeight(context) * .015,
            ),
            const Text(
              'User Type',
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.grey500),
            ),
            SizedBox(
              height: screenHeight(context) * .006,
            ),
            Row(
              children: [
                AppRadio(
                  groupValue: groupVal,
                  value: 'Seller',
                  onChanged: (val) {
                    setState(() {
                      groupVal = val!;
                    });
                  },
                ),
                AppRadio(
                  groupValue: groupVal,
                  value: 'Buyer',
                  onChanged: (val) {
                    setState(() {
                      groupVal = val!;
                    });
                  },
                ),
                AppRadio(
                  groupValue: groupVal,
                  value: 'Both',
                  onChanged: (val) {
                    setState(() {
                      groupVal = val!;
                    });
                  },
                ),
              ],
            ),
            SizedBox(
              height: screenHeight(context) * .065,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: screenWidth(context) * .44,
                  child: AppButton(text: 'Next', function: widget.function),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

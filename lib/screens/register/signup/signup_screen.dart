import 'package:flutter/material.dart';
import 'package:kafiil_test/cubit/register_pages_cubit/register_cubit.dart';
import 'package:kafiil_test/cubit/user_data_cubit/user_data_cubit.dart';
import 'package:kafiil_test/helper/colors.dart';
import 'package:kafiil_test/helper/constants.dart';
import 'package:kafiil_test/screens/register/widgets/error_message.dart';
import 'package:kafiil_test/screens/register/widgets/screen_indicator.dart';
import 'package:kafiil_test/widgets/app_button.dart';
import 'package:kafiil_test/widgets/custom_radio.dart';
import 'package:kafiil_test/widgets/custom_text_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({
    super.key,
  });

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool passwordVisible = true;
  bool confPasswordVisible = true;
  bool visible = false;

  TextEditingController fName = TextEditingController();
  TextEditingController lName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confPassword = TextEditingController();

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
            ErrorMessage(visible: visible),
            SizedBox(
              height: screenHeight(context) * .03,
            ),
            const ScreenIndicator(firstScreen: true),
            SizedBox(
              height: screenHeight(context) * .05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: screenWidth(context) * .44,
                  child: AppTextField(
                    title: 'First Name',
                    controller: fName,
                  ),
                ),
                SizedBox(
                  width: screenWidth(context) * .44,
                  child: AppTextField(
                    title: 'Last Name',
                    controller: lName,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: screenHeight(context) * .015,
            ),
            AppTextField(
              title: 'Email Address',
              controller: email,
            ),
            SizedBox(
              height: screenHeight(context) * .015,
            ),
            AppTextField(
              title: 'Password',
              controller: password,
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
            AppTextField(
              title: 'Confirm Password',
              controller: confPassword,
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
                  child: AppButton(
                    text: 'Next',
                    function: () {
                      if (fName.text
                          .trim()
                          .isNotEmpty &&
                          lName.text
                              .trim()
                              .isNotEmpty &&
                          email.text
                              .trim()
                              .isNotEmpty &&
                          password.text
                              .trim()
                              .isNotEmpty &&
                          password.text == confPassword.text &&
                          groupVal.isNotEmpty) {
                        UserDataCubit.get(context).updateData(
                          firstName: fName.text,
                          lastName: lName.text,
                          email: email.text,
                          password: password.text,
                          userType: groupVal,
                        );
                        print(UserDataCubit.get(context).user.firstName);
                        RegisterCubit.get(context).goToNextScreen();
                      } else {
                        setState(() {
                          visible = true;
                        });
                      }
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

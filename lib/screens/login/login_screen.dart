import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafiil_test/cubit/register_pages_cubit/register_cubit.dart';
import 'package:kafiil_test/helper/colors.dart';
import 'package:kafiil_test/helper/constants.dart';
import 'package:kafiil_test/screens/register/register_pages.dart';
import 'package:kafiil_test/screens/tabs_screen/tabs_screen.dart';
import 'package:kafiil_test/widgets/app_button.dart';
import 'package:kafiil_test/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Account Login',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.grey[900],
          ),
        ),
        surfaceTintColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: screenWidth(context) * .035),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset('assets/images/login.png'),
              ),
              SizedBox(
                height: screenHeight(context) * .015,
              ),
              const AppTextField(
                title: 'Email Address',
              ),
              SizedBox(
                height: screenHeight(context) * .015,
              ),
              AppTextField(
                title: 'Password',
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
              Row(
                children: [
                  Checkbox(
                    activeColor: AppColors.primaryGreen,
                    value: true,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                    onChanged: (value) {},
                  ),
                  const Text(
                    'Remember me',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.grey500,
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.grey500,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight(context) * .025,
              ),
              AppButton(
                text: 'Login',
                function: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TabsScreen(),
                      ));
                },
              ),
              SizedBox(
                height: screenHeight(context) * .02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Don’t have an account ? ',
                    style: TextStyle(
                        fontWeight: FontWeight.w500, color: AppColors.grey500),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlocProvider(
                            create: (context) => RegisterCubit(),
                            child: const RegisterPages(),
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      'Register',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryGreen),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

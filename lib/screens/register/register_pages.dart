import 'package:flutter/material.dart';
import 'package:kafiil_test/cubit/register_pages_cubit/register_cubit.dart';
import 'package:kafiil_test/helper/constants.dart';
import 'package:kafiil_test/screens/register/complete_data/complete_data_screen.dart';
import 'package:kafiil_test/screens/register/signup/signup_screen.dart';

class RegisterPages extends StatefulWidget {
  const RegisterPages({super.key});

  @override
  State<RegisterPages> createState() => _RegisterPagesState();
}

class _RegisterPagesState extends State<RegisterPages> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Row(
            children: [
              const Icon(Icons.arrow_back_ios_new),
              SizedBox(width: screenWidth(context)*.01,),
              Text(
                'Register',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[900],
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth(context) * .05,
        ),
        child: Column(
          children: [
            Expanded(
              child: PageView(
                physics:  const NeverScrollableScrollPhysics(),
                controller: RegisterCubit.get(context).pageController,
                children: const [
                  SignupScreen(),
                  CompleteDataScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

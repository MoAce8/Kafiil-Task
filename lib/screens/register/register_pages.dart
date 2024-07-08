import 'package:flutter/material.dart';
import 'package:kafiil_test/helper/constants.dart';
import 'package:kafiil_test/screens/register/signup/signup_screen.dart';
import 'package:kafiil_test/screens/register/widgets/screen_indicator.dart';

class RegisterPages extends StatefulWidget {
  const RegisterPages({super.key});

  @override
  State<RegisterPages> createState() => _RegisterPagesState();
}

class _RegisterPagesState extends State<RegisterPages> {
  PageController pageController = PageController();
  int currentIndex = 0;
  bool firstScreen = true;

  void goToNextScreen() {
    setState(() {
      currentIndex++;
      pageController.jumpToPage(currentIndex);
      firstScreen = false;
      if (currentIndex > 1) {
        currentIndex = 0;
        firstScreen = true;
        pageController
            .jumpToPage(currentIndex); // Reset index after the last screen
      }
    });
  }

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
            ScreenIndicator(firstScreen: firstScreen),
            Expanded(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: pageController,
                children: [
                  SignupScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

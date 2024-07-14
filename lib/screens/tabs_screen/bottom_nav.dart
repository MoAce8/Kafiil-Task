import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kafiil_test/helper/colors.dart';
import 'package:kafiil_test/helper/constants.dart';

class BuildBottomNavBar extends StatelessWidget {
  const BuildBottomNavBar({
    super.key,
    required this.selectScreen,
    required this.activeScreen,
  });

  final void Function(int) selectScreen;
  final int activeScreen;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        // highlightColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
      ),
      child: BottomNavigationBar(
        elevation: 10,
        onTap: selectScreen,
        currentIndex: activeScreen,
        selectedItemColor: AppColors.primaryGreen,
        unselectedItemColor: AppColors.grey300,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: screenWidth(context) * 0.028,
        selectedFontSize: screenWidth(context) * 0.028,
        iconSize: screenWidth(context) * 0.085,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/who.png',
              color: activeScreen == 0
                  ? AppColors.primaryGreen
                  : AppColors.grey300,
            ),
            label: 'Who Am I',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/earth.png',
              color: activeScreen == 1
                  ? AppColors.primaryGreen
                  : AppColors.grey300,
            ),
            label: 'Countries',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/cart.png',
              color: activeScreen == 2
                  ? AppColors.primaryGreen
                  : AppColors.grey300,
            ),
            label: 'Services',
          ),
        ],
      ),
    );
  }
}

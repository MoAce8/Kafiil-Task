import 'package:flutter/material.dart';
import 'package:kafiil_test/screens/countries/countries_screen.dart';
import 'package:kafiil_test/screens/services/services_screen.dart';
import 'package:kafiil_test/screens/tabs_screen/bottom_nav.dart';
import 'package:kafiil_test/screens/who_am_i/who_am_i_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int activeScreen = 0;
  List navScreens = [
    const WhoAmIScreen(),
    const CountriesScreen(),
    const ServicesScreen(),
  ];

  void selectScreen(int id) {
    setState(() {
      activeScreen = id;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navScreens[activeScreen],
      bottomNavigationBar: BuildBottomNavBar(
        selectScreen: selectScreen,
        activeScreen: activeScreen,
      ),
    );
  }
}

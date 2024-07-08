import 'package:flutter/material.dart';
import 'package:kafiil_test/screens/register/widgets/screen_indicator.dart';

class CompleteDataScreen extends StatefulWidget {
  const CompleteDataScreen({super.key, required this.function});

  final void Function() function;

  @override
  State<CompleteDataScreen> createState() => _CompleteDataScreenState();
}

class _CompleteDataScreenState extends State<CompleteDataScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ScreenIndicator(firstScreen: false),
        ],
      ),
    );
  }
}

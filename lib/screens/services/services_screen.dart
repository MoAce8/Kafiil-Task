import 'package:flutter/material.dart';
import 'package:kafiil_test/helper/constants.dart';
import 'package:kafiil_test/screens/services/widgets/service_card.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Services',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.grey[900],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth(context) * .025,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: screenHeight(context) * .25,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => const ServiceCard(),
                separatorBuilder: (context, index) => SizedBox(
                  width: 5,
                ),
                itemCount: 6,
              ),
            ),
            SizedBox(
              height: screenHeight(context) * .02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth(context) * .025,
              ),
              child: Text(
                'Popular Services',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[900],
                ),
              ),
            ),
            SizedBox(
              height: screenHeight(context) * .02,
            ),
            SizedBox(
              height: screenHeight(context) * .25,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => const ServiceCard(),
                separatorBuilder: (context, index) => SizedBox(
                  width: 5,
                ),
                itemCount: 6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

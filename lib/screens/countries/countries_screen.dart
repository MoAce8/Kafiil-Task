import 'package:flutter/material.dart';
import 'package:kafiil_test/helper/colors.dart';
import 'package:kafiil_test/helper/constants.dart';
import 'package:kafiil_test/screens/countries/widgets/divided_row.dart';
import 'package:number_paginator/number_paginator.dart';

class CountriesScreen extends StatefulWidget {
  const CountriesScreen({Key? key}) : super(key: key);

  @override
  State<CountriesScreen> createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  NumberPaginatorController con = NumberPaginatorController();
  int p = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Countries',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.grey[900],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth(context) * .05,
            vertical: screenHeight(context) * .005),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth(context) * .025,
                  vertical: screenHeight(context) * .008),
              width: screenWidth(context) * .9,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.grey50,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.symmetric(
                        horizontal: screenWidth(context) * .11,
                        vertical: screenHeight(context) * .008),
                    child: const Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            'Country',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppColors.grey500,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(flex: 2, child: SizedBox()),
                        Expanded(
                          flex: 1,
                          child: Text(
                            'Capital',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppColors.grey500,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const DividedRow(divided: true),
                  const DividedRow(divided: true),
                  const DividedRow(divided: true),
                  const DividedRow(divided: true),
                  const DividedRow(divided: true),
                  const DividedRow(divided: true),
                  const DividedRow(divided: true),
                  const DividedRow(divided: false),
                ],
              ),
            ),
            SizedBox(
              height: screenHeight(context) * .025,
            ),
            NumberPaginator(
              numberPages: 10,
              controller: con,
              initialPage: p,
              config: NumberPaginatorUIConfig(
                buttonShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
                buttonSelectedBackgroundColor: AppColors.primaryGreen,
              ),
              onPageChange: (p0) {
                setState(() {
                  p = p0;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

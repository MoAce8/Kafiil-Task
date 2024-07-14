import 'package:flutter/material.dart';
import 'package:kafiil_test/helper/colors.dart';
import 'package:kafiil_test/helper/constants.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      width: screenWidth(context) * .4,
      padding: EdgeInsets.all(screenWidth(context) * .015),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Image.asset('assets/images/product.png'),
              Positioned(
                left: 10,
                bottom: 10,
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth(context) * .02,
                      vertical: screenHeight(context) * .0015),
                  decoration: BoxDecoration(
                    color: AppColors.primaryGreen,
                    borderRadius: BorderRadius.circular(27),
                  ),
                  child: Text(
                    '\$100',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: screenHeight(context) * .015,
          ),
          Text(
            'Logo Design -Graphic Design Graphic Design',
            softWrap: true,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: screenHeight(context) * .015,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.star,
                color: Colors.yellow,
              ),
              Text(
                '(4.5)',
                style: TextStyle(
                  color: Colors.yellow,
                  fontSize: 12,
                ),
              ),
              SizedBox(width: screenWidth(context)*.01,),
              Text(
                '|',
                style: TextStyle(
                  color: AppColors.grey300,
                  fontSize: 12,
                ),
              ),
              SizedBox(width: screenWidth(context)*.01,),
              Image.asset(
                'assets/images/basket.png',
                color: AppColors.grey600,
              ),
              Text(
                '(4.5)',
                style: TextStyle(
                  color: AppColors.grey600,
                  fontSize: 12,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

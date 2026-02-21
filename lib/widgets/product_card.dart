import 'package:flutter/cupertino.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.screenWidth / 2.7,
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.height10,
        vertical: Dimensions.height10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: Dimensions.height100,
            width: Dimensions.screenWidth / 3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius10),
              color: AppColors.grey3,
            ),
          ),
          SizedBox(height: Dimensions.height5),
          Text(
            'Spicy Noodles',
            style: TextStyle(
              fontSize: Dimensions.font14,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            'Meals',
            style: TextStyle(
              fontSize: Dimensions.font14,
              fontWeight: FontWeight.w300,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'N1200',
                style: TextStyle(
                  fontSize: Dimensions.font14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.accentColor,
                ),
              ),
              Icon(
                CupertinoIcons.plus_circle_fill,
                size: Dimensions.iconSize20,
                color: AppColors.primaryColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

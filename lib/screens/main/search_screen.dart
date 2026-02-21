import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_textfield.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        leadingIcon: Container(
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.width5,
            vertical: Dimensions.height5,
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.grey1,
          ),
          child: Icon(Icons.chevron_left),
        ),
        customTitle: Align(
          alignment: AlignmentGeometry.centerLeft,
          child: Text(
            'Search',
            style: TextStyle(
              fontSize: Dimensions.font20,
              fontWeight: FontWeight.w400,
              color: AppColors.accentColor,
            ),
          ),
        ),

        actionIcon: Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.width10,
                vertical: Dimensions.height10,
              ),
              decoration: BoxDecoration(
                color: Color(0xFF181C2E),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Iconsax.shopping_bag,
                color: AppColors.white,
                size: Dimensions.iconSize20,
              ),
            ),
            Positioned(
              right: 0,
              top: -2,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.width5,
                  vertical: Dimensions.height5,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  '3',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: Dimensions.font12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.width20,
          vertical: Dimensions.height20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              hintText: 'Search for restaurants, meals, and more',
              maxLines: 1,
              prefixIcon: Padding(
                padding: EdgeInsetsGeometry.only(left: Dimensions.width20),
                child: Icon(Iconsax.global_search5),
              ),
              suffixIcon: Icon(Icons.cancel, color: AppColors.grey4),
            ),
            SizedBox(height: Dimensions.height20),
            Text(
              'Recent Keywords',
              style: TextStyle(fontSize: Dimensions.font18),
            ),
            SizedBox(height: Dimensions.height20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.width10,
                      vertical: Dimensions.height10,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.grey2, width: 2),
                      borderRadius: BorderRadius.circular(Dimensions.radius30),
                    ),
                    child: Text(
                      'Rice and Beans',
                      style: TextStyle(
                        color: AppColors.grey5,
                        fontSize: Dimensions.font16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  SizedBox(width: Dimensions.width20),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.width10,
                      vertical: Dimensions.height10,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.grey2, width: 2),
                      borderRadius: BorderRadius.circular(Dimensions.radius30),
                    ),
                    child: Text(
                      'Jollof Rice',
                      style: TextStyle(
                        color: AppColors.grey5,
                        fontSize: Dimensions.font16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  SizedBox(width: Dimensions.width20),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.width10,
                      vertical: Dimensions.height10,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.grey2, width: 2),
                      borderRadius: BorderRadius.circular(Dimensions.radius30),
                    ),
                    child: Text(
                      'Chicken and Chips',
                      style: TextStyle(
                        color: AppColors.grey5,
                        fontSize: Dimensions.font16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: Dimensions.height20),

            Text(
              'Suggested Restaurants',
              style: TextStyle(fontSize: Dimensions.font18),
            ),

          ],
        ),
      ),
    );
  }
}

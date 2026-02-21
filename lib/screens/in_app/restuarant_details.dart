import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodora/utils/app_constants.dart';
import 'package:foodora/widgets/custom_button.dart';
import 'package:foodora/widgets/product_card.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/custom_appbar.dart';

class RestaurantDetailsScreen extends StatefulWidget {
  const RestaurantDetailsScreen({super.key});

  @override
  State<RestaurantDetailsScreen> createState() =>
      _RestaurantDetailsScreenState();
}

class _RestaurantDetailsScreenState extends State<RestaurantDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        leadingIcon: InkWell(
          onTap: () {
            Get.back();
          },
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.width5,
              vertical: Dimensions.height5,
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.grey1,
            ),
            child: Icon(Iconsax.arrow_left_2),
          ),
        ),
        customTitle: Text(
          'Restaurant View',
          style: TextStyle(
            fontSize: Dimensions.font17,
            fontWeight: FontWeight.w500,
            color: AppColors.accentColor,
          ),
        ),
        actionIcon: Container(
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.width10,
            vertical: Dimensions.height10,
          ),
          decoration: BoxDecoration(
            color: AppColors.grey1,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Iconsax.more,
            color: AppColors.black,
            size: Dimensions.iconSize20,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.width20,
          vertical: Dimensions.height20,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: Dimensions.height100 * 2.2,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  border: Border.all(color: AppColors.accentColor),
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: AssetImage(AppConstants.getPngAsset('vicolas')),
                  ),
                ),
              ),
              SizedBox(height: Dimensions.height20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Vicolas - Item 7 Restaurant',
                    style: TextStyle(
                      fontSize: Dimensions.font18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  CustomButton(
                    text: 'Follow',
                    onPressed: () {},
                    padding: EdgeInsets.symmetric(
                      vertical: Dimensions.height5,
                      horizontal: Dimensions.width10,
                    ),
                    textStyle: TextStyle(
                      fontSize: Dimensions.font14,
                      color: AppColors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: Dimensions.height10),
              Text(
                'Maecenas sed diam eget risus varius blandit sit amet non magna. Integer posuere erat a ante venenatis dapibus posuere velit aliquet.',
                style: TextStyle(
                  fontSize: Dimensions.font14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey5,
                ),
              ),
              SizedBox(height: Dimensions.height10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Iconsax.star,
                        size: Dimensions.iconSize16,
                        color: AppColors.primaryColor,
                      ),
                      SizedBox(width: Dimensions.width5),
                      Text('5.0'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Iconsax.truck,
                        size: Dimensions.iconSize16,
                        color: AppColors.primaryColor,
                      ),
                      SizedBox(width: Dimensions.width5),
                      Text('Free'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Iconsax.clock,
                        size: Dimensions.iconSize16,
                        color: AppColors.primaryColor,
                      ),
                      SizedBox(width: Dimensions.width5),
                      Text('20 mins'),
                    ],
                  ),
                ],
              ),
              SizedBox(height: Dimensions.height20),
              Text(
                'Profile Highlights',
                style: TextStyle(
                  fontSize: Dimensions.font18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: Dimensions.height20),
              Container(
                height: Dimensions.height100 * 1.5,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: AppColors.grey1,
                  border: Border.all(color: AppColors.grey3),
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  // image: DecorationImage(
                  //   fit: BoxFit.contain,
                  //   image: AssetImage(AppConstants.getPngAsset('vicolas')),
                  // ),
                ),
                child: Icon(Iconsax.play_circle, size: Dimensions.iconSize30),
              ),
              SizedBox(height: Dimensions.height20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.width20,
                        vertical: Dimensions.height10,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.grey2, width: 2),
                        borderRadius: BorderRadius.circular(
                          Dimensions.radius30,
                        ),
                        color: AppColors.primaryColor,
                      ),
                      child: Text(
                        'All',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: Dimensions.font16,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    SizedBox(width: Dimensions.width20),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.width20,
                        vertical: Dimensions.height10,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.grey2, width: 2),
                        borderRadius: BorderRadius.circular(
                          Dimensions.radius30,
                        ),
                      ),
                      child: Text(
                        'Meals',
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
                        horizontal: Dimensions.width20,
                        vertical: Dimensions.height10,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.grey2, width: 2),
                        borderRadius: BorderRadius.circular(
                          Dimensions.radius30,
                        ),
                      ),
                      child: Text(
                        'Snacks',
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
                        horizontal: Dimensions.width20,
                        vertical: Dimensions.height10,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.grey2, width: 2),
                        borderRadius: BorderRadius.circular(
                          Dimensions.radius30,
                        ),
                      ),
                      child: Text(
                        'Drinks',
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
                'All (11)',
                style: TextStyle(
                  fontSize: Dimensions.font18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: Dimensions.height20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProductCard(),
                  SizedBox(width: Dimensions.width30),
                  ProductCard(),
                ],
              ),
              SizedBox(height: Dimensions.height100),
            ],
          ),
        ),
      ),
    );
  }
}

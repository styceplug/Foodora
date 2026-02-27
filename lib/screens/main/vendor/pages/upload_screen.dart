import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/app_constants.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/dimensions.dart';
import '../../../../widgets/custom_appbar.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_textfield.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'ADD NEW ITEMS',
                    style: TextStyle(
                      fontSize: Dimensions.font18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'RESET',
                    style: TextStyle(
                      fontSize: Dimensions.font14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: Dimensions.height20),
              Text(
                'ITEM NAME',
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: Dimensions.font14,
                ),
              ),
              SizedBox(height: Dimensions.height5),
              CustomTextField(hintText: 'Chicken Bwari'),
              SizedBox(height: Dimensions.height20),
              Text(
                'UPLOAD PHOTO / VIDEO',
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: Dimensions.font14,
                ),
              ),
              SizedBox(height: Dimensions.height5),
              Container(
                height: Dimensions.height100,
                width: Dimensions.width100,
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.width20,
                  vertical: Dimensions.height20,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.grey3,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppConstants.getPngAsset('cloud'),
                      height: Dimensions.height40,
                    ),
                    Text('Add', style: TextStyle(fontSize: Dimensions.font12)),
                  ],
                ),
              ),
              SizedBox(height: Dimensions.height20),
              Text(
                'CATEGORY',
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: Dimensions.font14,
                ),
              ),
              SizedBox(height: Dimensions.height5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.check_box_outline_blank),
                      SizedBox(width: Dimensions.width10),
                      Text('FOOD'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.check_box_outline_blank),
                      SizedBox(width: Dimensions.width10),
                      Text('SNACKS'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.check_box_outline_blank),
                      SizedBox(width: Dimensions.width10),
                      Text('DRINKS'),
                    ],
                  ),
                ],
              ),

              SizedBox(height: Dimensions.height20),
              Text(
                'PRICE',
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: Dimensions.font14,
                ),
              ),
              SizedBox(height: Dimensions.height5),
              Row(
                children: [
                  Expanded(child: CustomTextField(hintText: '\$50')),
                  SizedBox(width: Dimensions.width20),
                  Row(
                    children: [
                      Icon(Icons.check_box_outline_blank),
                      SizedBox(width: Dimensions.width10),
                      Text('PICK UP'),
                    ],
                  ),
                  SizedBox(width: Dimensions.width20),
                  Row(
                    children: [
                      Icon(Icons.check_box_outline_blank),
                      SizedBox(width: Dimensions.width10),
                      Text('DELIVERY'),
                    ],
                  ),
                ],
              ),
              SizedBox(height: Dimensions.height20),
              Text(
                'ADDITION',
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: Dimensions.font14,
                ),
              ),
              SizedBox(height: Dimensions.height5),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.width20,
                      vertical: Dimensions.height20,
                    ),
                    margin: EdgeInsets.only(right: Dimensions.width10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.grey4),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          AppConstants.getPngAsset('boiled-egg'),
                          width: Dimensions.width10 * 2.5,
                        ),
                        Text(
                          'Eggs',
                          style: TextStyle(fontSize: Dimensions.font12),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.width20,
                      vertical: Dimensions.height20,
                    ),
                    margin: EdgeInsets.only(right: Dimensions.width10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.grey4),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          AppConstants.getPngAsset('chicken-leg'),
                          width: Dimensions.width10 * 2.5,
                        ),
                        Text(
                          'Chic..',
                          style: TextStyle(fontSize: Dimensions.font12),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.width20,
                      vertical: Dimensions.height20,
                    ),
                    margin: EdgeInsets.only(right: Dimensions.width10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.grey4),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          AppConstants.getPngAsset('meat'),
                          width: Dimensions.width10 * 2.5,
                        ),
                        Text(
                          'Beef',
                          style: TextStyle(fontSize: Dimensions.font12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: Dimensions.height20),

              Text(
                'DETAILS',
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: Dimensions.font14,
                ),
              ),
              SizedBox(height: Dimensions.height5),
              CustomTextField(
                hintText:
                    'Lorem ipsum dolor sit amet, consectetur adips cing elit. Bibendum in vel, mattis et amet dui mauris turpis.',
                maxLines: 3,
              ),

              SizedBox(height: Dimensions.height100),
              CustomButton(text: 'REGISTER', onPressed: () {}),
              SizedBox(height: Dimensions.height100),
            ],
          ),
        ),
      ),
    );
  }
}

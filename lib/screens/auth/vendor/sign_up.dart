import 'package:flutter/material.dart';
import 'package:foodora/utils/app_constants.dart';
import 'package:foodora/utils/colors.dart';
import 'package:foodora/utils/dimensions.dart';
import 'package:foodora/widgets/custom_appbar.dart';
import 'package:foodora/widgets/custom_button.dart';
import 'package:foodora/widgets/custom_textfield.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../routes/routes.dart';

class SignUpVendor extends StatefulWidget {
  const SignUpVendor({super.key});

  @override
  State<SignUpVendor> createState() => _SignUpVendorState();
}

class _SignUpVendorState extends State<SignUpVendor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.width20,
          vertical: Dimensions.height20,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Register your business',
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
                'STORE NAME',
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: Dimensions.font14,
                ),
              ),
              SizedBox(height: Dimensions.height5),
              CustomTextField(hintText: 'Chicken Republic....'),
              SizedBox(height: Dimensions.height20),
              Text(
                'UPLOAD LOGO',
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
                'MESSAGE TO CUSTOMER',
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
              SizedBox(height: Dimensions.height20),
              Text(
                'PROFILE HIGHLIGHT (VIDEOS ONLY .MP4 format)',
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
                'STORE LOCATION',
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: Dimensions.font14,
                ),
              ),
              SizedBox(height: Dimensions.height5),
              CustomTextField(
                hintText:
                    'Tap on Location icon',
                maxLines: 1,
                suffixIcon: Icon(Iconsax.location),
              ),
              SizedBox(height: Dimensions.height5,),
              Text('Make sure you are at your store’s location while registering... For seamless recommendation to customers around you.',style: TextStyle(fontSize: Dimensions.font12,color: AppColors.grey5,fontWeight: FontWeight.w300),),
              SizedBox(height: Dimensions.height100),
              CustomButton(text: 'REGISTER', onPressed: (){
                Get.offAllNamed(AppRoutes.homePage);
              }),
              SizedBox(height: Dimensions.height100),

            ],
          ),
        ),
      ),
    );
  }
}

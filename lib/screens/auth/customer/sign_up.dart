import 'package:flutter/material.dart';
import 'package:foodora/routes/routes.dart';
import 'package:foodora/utils/app_constants.dart';
import 'package:foodora/utils/colors.dart';
import 'package:foodora/utils/dimensions.dart';
import 'package:foodora/widgets/custom_button.dart';
import 'package:foodora/widgets/custom_textfield.dart';
import 'package:get/get.dart';

class SignUpCustomer extends StatefulWidget {
  const SignUpCustomer({super.key});

  @override
  State<SignUpCustomer> createState() => _SignUpCustomerState();
}

class _SignUpCustomerState extends State<SignUpCustomer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.redBG,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Stack(
              children: [
                Image.asset(AppConstants.getPngAsset('sign-up-bg')),
                Positioned(
                  top: Dimensions.height70,
                  left: Dimensions.width20,
                  child: InkWell(
                    onTap: (){
                      Get.back();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: Dimensions.width10,vertical: Dimensions.height10),
                      decoration: BoxDecoration(shape: BoxShape.circle,color: AppColors.white),
                      child: Icon(
                        Icons.chevron_left,
                        color: AppColors.redBG,
                        size: Dimensions.width30,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: Dimensions.screenHeight,
            width: Dimensions.screenWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Spacer(),
                Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: Dimensions.font30 * 1.1,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                  ),
                ),
                Text(
                  'Please sign up to get started',
                  style: TextStyle(
                    fontSize: Dimensions.font20,
                    fontWeight: FontWeight.w400,
                    color: AppColors.white,
                  ),
                ),
                SizedBox(height: Dimensions.height40),
                Container(
                  width: Dimensions.screenWidth,
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.width20,
                    vertical: Dimensions.height50,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.radius30),
                      topRight: Radius.circular(Dimensions.radius30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'NAME',
                        style: TextStyle(
                          fontSize: Dimensions.font14,
                          color: AppColors.accentColor,
                        ),
                      ),
                      SizedBox(height: Dimensions.height5),
                      CustomTextField(hintText: 'John Doe'),
                      SizedBox(height: Dimensions.height20),
                      Text(
                        'EMAIL',
                        style: TextStyle(
                          fontSize: Dimensions.font14,
                          color: AppColors.accentColor,
                        ),
                      ),
                      SizedBox(height: Dimensions.height5),
                      CustomTextField(hintText: 'example@gmail.com'),
                      SizedBox(height: Dimensions.height20),
                      Text(
                        'PASSWORD',
                        style: TextStyle(
                          fontSize: Dimensions.font14,
                          color: AppColors.accentColor,
                        ),
                      ),
                      SizedBox(height: Dimensions.height5),
                      CustomTextField(hintText: 'example@gmail.com'),
                      SizedBox(height: Dimensions.height20),
                      Text(
                        'RE-TYPE PASSWORD',
                        style: TextStyle(
                          fontSize: Dimensions.font14,
                          color: AppColors.accentColor,
                        ),
                      ),
                      SizedBox(height: Dimensions.height5),
                      CustomTextField(hintText: 'example@gmail.com'),
                      SizedBox(height: Dimensions.height50),
                      CustomButton(text: 'SIGN UP', onPressed: () {
                        Get.toNamed(AppRoutes.verifyOtpScreen);
                      }),
                      SizedBox(height: Dimensions.height20),
                      InkWell(
                        onTap: (){
                          Get.toNamed(AppRoutes.loginScreen);
                        },
                        child: Text(
                        'ALREADY HAVE AN ACCOUNT? LOG IN HERE',
                          style: TextStyle(
                            fontSize: Dimensions.font14,
                            color: AppColors.redBG,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      ),

                      SizedBox(height: Dimensions.height70),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

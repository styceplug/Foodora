import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/routes.dart';
import '../../utils/app_constants.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
            child: Image.asset(AppConstants.getPngAsset('login_bg')),
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
                  'Log In',
                  style: TextStyle(
                    fontSize: Dimensions.font30 * 1.1,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                  ),
                ),
                Text(
                  'Please sign in to your existing account',
                  style: TextStyle(
                    fontSize: Dimensions.font18,
                    fontWeight: FontWeight.w400,
                    color: AppColors.white,
                  ),
                ),
                SizedBox(height: Dimensions.height70),
                Container(
                  width: Dimensions.screenWidth,
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.width20,
                    vertical: Dimensions.height30,
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
                      SizedBox(height: Dimensions.height15),
                      Row(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.check_box_rounded,
                                color: AppColors.primaryColor,
                                size: Dimensions.iconSize20,
                              ),
                              SizedBox(width: Dimensions.width10),
                              Text(
                                'Remember me',
                                style: TextStyle(fontSize: Dimensions.font14),
                              ),
                            ],
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              Get.toNamed(AppRoutes.forgotPasswordScreen);
                            },
                            child: Text(
                              'Forgot Password',
                              style: TextStyle(
                                fontSize: Dimensions.font13,
                                color: AppColors.accentColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: Dimensions.height15),

                      CustomButton(text: 'LOG IN', onPressed: () {}),
                      SizedBox(height: Dimensions.height20),
                      InkWell(
                        onTap: () {
                          Get.offAllNamed(AppRoutes.onboardingScreen);
                        },
                        child: Text(
                          'NEW HERE? SIGN UP HERE',
                          style: TextStyle(
                            fontSize: Dimensions.font14,
                            color: AppColors.redBG,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),

                      SizedBox(height: Dimensions.height70 * 2),
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

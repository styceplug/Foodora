import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/routes.dart';
import '../../utils/app_constants.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
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
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.width10,
                        vertical: Dimensions.height10,
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.white,
                      ),
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

            child: Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: Dimensions.height100*2),
                  Text(
                    'Forgot Password',
                    style: TextStyle(
                      fontSize: Dimensions.font30 * 1.1,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.width50,
                      vertical: Dimensions.height5
                    ),
                    child: Text(
                      'Please enter your email to receive a link to reset your password',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: Dimensions.font15,
                        fontWeight: FontWeight.w400,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                  Spacer(),
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
                          'EMAIL',
                          style: TextStyle(
                            fontSize: Dimensions.font14,
                            color: AppColors.accentColor,
                          ),
                        ),
                        SizedBox(height: Dimensions.height5),
                        CustomTextField(hintText: 'example@gmail.com'),

                        SizedBox(height: Dimensions.height30),
                        CustomButton(text: 'REQUEST LINK', onPressed: () {}),

                        SizedBox(height: Dimensions.height50),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

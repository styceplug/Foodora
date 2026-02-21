import 'package:flutter/material.dart';
import 'package:foodora/widgets/otp_box.dart';
import 'package:get/get.dart';

import '../../routes/routes.dart';
import '../../utils/app_constants.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';



class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: Dimensions.height100),
                Text(
                  'Verification',
                  style: TextStyle(
                    fontSize: Dimensions.font30 * 1.1,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Dimensions.width50),
                  child: Text(
                    'We sent a verification code to your email',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: Dimensions.font16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white,
                    ),
                  ),
                ),
                SizedBox(height: Dimensions.height40),
                Expanded(
                  child: Container(
                    width: Dimensions.screenWidth,
                    height: double.maxFinite,
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
                        Row(
                          children: [
                            Text(
                              'CODE',
                              style: TextStyle(
                                fontSize: Dimensions.font14,
                                color: AppColors.accentColor,
                              ),
                            ),
                            Spacer(),
                            Text(
                              'Resend in 30 secs',
                              style: TextStyle(
                                fontSize: Dimensions.font14,
                                color: AppColors.accentColor,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: Dimensions.height20),
                        OtpInput(),

                        SizedBox(height: Dimensions.height50),
                        CustomButton(text: 'VERIFY', onPressed: () {
                          Get.toNamed(AppRoutes.locationAccessScreen);
                        }),

                        SizedBox(height: Dimensions.height70),
                      ],
                    ),
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

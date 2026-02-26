import 'package:flutter/material.dart';
import 'package:foodora/utils/app_constants.dart';
import 'package:foodora/widgets/custom_button.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/colors.dart';
import '../../../utils/dimensions.dart';
import '../../../widgets/custom_appbar.dart';



class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        backgroundColor: Colors.transparent,
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
              color: AppColors.grey3,
            ),
            child: Icon(Iconsax.arrow_left_2, color: AppColors.accentColor),
          ),
        ),
        customTitle: Text(
          'Payment',
          style: TextStyle(
            fontSize: Dimensions.font17,
            fontWeight: FontWeight.w500,
            color: AppColors.accentColor,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.width20,
          vertical: Dimensions.height20,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.width20,
                    vertical: Dimensions.height20,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.grey1,
                    borderRadius: BorderRadius.circular(Dimensions.radius10),
                  ),
                  margin: EdgeInsets.only(right: Dimensions.width10),
                  child: Image.asset(
                    AppConstants.getPngAsset('mastercard'),
                    height: Dimensions.height50,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.width20,
                    vertical: Dimensions.height20,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    border: Border.all(color: AppColors.grey1),
                    borderRadius: BorderRadius.circular(Dimensions.radius10),
                  ),
                  margin: EdgeInsets.only(right: Dimensions.width10),
                  child: Image.asset(
                    AppConstants.getPngAsset('crypto'),
                    height: Dimensions.height50,
                  ),
                ),
              ],
            ),
            SizedBox(height: Dimensions.height20),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.width20,
                vertical: Dimensions.height20,
              ),
              height: Dimensions.height100 * 5,
              decoration: BoxDecoration(
                color: AppColors.grey1,
                borderRadius: BorderRadius.circular(Dimensions.radius30),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppConstants.getPngAsset('no-card'),
                    height: Dimensions.height100 * 3,
                    width: double.maxFinite,
                    fit: BoxFit.fitWidth,
                  ),
                  Row(
                    children: [
                      Text(
                        'TOTAL : ',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: Dimensions.font18,
                          color: AppColors.grey4
                        ),
                      ),
                      Text(
                        'N12,500.00',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: Dimensions.font20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: Dimensions.height20),
            CustomButton(text: 'USE FLUTTERWAVE', onPressed: (){})
          ],
        ),
      ),
    );
  }
}

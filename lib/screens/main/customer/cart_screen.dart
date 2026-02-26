import 'package:flutter/material.dart';
import 'package:foodora/routes/routes.dart';
import 'package:foodora/utils/colors.dart';
import 'package:foodora/widgets/custom_button.dart';
import 'package:foodora/widgets/custom_textfield.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/dimensions.dart';
import '../../../widgets/custom_appbar.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
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
              color: AppColors.accentColor,
            ),
            child: Icon(Iconsax.arrow_left_2, color: AppColors.white),
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
        actionIcon: Text(
          'Clear Cart',
          style: TextStyle(
            fontSize: Dimensions.font15,
            color: AppColors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Spacer(),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.width20,
                vertical: Dimensions.height50,
              ),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(Dimensions.radius20),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text('DELIVERY ADDRESS'), Text('EDIT')],
                  ),
                  SizedBox(height: Dimensions.height10),
                  CustomTextField(hintText: '2118 Thornridge Cir. Syracuse'),
                  SizedBox(height: Dimensions.height20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            'TOTAL',
                            style: TextStyle(
                              color: AppColors.grey4,
                              fontSize: Dimensions.font14,
                            ),
                          ),
                          SizedBox(width: Dimensions.width10),
                          Text(
                            'N12,500',
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: Dimensions.font22,
                              fontWeight: FontWeight.w600
                            ),
                          ),

                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Breakdown',
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: Dimensions.font14,
                            ),
                          ),
                          SizedBox(width: Dimensions.width5),
                          Icon(Icons.chevron_right,size: Dimensions.iconSize16,color: AppColors.accentColor,)

                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: Dimensions.height20),
                  CustomButton(text: 'PLACE ORDER', onPressed: (){
                    Get.toNamed(AppRoutes.paymentScreen);
                  })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

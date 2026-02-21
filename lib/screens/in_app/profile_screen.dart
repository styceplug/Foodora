import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/custom_appbar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
          'Profile',
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
        padding: EdgeInsets.symmetric(horizontal: Dimensions.width20,vertical: Dimensions.height20),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: Dimensions.height70,
                  width: Dimensions.width70,
                  decoration: BoxDecoration(
                    color: AppColors.grey2,
                    shape: BoxShape.circle
                  ),
                ),
                SizedBox(width: Dimensions.width20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Vincent Nifemi',style: TextStyle(
                      fontSize: Dimensions.font17,
                      fontWeight: FontWeight.w600
                    ),),
                    Row(
                      children: [
                        Text('Following: ',style: TextStyle(
                          fontSize: Dimensions.font13,
                          fontWeight: FontWeight.w300
                        ),),
                        Text('102 Vendors',style: TextStyle(
                          fontSize: Dimensions.font13,
                          fontWeight: FontWeight.w600
                        ),),
                      ],
                    ),
                    SizedBox(height: Dimensions.height20),

                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

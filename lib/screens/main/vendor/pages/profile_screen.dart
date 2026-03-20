import 'package:flutter/material.dart';
import 'package:foodora/utils/colors.dart';
import 'package:foodora/utils/dimensions.dart';
import 'package:foodora/widgets/custom_appbar.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/app_constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Profile'),
      body: Container(
        height: Dimensions.screenHeight,
        width: Dimensions.screenWidth,
        padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: Dimensions.height100,
              width: Dimensions.width100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.grey2,
              ),
            ),
            SizedBox(height: Dimensions.height20),
            OptionCard(Iconsax.edit, 'Edit Profile'),
            OptionCard(Iconsax.note, 'Terms of Service'),
          ],
        ),
      ),
    );
  }

  Widget OptionCard(IconData icon, String title, {VoidCallback? onTap}) {
    return Container(
      margin: EdgeInsets.only(
        bottom: Dimensions.height5,
        top: Dimensions.height5,
      ),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Icon(icon, size: Dimensions.iconSize20),
            SizedBox(width: Dimensions.width10),
            Text(title),
          ],
        ),
      ),
    );
  }
}

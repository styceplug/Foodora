import 'package:flutter/material.dart';
import 'package:foodora/utils/dimensions.dart';
import 'package:foodora/widgets/custom_button.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../routes/routes.dart';
import '../../utils/app_constants.dart';

class LocationAccessScreen extends StatefulWidget {
  const LocationAccessScreen({super.key});

  @override
  State<LocationAccessScreen> createState() => _LocationAccessScreenState();
}

class _LocationAccessScreenState extends State<LocationAccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.width20,
          vertical: Dimensions.height50,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppConstants.getPngAsset('location_mascot'),
              height: Dimensions.height100 * 2.5,
            ),
            SizedBox(height: Dimensions.height50),
            CustomButton(
              text: 'ACCESS LOCATION',
              onPressed: () {
                Get.toNamed(AppRoutes.homeScreen);
              },
            ),
            SizedBox(height: Dimensions.height30),
            Text('FOODORA WILL ACCESS YOUR LOCATION ONLY WHILE USING THE APP.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: Dimensions.font17,
              fontWeight: FontWeight.w500
            ),)
            
          ],
        ),
      ),
    );
  }
}

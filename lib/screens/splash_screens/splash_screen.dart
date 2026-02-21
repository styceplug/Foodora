import 'package:flutter/material.dart';
import '../../controllers/app_controller.dart';
import '../../routes/routes.dart';
import '../../utils/app_constants.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    AppController appController = Get.find<AppController>();


    WidgetsBinding.instance.addPostFrameCallback((_) {
      // appController.initializeApp();
      Future.delayed(const Duration(seconds: 3), () {
        // appController.initializeApp();
        Get.offAllNamed(AppRoutes.onboardingScreen);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(AppConstants.getPngAsset('splash_bg'))),
          color: AppColors.white,
        ),
        padding: EdgeInsetsGeometry.symmetric(horizontal: Dimensions.width20*4),
        child: Center(child: Image.asset(AppConstants.getPngAsset('logo'))),
      ),
    );
  }
}

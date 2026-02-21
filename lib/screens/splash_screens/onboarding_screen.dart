import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/routes.dart';
import '../../utils/app_constants.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/custom_button.dart';

class OnboardingScreen extends StatelessWidget {
  final OnboardingController controller = Get.put(OnboardingController());

  OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Dimensions.screenHeight,
        width: Dimensions.screenWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: PageView.builder(
                controller: controller.pageController,
                itemCount: controller.pages.length,
                onPageChanged: controller.onPageChanged,
                itemBuilder: (context, index) {
                  return _buildPageContent(controller.pages[index]);
                },
              ),
            ),

            Padding(
              padding: EdgeInsets.only(
                left: Dimensions.width30,
                right: Dimensions.width30,
                bottom: Dimensions.height70,
              ),
              child: Column(
                children: [
                  Obx(
                    () => _buildDotIndicators(
                      controller.pages.length,
                      controller.currentPageIndex.value,
                    ),
                  ),

                  SizedBox(height: Dimensions.height50),

                  CustomButton(
                    text: 'PROCEED AS CUSTOMER',
                    onPressed: () {
                      Get.toNamed(AppRoutes.customerSignUpScreen);
                    },
                  ),

                  SizedBox(height: Dimensions.height10),

                  CustomButton(
                    text: 'PROCEED AS A VENDOR',
                    onPressed: () {
                      Get.toNamed(AppRoutes.vendorSignUpScreen);
                    },
                    backgroundColor: AppColors.white,
                    borderColor: AppColors.black,

                  ),



                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPageContent(OnboardingModel page) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Top Spacer
        SizedBox(height: Dimensions.height50 * 2),

        // Main Illustration
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.width50),
          child: Image.asset(AppConstants.getPngAsset(page.imageAssetPath)),
        ),

        SizedBox(height: Dimensions.height100),

        // Single Title Block
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.width30),
          child: Text(
            page.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: Dimensions.font10 * 3,
              fontWeight: FontWeight.w700,
              color: AppColors.accentColor,
              height: 1.2,
            ),
          ),
        ),

        SizedBox(height: Dimensions.height10),

        // Subtitle Block
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
          child: Text(
            page.subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: Dimensions.font10 * 1.5,
              fontWeight: FontWeight.w400,
              color: Colors.grey[600], // Or your specific body text color
            ),
          ),
        ),

        // Bottom Spacer to balance the layout
        Spacer(),
      ],
    );
  }


  Widget _buildDotIndicators(int count, int currentIndex) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (index) {
        bool isActive = index == currentIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(horizontal: Dimensions.width5 / 2),
          height: Dimensions.height10,
          width: isActive ? Dimensions.width20 : Dimensions.width10,
          decoration: BoxDecoration(
            color:
                isActive
                    ? AppColors.accentColor
                    : AppColors.primaryColor.withOpacity(0.5),
            borderRadius: BorderRadius.circular(Dimensions.height5),
          ),
        );
      }),
    );
  }
}

class OnboardingModel {
  final String title;
  final String subtitle;
  final String imageAssetPath;

  OnboardingModel({required this.title, required this.imageAssetPath, required this.subtitle});
}

class OnboardingController extends GetxController {
  late final List<OnboardingModel> pages;

  var currentPageIndex = 0.obs;

  late PageController pageController;

  @override
  void onInit() {
    pages = [
      OnboardingModel(
        title: 'Diverse & sparkling food.',
        subtitle: 'Enjoy the best local ingredients to create fresh and delicious food and drinks.',
        imageAssetPath: 'onboard1',
      ),
      OnboardingModel(
        title: 'Top Restaurants',
        subtitle: 'Interact with menus from your favourite restaurants and get it delivered',
        imageAssetPath: 'onboard1',
      ),
      OnboardingModel(
        title: 'Fast delivery on all orders',
        subtitle: 'Fast delivery on the primary orders whilst from restaurants across your locality',
        imageAssetPath: 'onboard1',
      ),

    ];

    pageController = PageController();

    _startAutoScroll();

    super.onInit();
  }

  void _startAutoScroll() {
    Future.delayed(const Duration(seconds: 3), () {
      if (pageController.hasClients) {
        int nextPageIndex = (currentPageIndex.value + 1) % pages.length;

        pageController.animateToPage(
          nextPageIndex,
          duration: const Duration(milliseconds: 700),
          curve: Curves.easeInOut,
        );
        _startAutoScroll();
      }
    });
  }

  void onPageChanged(int index) {
    currentPageIndex.value = index;
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}

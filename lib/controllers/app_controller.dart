import 'dart:io';
import 'package:flutter/material.dart';


import 'package:get/get.dart';


import '../data/api/api_checker.dart';
import '../data/api/api_client.dart';
import '../data/repo/app_repo.dart';
import '../routes/routes.dart';
import '../utils/app_constants.dart';

class AppController extends GetxController {
  final AppRepo appRepo;

  AppController({required this.appRepo, required this.apiClient, required this.apiChecker});

  Rx<ThemeMode> themeMode = Rx<ThemeMode>(ThemeMode.system);

  var currentAppPage = 0.obs;
  var isFirstTime = false.obs;
  PageController pageController = PageController();
  ApiClient apiClient;
  ApiChecker apiChecker;




  final List<Widget> pages = [

  ];
  final List<Widget> vendorPages = [

  ];

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> initializeApp() async {
    print('Initializing App...');

    await checkFirstTimeUse();

    if (isFirstTime.value) {
      print("First time user -> Onboarding");
      Get.offAllNamed(AppRoutes.onboardingScreen);
      return;
    }

    // String? token = appRepo.sharedPreferences.getString(AppConstants.authToken);

    // if (token != null && token.isNotEmpty) {
    //   print("Token found. Verifying session...");
    //   authController.apiClient.updateHeader(token);
    //   await productController.getProducts();
    //   await authController.getUserProfile();
    //   String? firebaseToken = await FirebaseMessaging.instance.getToken();
    //   if (firebaseToken != null) {
    //     await saveDeviceToken(firebaseToken);
    //   }

    // } else {
    //   print("No token found -> Get Started");
    //   Get.offAllNamed(AppRoutes.getStartedScreen);
    // }
  }

  Future<void> saveDeviceToken(String token) async {
    String platform = Platform.isAndroid ? 'android' : 'ios';

    print("🔔 Updating Device Token: $platform");

    Response response = await appRepo.updateDeviceToken(token, platform);

    if (response.statusCode == 200) {
      print("✅ Device Token Updated Successfully");
    } else {
      print("⚠️ Failed to update token: ${response.body}");
    }
  }

  Future<void> checkFirstTimeUse() async {
    final prefs = appRepo.sharedPreferences;
    bool hasSeen = prefs.getBool('hasSeenOnboarding') ?? false;

    if (!hasSeen) {
      isFirstTime.value = true;
      await prefs.setBool('hasSeenOnboarding', true);
    } else {
      isFirstTime.value = false;
    }
  }

  void changeCurrentAppPage(int page, {bool movePage = true}) {
    currentAppPage.value = page;

    if (movePage) {
      if (pageController.hasClients) {
        pageController.animateToPage(
          page,
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
        );
      } else {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (pageController.hasClients) {
            pageController.animateToPage(
              page,
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeInOut,
            );
          }
        });
      }
    }

    update();
  }

  void clearSharedData() {
    changeCurrentAppPage(0);
    appRepo.sharedPreferences.remove(AppConstants.authToken);
    apiClient.token = '';
    apiClient.updateHeader('');
    Get.offAllNamed(AppRoutes.getStartedScreen);
  }
}

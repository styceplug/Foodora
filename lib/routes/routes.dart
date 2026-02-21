import 'dart:math';


import 'package:foodora/screens/auth/customer/sign_up.dart';
import 'package:foodora/screens/auth/forgot_password.dart';
import 'package:foodora/screens/auth/login_screen.dart';
import 'package:foodora/screens/auth/vendor/sign_up.dart';
import 'package:foodora/screens/auth/verify_otp.dart';
import 'package:foodora/screens/in_app/location_access.dart';
import 'package:foodora/screens/in_app/profile_screen.dart';
import 'package:foodora/screens/in_app/restuarant_details.dart';
import 'package:foodora/screens/main/cart_screen.dart';
import 'package:foodora/screens/main/home_screen.dart';
import 'package:foodora/screens/main/meal_screen.dart';
import 'package:foodora/screens/main/payment_screen.dart';
import 'package:foodora/screens/main/restaurant_screen.dart';
import 'package:foodora/screens/main/search_screen.dart';
import 'package:foodora/screens/splash_screens/splash_screen.dart';
import 'package:get/get.dart';

import '../screens/splash_screens/no_internet_screen.dart';
import '../screens/splash_screens/onboarding_screen.dart';
import '../screens/splash_screens/update_app_screen.dart';



class AppRoutes {
  static const String splashScreen = '/splash-screen';
  static const String onboardingScreen = '/onboarding-screen';
  static const String updateAppScreen = '/update-app-screen';
  static const String noInternetScreen = '/no-internet-screen';
  static const String getStartedScreen = '/get-started-screen';
  static const String locationAccessScreen = '/location-access-screen';

  //auth
  static const String vendorSignUpScreen = '/vendor-sign-up-screen';
  static const String customerSignUpScreen = '/customer-sign-up-screen';
  static const String loginScreen = '/login-screen';
  static const String forgotPasswordScreen = '/forgot-password-screen';
  static const String verifyOtpScreen = '/verify-otp-screen';



  //in-app
  static const String homeScreen = '/home-screen';
  static const String cartScreen = '/cart-screen';
  static const String mealScreen = '/meal-screen';
  static const String restaurantScreen = '/restaurant-screen';
  static const String searchScreen = '/search-screen';
  static const String restaurantDetailsScreen = '/restaurant-details-screen';
  static const String paymentScreen = '/payment-screen';
  static const String profileScreen = '/profile-screen';



  //settings


  //vendor


  static final routes = [

    //in-app
    GetPage(
      name: homeScreen,
      page: () => const HomeScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: cartScreen,
      page: () => const CartScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: mealScreen,
      page: () => const MealScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: restaurantScreen,
      page: () => const RestaurantScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: searchScreen,
      page: () => const SearchScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: restaurantDetailsScreen,
      page: () => const RestaurantDetailsScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: paymentScreen,
      page: () => const PaymentScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: profileScreen,
      page: () => const ProfileScreen(),
      transition: Transition.fadeIn,
    ),


    //auth
    GetPage(
      name: customerSignUpScreen,
      page: () => const SignUpCustomer(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: vendorSignUpScreen,
      page: () => const SignUpVendor(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: loginScreen,
      page: () => const LoginScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: forgotPasswordScreen,
      page: () => const ForgotPasswordScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: verifyOtpScreen,
      page: () => const VerifyOtpScreen(),
      transition: Transition.fadeIn,
    ),




    //general
    GetPage(
      name: splashScreen,
      page: () => const SplashScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: onboardingScreen,
      page: () {
        return OnboardingScreen();
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: updateAppScreen,
      page: () {
        return const UpdateAppScreen();
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: noInternetScreen,
      page: () {
        return const NoInternetScreen();
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: locationAccessScreen,
      page: () {
        return const LocationAccessScreen();
      },
      transition: Transition.fadeIn,
    ),



  ];
}

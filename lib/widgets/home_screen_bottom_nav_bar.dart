import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:foodora/widgets/snackbars.dart';
import 'package:get/get.dart';

import '../controllers/app_controller.dart';
import '../utils/colors.dart';
import '../utils/dimensions.dart';
import 'bottom_bar_item.dart';

class HomeScreenBottomNavBar extends StatelessWidget {
  const HomeScreenBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    AppController appController = Get.find<AppController>();

    return Obx(
      () => SizedBox(
        height: Dimensions.height10 * 10,
        child: Stack(
          alignment: Alignment.bottomCenter,
          clipBehavior: Clip.none,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.radius10),
                topRight: Radius.circular(Dimensions.radius10),
              ),
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.only(
                  bottom: Dimensions.height50,
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                  top: Dimensions.height15,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BottomBarItem(
                      image: 'dashboard',
                      isActive: appController.currentAppPage.value == 0,
                      onClick: () => appController.changeCurrentAppPage(0),
                    ),
                    BottomBarItem(
                      image: 'inventory',
                      isActive: appController.currentAppPage.value == 1,
                      onClick: () => appController.changeCurrentAppPage(1),
                    ),
                    BottomBarItem(
                      image: 'add',
                      isActive: appController.currentAppPage.value == 2,
                      onClick: () => appController.changeCurrentAppPage(2),
                    ),
                    BottomBarItem(
                      image: 'bell',
                      isActive: appController.currentAppPage.value == 3,
                      onClick: () => appController.changeCurrentAppPage(3),
                    ),
                    BottomBarItem(
                      image: 'profile',
                      isActive: appController.currentAppPage.value == 4,
                      onClick: () => appController.changeCurrentAppPage(4),
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}


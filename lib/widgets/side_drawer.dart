import 'package:flutter/material.dart';
import 'package:foodora/utils/app_constants.dart';
import 'package:foodora/utils/colors.dart';
import 'package:foodora/utils/dimensions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../routes/routes.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.white,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.width20,
            vertical: Dimensions.height50,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: Dimensions.height100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: AssetImage(AppConstants.getPngAsset('logo')),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              _drawerItem(
                context,
                icon: Iconsax.shopping_bag,
                title: "Cart",
                onTap: () {
                  Navigator.pop(context);
                  Get.toNamed(AppRoutes.cartScreen);
                },
              ),

              _drawerItem(
                context,
                icon: Iconsax.location,
                title: "Addresses",
                onTap: () {
                  Navigator.pop(context);
                  Get.toNamed(AppRoutes.addressScreen);
                },
              ),

              _drawerItem(
                context,
                icon: Iconsax.user,
                title: "Profile",
                onTap: () {
                  Navigator.pop(context);
                  Get.toNamed(AppRoutes.profileScreen);
                },
              ),

              _drawerItem(
                context,
                icon: Iconsax.receipt,
                title: "Orders",
                onTap: () {
                  Navigator.pop(context);
                  Get.toNamed(AppRoutes.ordersScreen);
                },
              ),
              _drawerItem(
                context,
                icon: Iconsax.setting_2,
                title: "Settings",
                onTap: () {
                  Navigator.pop(context);
                  Get.toNamed(AppRoutes.settingsScreen);
                },
              ),

              const Spacer(),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: Dimensions.height50,
                    width: Dimensions.width50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.grey3,
                    ),
                  ),
                  SizedBox(width: Dimensions.width10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Vincent Nifemi',
                          style: TextStyle(
                            fontSize: Dimensions.font17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '+234 902 534 1146',
                          style: TextStyle(
                            fontSize: Dimensions.font12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(Iconsax.logout)
                ],
              ),

              
            ],
          ),
        ),
      ),
    );
  }

  Widget _drawerItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
      onTap: onTap,
    );
  }
}

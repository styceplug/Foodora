import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/dimensions.dart';
import '../../../../widgets/custom_appbar.dart';
import '../../../../widgets/revenue_chart.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final labels = ["10AM", "11AM", "12PM", "01PM", "02PM", "03PM", "04PM"];
  final values =
      [220, 280, 500, 310, 520, 410, 650].map((e) => e.toDouble()).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        leadingIcon: InkWell(
          onTap: () {
            _scaffoldKey.currentState?.openDrawer();
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
            child: Icon(Iconsax.menu_board),
          ),
        ),
        customTitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'LOCATION',
              style: TextStyle(
                fontSize: Dimensions.font12,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryColor,
              ),
            ),
            SizedBox(height: Dimensions.height5),
            Row(
              children: [
                Text(
                  'ABC Eatery',
                  style: TextStyle(
                    fontSize: Dimensions.font15,
                    fontWeight: FontWeight.w500,
                    color: AppColors.accentColor,
                  ),
                ),
                SizedBox(width: Dimensions.width5 / 2),
                Icon(Icons.arrow_drop_down, size: Dimensions.iconSize16),
              ],
            ),
          ],
        ),
        actionIcon: Container(
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.width10,
            vertical: Dimensions.height10,
          ),
          decoration: BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
          child: Icon(
            Iconsax.user,
            color: AppColors.white,
            size: Dimensions.iconSize20,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.width20,
          vertical: Dimensions.height20,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: Dimensions.screenWidth / 2.3,
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.width20,
                      vertical: Dimensions.height20,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: AppColors.white,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.black.withOpacity(0.09),
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '20',
                          style: TextStyle(
                            fontSize: Dimensions.font30 * 2,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          'RUNNING ORDERS',
                          style: TextStyle(
                            fontSize: Dimensions.font14,
                            fontWeight: FontWeight.w700,
                            color: AppColors.grey5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: Dimensions.screenWidth / 2.3,
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.width20,
                      vertical: Dimensions.height20,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: AppColors.white,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.black.withOpacity(0.09),
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '5',
                          style: TextStyle(
                            fontSize: Dimensions.font30 * 2,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          'ORDER REQUESTS',
                          style: TextStyle(
                            fontSize: Dimensions.font14,
                            fontWeight: FontWeight.w700,
                            color: AppColors.grey5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: Dimensions.height20),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.width20,
                  vertical: Dimensions.height20,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black.withOpacity(0.09),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'TOTAL REVENUE',
                              style: TextStyle(
                                fontSize: Dimensions.font15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              'N 25,000',
                              style: TextStyle(
                                fontSize: Dimensions.font20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.width10,
                            vertical: Dimensions.height5,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.grey3),
                            borderRadius: BorderRadius.circular(
                              Dimensions.radius10,
                            ),
                          ),
                          child: Row(
                            children: [
                              Text(
                                'Daily',
                                style: TextStyle(fontSize: Dimensions.font14),
                              ),
                              SizedBox(width: Dimensions.width5),
                              Icon(
                                Icons.arrow_drop_down,
                                size: Dimensions.iconSize16,
                              ),
                            ],
                          ),
                        ),
                        Text(
                          'More Details',
                          style: TextStyle(
                            fontSize: Dimensions.font13,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primaryColor,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 900),
                      child: AspectRatio(
                        aspectRatio: 1.5,
                        child: SmoothLineChartInteractive(
                          values: values,
                          xLabels: labels,
                          initialSelectedIndex: 2,
                          valueLabelBuilder:
                              (index, value) => "\$${value.toStringAsFixed(0)}",
                          lineColor: const Color(0xFFFF6A3A),
                          tooltipColor: const Color(0xFF2F313A),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: Dimensions.height20),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.width20,
                  vertical: Dimensions.height20,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black.withOpacity(0.09),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'REVIEWS',
                          style: TextStyle(
                            fontSize: Dimensions.font15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),

                        Text(
                          'See all Reviews',
                          style: TextStyle(
                            fontSize: Dimensions.font13,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primaryColor,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: Dimensions.height10),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.orange),
                        SizedBox(width: Dimensions.width10),
                        Text(
                          '4.9',
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: Dimensions.font18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Spacer(),
                        Text(
                          'From 20 total reviews',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: Dimensions.font14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: Dimensions.height20),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.width20,
                  vertical: Dimensions.height20,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black.withOpacity(0.09),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'POPULAR ITEMS THIS WEEK',
                          style: TextStyle(
                            fontSize: Dimensions.font15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),

                        Text(
                          'See all',
                          style: TextStyle(
                            fontSize: Dimensions.font13,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primaryColor,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: Dimensions.height10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                            height: Dimensions.height100,
                            width: Dimensions.width100,
                            margin: EdgeInsets.only(right: Dimensions.width10),
                            decoration: BoxDecoration(
                              color: AppColors.grey3,
                              borderRadius: BorderRadius.circular(
                                Dimensions.radius10,
                              ),
                            ),
                          ),
                          Container(
                            height: Dimensions.height100,
                            width: Dimensions.width100,
                            margin: EdgeInsets.only(right: Dimensions.width10),

                            decoration: BoxDecoration(
                              color: AppColors.grey3,
                              borderRadius: BorderRadius.circular(
                                Dimensions.radius10,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: Dimensions.width10),

                            height: Dimensions.height100,
                            width: Dimensions.width100,
                            decoration: BoxDecoration(
                              color: AppColors.grey3,
                              borderRadius: BorderRadius.circular(
                                Dimensions.radius10,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: Dimensions.width10),
                            height: Dimensions.height100,
                            width: Dimensions.width100,
                            decoration: BoxDecoration(
                              color: AppColors.grey3,
                              borderRadius: BorderRadius.circular(
                                Dimensions.radius10,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: Dimensions.height100),
            ],
          ),
        ),
      ),
    );
  }
}

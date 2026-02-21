import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';
import 'custom_button.dart';

class BusinessCard extends StatelessWidget {
  String name;
  String location;
  String image;

  BusinessCard({
    super.key,
    required this.name,
    required this.location,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.height100 * 1.5,
      width: Dimensions.width100 * 1.7,
      margin: EdgeInsets.only(right: Dimensions.width20),
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.width10,
        vertical: Dimensions.height10,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.accentColor),
        borderRadius: BorderRadius.circular(Dimensions.radius10),
        color: AppColors.accentColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.02),
            spreadRadius: 5,
            blurRadius: 7,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: Dimensions.height10 * 8,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: Dimensions.width5,vertical: Dimensions.height5),
            decoration: BoxDecoration(
              color: AppColors.grey5,
              borderRadius: BorderRadius.circular(Dimensions.radius5),
            ),
            child: Image.network(image, fit: BoxFit.contain),
          ),
          Spacer(),
          Text(
            name,
            style: TextStyle(
              fontSize: Dimensions.font15,
              fontWeight: FontWeight.w500,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Icon(Iconsax.location, size: Dimensions.iconSize16 * 0.7),
                SizedBox(width: Dimensions.width5),
                Text(
                  location,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: Dimensions.font10),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BusinessCardList extends StatelessWidget {

  String name;
  String location;
  String image;
  String rating;
  bool? action;

  BusinessCardList({super.key, required this.name, required this.location, required this.image, required this.rating, this.action = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.screenWidth,
      height: Dimensions.height100*1.2,
      margin: EdgeInsets.only(bottom: Dimensions.height20),
      padding: EdgeInsets.symmetric(
        vertical: Dimensions.height10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  height: Dimensions.height100,
                  width: Dimensions.width100,
                  decoration: BoxDecoration(
                    color: AppColors.grey4,
                    borderRadius: BorderRadius.circular(Dimensions.radius5),
                  ),
                  child: Image.network(image),
                ),
                SizedBox(width: Dimensions.width10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: Dimensions.height10),
                      Expanded(
                        child: Text(
                          name,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: Dimensions.font15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Icon(
                              Iconsax.location,
                              size: Dimensions.iconSize16 * 0.9,
                            ),
                            SizedBox(width: Dimensions.width5),
                            Expanded(
                              child: Text(
                                location,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: Dimensions.font14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Icon(
                              CupertinoIcons.star_fill,
                              size: Dimensions.iconSize16 * 0.9,
                              color: AppColors.white,
                            ),
                            SizedBox(width: Dimensions.width5),
                            Text(
                              rating,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: Dimensions.font14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: Dimensions.height10),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: Dimensions.width10),
          if(action == true)
          CustomButton(
            text:'Book Now',
            onPressed: () {},
            padding: EdgeInsets.symmetric(
              vertical: Dimensions.height5,
              horizontal: Dimensions.width10,
            ),
            textStyle: TextStyle(
              fontSize: Dimensions.font13,
              fontWeight: FontWeight.w500,
            ),
            borderRadius: BorderRadius.circular(Dimensions.radius5),
          ),
        ],
      ),
    );
  }
}


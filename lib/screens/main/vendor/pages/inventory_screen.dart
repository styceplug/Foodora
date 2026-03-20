import 'package:flutter/material.dart';
import 'package:foodora/utils/colors.dart';
import 'package:foodora/utils/dimensions.dart';
import 'package:foodora/widgets/custom_appbar.dart';

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({super.key});

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Inventory'),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'All',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: Dimensions.font16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text('Food', style: TextStyle(fontSize: Dimensions.font16)),
                Text('Drinks', style: TextStyle(fontSize: Dimensions.font16)),
                Text('Snacks', style: TextStyle(fontSize: Dimensions.font16)),
              ],
            ),
            SizedBox(height: Dimensions.height30),
            Container(
              child: Row(
                children: [
                  Container(
                    height: Dimensions.height70,
                    width: Dimensions.width70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius15),
                      border: Border.all(color: AppColors.grey4),
                    ),
                  ),
                  SizedBox(width: Dimensions.width15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Baseline Package',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: Dimensions.font16,
                        ),
                      ),
                      Text(
                        'Baseline Package',
                        style: TextStyle(fontSize: Dimensions.font14),
                      ),
                      Text(
                        'N13,400',
                        style: TextStyle(
                          fontSize: Dimensions.font14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Icon(Icons.more_vert),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

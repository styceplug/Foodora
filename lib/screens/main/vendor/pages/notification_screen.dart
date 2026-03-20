import 'package:flutter/material.dart';
import 'package:foodora/utils/dimensions.dart';
import 'package:foodora/widgets/custom_appbar.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Notifications',
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
        child: Column(),
      ),
    );
  }
}

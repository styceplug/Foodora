import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/app_controller.dart';
import '../data/api/api_checker.dart';
import '../data/api/api_client.dart';
import '../data/repo/app_repo.dart';
import '../utils/app_constants.dart';
import 'global_loader_controller.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  Get.put(sharedPreferences);

  //api clients
  Get.lazyPut(
    () => ApiClient(
      appBaseUrl: AppConstants.BASE_URL,
      sharedPreferences: Get.find(),
    ),
  );
  Get.lazyPut(() => ApiChecker());

  // repos

  Get.lazyPut(() => GlobalLoaderController());
  Get.lazyPut(
    () => AppRepo(apiClient: Get.find(), sharedPreferences: Get.find()),
  );


  //controllers
  Get.lazyPut(
    () => AppController(
      appRepo: Get.find(),
      apiClient: Get.find(),
      apiChecker: Get.find(),
    ),
  );

}

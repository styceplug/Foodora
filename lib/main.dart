import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodora/routes/routes.dart';
import 'package:foodora/utils/colors.dart';
import 'package:get/get.dart';
import 'controllers/app_controller.dart';
import 'helpers/dependencies.dart' as dep;
import 'helpers/global_loader_controller.dart';
import 'helpers/version_service.dart';
import 'widgets/app_loading_overlay.dart';

@pragma('vm:entry-point')


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await VersionService.init();
  await dep.init();


  // Always register loader controller
  Get.put(GlobalLoaderController(), permanent: true);

  HardwareKeyboard.instance.clearState();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (_){
      return GetMaterialApp(
        theme: ThemeData(
          fontFamily: 'Sora',
          brightness: Brightness.light,
          scaffoldBackgroundColor: AppColors.white,

        ),

        debugShowCheckedModeBanner: false,
        title: 'Fodora',

        getPages: AppRoutes.routes,
        initialRoute: AppRoutes.splashScreen,
        builder: (context, child) {
          final loaderController =
          Get.find<GlobalLoaderController>();
          return Obx(() {
            return Stack(
              children: [
                child!,
                if (loaderController.isLoading.value)
                  const AppLoadingOverlay(),
              ],
            );
          });
        },
      );
    });

  }
}

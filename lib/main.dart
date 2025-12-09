import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'Core/AppRoute/appRoute.dart';
import 'Core/Dependency/dependency.dart';

void main() {
  DependencyInjection di =DependencyInjection();
  di.dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 883),
      child: GetMaterialApp(
        darkTheme: ThemeData.dark(),
        theme: ThemeData.light(),
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 200),
        initialRoute: AppRoute.splashScreen,
        navigatorKey: Get.key,
        getPages: AppRoute.routes,
      ),
    );
  }
}
import 'package:get/get.dart';

import '../../../Core/AppRoute/appRoute.dart';

class SplashScreenController extends GetxController {
  navigate() async {
    await Future.delayed(const Duration(seconds: 3));
    {
      Get.toNamed(AppRoute.productList);
    }
  }
}
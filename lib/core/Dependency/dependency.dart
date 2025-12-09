import 'package:get/get.dart';
import '../../View/Screen/ProductList/product_list_controller.dart';
import '../../View/Screen/SplashScreen/splash_screen_controller.dart';


class DependencyInjection extends Bindings{
  @override
  void dependencies() {

    ///================ Auth Controller =================

    Get.lazyPut(() => SplashScreenController(), fenix: true);
    Get.lazyPut(() => ProductListController(), fenix: true);

  }
}
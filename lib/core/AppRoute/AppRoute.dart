import 'package:get/get.dart';
import '../../View/Screen/ProductList/product_list.dart';
import '../../View/Screen/SplashScreen/splashscreen.dart';

class AppRoute{

  static const String splashScreen = "/splashScreen";
  static const String productList = "/productList";
  static const String addProduct = "/addProduct";
  static const String updateProduct = "/updateProduct";





  static List<GetPage>routes=[
    GetPage(name: splashScreen, page: () => SplashScreen()),
    GetPage(name: productList, page: () => const ProductList()),

  ];
}
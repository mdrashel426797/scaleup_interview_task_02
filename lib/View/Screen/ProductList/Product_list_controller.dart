import 'dart:convert';
import 'package:get/get.dart' hide Response;
import 'package:http/http.dart';
import 'ProductModle.dart';

class ProductListController extends GetxController {
  bool loading = false;

  List<Datum> productList = [];
  List<Datum> filteredList = [];

  @override
  void onInit() {
    super.onInit();
    getProduct();
  }

  Future<void> getProduct() async {
    loading = true;
    update();

    productList.clear();

    const String getProductUrl = "https://fakestoreapi.com/products";
    Uri uri = Uri.parse(getProductUrl);

    Response response = await get(uri);

    if (response.statusCode == 200) {
      final List jsonProductList = jsonDecode(response.body);
      productList =
          jsonProductList.map<Datum>((item) => Datum.fromJson(item)).toList();
      filteredList = List.from(productList);
    } else {
      Get.snackbar("Failed", "Failed! Try again",
          snackPosition: SnackPosition.TOP);
    }

    loading = false;
    update();
  }

  void searchProduct(String query) {
    if (query.isEmpty) {
      filteredList = List.from(productList);
    } else {
      filteredList = productList
          .where((p) => p.title!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    update();
  }
}

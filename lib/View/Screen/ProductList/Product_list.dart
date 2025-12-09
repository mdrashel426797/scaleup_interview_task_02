import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'product_list_controller.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {

  final controller = Get.put(ProductListController());

  @override
  void initState() {
    super.initState();
    controller.getProduct();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductListController>(
      builder: (controller) {
        return Scaffold(

          // <<<<<<<<<<<<<<<this is app var >>>>>>>>>>>>>>>>>
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.cyanAccent,
            title: Text(
              'All Product List',
              style: TextStyle(
                fontSize: 25.sp,
                fontWeight: FontWeight.w700,
                color: Color(0xff000000),
              ),
            ),
            ///<<<<<<<<<<<<<<<<< light and dark icon >>>>>>>>>>>>>>>>>>>>
            actions: [
              IconButton(
                onPressed: () {
                  Get.isDarkMode
                      ? Get.changeThemeMode(ThemeMode.light)
                      : Get.changeThemeMode(ThemeMode.dark);
                },
                icon: Icon(Icons.light_mode),
              )
            ],
          ),



          ///<<<<<<<<<<<<<<this is body>>>>>>>>>>>>>>>>>>

          body: Visibility(
            visible: controller.loading == false,
            replacement: Center(child: CircularProgressIndicator()),
            child: Column(
              children: [

                Padding(
                  padding: EdgeInsets.all(8.0),

                  ///<<<<<<<<<< search field >>>>>>>>>>>>>>>


                  child: TextField(
                    onChanged: (value) {
                      controller.searchProduct(value);
                    },
                    decoration: InputDecoration(
                      hintText: "Search by title",
                      suffixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                    ),
                  ),
                ),

                Expanded(
                  child: GridView.builder(
                    physics:  AlwaysScrollableScrollPhysics(),
                    itemCount: controller.filteredList.length,
                    gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: 0.60,
                    ),
                    itemBuilder: (context, index) {
                      final product = controller.filteredList[index];
                      return Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 7.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 145.h,
                                  width: double.maxFinite,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(product.image ?? ""),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5.h),
                                Text(
                                  'id: ${product.id}',
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Title: ${product.title}',
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Price: ${product.price}',
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Description: ${product.description}',
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Category: ${product.category}',
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Text('Add'),
          ),
        );
      },
    );
  }
}

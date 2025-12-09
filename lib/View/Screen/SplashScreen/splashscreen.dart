import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_tree/View/Screen/SplashScreen/splash_screen_controller.dart' show SplashScreenController;


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    final controller = Get.put(SplashScreenController());
    controller.navigate();
  }

  Widget build(BuildContext context) {
    return GetBuilder<SplashScreenController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.grey,
          body:Center(
            // child:Container(
            //   height:192.h,
            //   width:192.w,
            //   decoration:BoxDecoration(
            //       color:Colors.white,
            //       borderRadius:BorderRadius.only(
            //         //bottomLeft:Radius.circular(50),
            //         bottomRight: Radius.circular(50.r),
            //         topLeft: Radius.circular(50.r),
            //       ),
            //       image:DecorationImage(image:NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdN5KBQhbX4KGZ4Pfl17uAmVX3251BNmRhvA&s"),fit:BoxFit.fill)
            //   ),
            // ),

            child: Center(
              child: Container(
                height: 220,
                width: 220,
                decoration: BoxDecoration(
                  color: Colors.cyanAccent,
                  shape: BoxShape.circle
                ),
                child: Center(child: Text("Product APP",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 28),)),
              ),
            ),
          ),
        );
      },
    );
  }
}
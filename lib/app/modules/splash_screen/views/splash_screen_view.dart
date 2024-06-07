import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:voicense_frontend/app/routes/app_pages.dart';

import '../controllers/splash_screen_controller.dart';


class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), (() {
      Get.offAllNamed(Routes.LOGIN);
    }));
    return Scaffold(
        body: Container(
          width: Get.width,
          height: Get.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background_splash.png'),
              fit:BoxFit.cover
            ),
          ),
          child: Center(
            child:Transform.scale(
              scale: 0.5,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/voicense_logo.png'),
                ),
              ),
            ),
            ),
          ),
        ));
  }
}
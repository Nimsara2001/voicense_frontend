import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:device_preview/device_preview.dart'; // Import device_preview package
import 'app/routes/app_pages.dart';

void main() {
  runApp(
    DevicePreview(
      builder: (context) => GetMaterialApp(
        title: "Application",
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
      ),
    ),
  );
}

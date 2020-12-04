import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'app/services/dio_service.dart';

Future<void> main() async {
  await initServices();

  runApp(
    GetMaterialApp(
      title: "Podcaster",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}

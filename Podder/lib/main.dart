import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/service/dio_service.dart';
import 'routes/app_pages.dart';


Future<void> main() async {
  await initServices();
  runApp(
    GetMaterialApp(
      title: "Podder",
      initialRoute: initial,
      getPages: routes,
    ),
  );
}

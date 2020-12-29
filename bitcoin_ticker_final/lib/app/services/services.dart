import 'package:get/get.dart';

import 'dio_service.dart';

Future<void> initServices() async {
  Get.put(ApiService());
}

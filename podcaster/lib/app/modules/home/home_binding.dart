import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:podcaster/app/data/providers/api_client.dart';
import 'package:podcaster/app/data/repository/repository.dart';

import 'package:podcaster/app/modules/home/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    final Dio _dioClient = Get.find();

    Get.lazyPut<HomeController>(
      () => HomeController(
        repository: Repository(
          apiClient: ApiClient(dioClient: _dioClient),
        ),
      ),
    );
  }
}

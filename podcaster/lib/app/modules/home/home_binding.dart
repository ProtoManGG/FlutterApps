import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../../data/providers/api_client.dart';
import '../../data/repository/repository.dart';

import 'home_controller.dart';

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

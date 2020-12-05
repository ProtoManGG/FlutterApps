import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../../data/providers/api_client.dart';
import '../../data/repository/repository.dart';

import 'player_controller.dart';

class PlayerBinding extends Bindings {
  final Dio _dioClient = Get.find();

  @override
  void dependencies() {
    Get.lazyPut<PlayerController>(
      () => PlayerController(
        repository: Repository(
          apiClient: ApiClient(
            dioClient: _dioClient,
          ),
        ),
      ),
    );
  }
}

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:podcaster/app/data/providers/api_client.dart';
import 'package:podcaster/app/data/repository/repository.dart';

import 'package:podcaster/app/modules/player/player_controller.dart';

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

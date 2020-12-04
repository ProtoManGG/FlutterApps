import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:podder/app/data/providers/rss_feed_provider.dart';
import 'package:podder/app/data/repository/rss_feed_repository.dart';

import 'player_controller.dart';

class PlayerBinding extends Bindings {
  @override
  void dependencies() {
    final Dio _dioService = Get.find();

    Get.lazyPut<PlayerController>(
      () => PlayerController(
        rssFeedRepository: RssFeedRepository(
          rssFeedApiClient: RssFeedApiClient(
            dioClient: _dioService,
          ),
        ),
      ),
    );
  }
}

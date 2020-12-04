import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../data/providers/rss_feed_provider.dart';
import '../../data/repository/rss_feed_repository.dart';
import 'episode_controller.dart';

class EpisodeBinding extends Bindings {
  @override
  void dependencies() {
    final Dio _dioService = Get.find();

    Get.lazyPut<EpisodeController>(
      () => EpisodeController(
        rssFeedRepository: RssFeedRepository(
          rssFeedApiClient: RssFeedApiClient(
            dioClient: _dioService,
          ),
        ),
      ),
    );
  }
}

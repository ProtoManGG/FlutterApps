import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../data/providers/rss_feed_provider.dart';
import '../../data/repository/rss_feed_repository.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    final Dio _dioService = Get.find();
    Get.lazyPut<HomeController>(
      () => HomeController(
        rssFeedRepository: RssFeedRepository(
          rssFeedApiClient: RssFeedApiClient(dioClient: _dioService),
        ),
      ),
    );
  }
}

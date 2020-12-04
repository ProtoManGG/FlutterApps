import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:podder/app/constants/enums.dart';
import 'package:podder/app/data/models/failure_model.dart';
import 'package:podder/app/data/repository/rss_feed_repository.dart';
import 'package:webfeed/domain/rss_item.dart';
import 'package:webfeed/webfeed.dart';

class PlayerController extends GetxController {
  final RssFeedRepository rssFeedRepository;
  PlayerController({@required this.rssFeedRepository});

  String failure;
  RssItem rssItem;
  RssFeed rssFeed;
  final appState = AppState.loading.obs;

  @override
  Future<void> onInit() async {
    try {
      rssItem = Get.arguments as RssItem;
      rssFeed = await rssFeedRepository.getRssFeed();
      appState.value = AppState.loaded;
    } on Failure catch (f) {
      failure = f.toString();
      appState.value = AppState.failure;
    }
    super.onInit();
  }
}

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:podder/app/constants/enums.dart';
import 'package:podder/app/data/models/failure_model.dart';
import 'package:webfeed/webfeed.dart';

import '../../data/repository/rss_feed_repository.dart';

class EpisodeController extends GetxController {
  final RssFeedRepository rssFeedRepository;
  EpisodeController({@required this.rssFeedRepository});
  // Future<RssFeed> getRssFeed() async => rssFeedRepository.getRssFeed();

  RssFeed rssFeed;
  String failure;
  final appState = AppState.loading.obs;

  @override
  Future<void> onInit() async {
    try {
      rssFeed = await rssFeedRepository.getRssFeed();
      appState.value = AppState.loaded;
    } on Failure catch (f) {
      failure = f.toString();
      appState.value = AppState.failure;
    }
    super.onInit();
  }
}

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:podcaster/app/constants/enums.dart';
import 'package:podcaster/app/data/models/failure_model.dart';

import 'package:podcaster/app/data/repository/repository.dart';
import 'package:webfeed/domain/rss_feed.dart';

class HomeController extends GetxController {
  final Repository repository;

  HomeController({@required this.repository});
  final appState = AppState.loading.obs;

  RssFeed _rssFeed;
  RssFeed get rssFeed => _rssFeed;

  String _failure;
  String get failure => _failure;

  @override
  Future<void> onInit() async {
    super.onInit();
    try {
      _rssFeed = await repository.getRssFeed();
      appState.value = AppState.loaded;
    } on Failure catch (f) {
      _failure = f.toString();
      appState.value = AppState.failure;
    }
  }

  @override
  void onClose() {}
}

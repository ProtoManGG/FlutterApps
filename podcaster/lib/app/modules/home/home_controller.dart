import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/enums.dart';
import '../../data/models/failure_model.dart';
import '../../data/repository/repository.dart';
import 'package:webfeed/domain/rss_feed.dart';

class HomeController extends GetxController {
  final Repository repository;

  HomeController({@required this.repository});
  final appState = AppState.loading.obs;

  RssFeed _rssFeed;
  RssFeed get rssFeed => _rssFeed;

  String _failure;
  String get failure => _failure;

  ListView listView;

  @override
  Future<void> onInit() async {
    try {
      _rssFeed = await repository.getRssFeed();

      appState.value = AppState.loaded;
    } on Failure catch (f) {
      _failure = f.toString();
      appState.value = AppState.failure;
    }
    super.onInit();
  }

  @override
  void onClose() {}
}

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:podcaster/app/constants/enums.dart';
import 'package:podcaster/app/data/models/failure_model.dart';
import 'package:podcaster/app/data/repository/repository.dart';
import 'package:webfeed/domain/rss_item.dart';

class PlayerController extends GetxController {
  final Repository repository;

  final appState = AppState.loading.obs;

  PlayerController({@required this.repository});

  String _failure;
  String get failure => _failure;

  RssItem _rssItem;
  RssItem get rssItem => _rssItem;

  @override
  Future<void> onInit() async {
    super.onInit();
    try {
      //TODO: Get Argument passing get nulled need to find a better way. (rssItem != null error)
      _rssItem = Get.arguments as RssItem;
      appState.value = AppState.loaded;
    } on Failure catch (f) {
      _failure = f.toString();
      appState.value = AppState.failure;
    }
  }
}

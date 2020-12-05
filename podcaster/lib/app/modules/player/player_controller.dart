import 'package:flutter/foundation.dart';
import 'package:flutter_sound_lite/public/flutter_sound_player.dart';
import 'package:get/get.dart';
import 'package:webfeed/domain/rss_item.dart';

import '../../constants/enums.dart';
import '../../data/models/failure_model.dart';
import '../../data/repository/repository.dart';

class PlayerController extends GetxController {
  final Repository repository;

  final appState = AppState.loading.obs;

  PlayerController({@required this.repository});

  String _failure;
  String get failure => _failure;

  RssItem _rssItem;
  RssItem get rssItem => _rssItem;

  final FlutterSoundPlayer _player = FlutterSoundPlayer();
  FlutterSoundPlayer get player => _player;

  @override
  Future<void> onInit() async {
    super.onInit();
    try {
      //TODO: Get Argument passing get nulled need to find a better way. (rssItem != null error)
      _rssItem = Get.arguments as RssItem;
      await _player.openAudioSession();
      appState.value = AppState.loaded;
    } on Failure catch (f) {
      _failure = f.toString();
      appState.value = AppState.failure;
    }
  }

  @override
  Future<void> onClose() async {
    await _player.closeAudioSession();
    super.onClose();
  }
}

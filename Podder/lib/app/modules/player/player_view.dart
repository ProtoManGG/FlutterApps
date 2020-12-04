import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:podder/app/constants/enums.dart';
import 'package:podder/app/modules/episode/episode_controller.dart';
import 'package:webfeed/domain/rss_item.dart';

import 'player_controller.dart';
import 'widgets/player_widget.dart';

class PlayerView extends GetView<PlayerController> {
  @override
  Widget build(BuildContext context) {
    final EpisodeController episodeController = Get.find();
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () {
            if (controller.appState.value == AppState.loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (controller.appState.value == AppState.failure) {
              return Center(child: Text(controller.failure));
            } else {
              return Player(
                rssItem: Get.arguments as RssItem ??
                    episodeController.rssFeed.items.first,
                rssFeed: controller.rssFeed,
              );
            }
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:podder/app/constants/enums.dart';

import 'episode_controller.dart';
import 'widgets/episode_list_view_widget.dart';

class EpisodeView extends GetView<EpisodeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EpisodeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Obx(
          () {
            if (controller.appState.value == AppState.loading) {
              return const CircularProgressIndicator();
            } else if (controller.appState.value == AppState.failure) {
              return Text(controller.failure);
            } else {
              return EpisodeListView(
                rssFeed: controller.rssFeed,
              );
            }
          },
        ),
      ),
    );
  }
}

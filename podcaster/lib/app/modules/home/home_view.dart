import 'dart:isolate';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/enums.dart';
import 'home_controller.dart';
import '../../routes/app_pages.dart';
import '../../widgets/state_widgets.dart';
import '../../../main.dart';
import 'package:webfeed/domain/rss_feed.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () {
            if (controller.appState.value == AppState.loading) {
              return buildLoadingWidget();
            } else if (controller.appState.value == AppState.failure) {
              return buildFailureWidget(controller.failure);
            } else {
              return EpisodeListView(
                rssFeed: controller.rssFeed,
                controller: controller,
              );
            }
          },
        ),
      ),
    );
  }
}

class EpisodeListView extends StatelessWidget {
  const EpisodeListView({
    @required this.rssFeed,
    @required this.controller,
  });

  final RssFeed rssFeed;
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: ListView(
        children: rssFeed.items.reversed
            .map(
              (rssItem) => ListTile(
                title: Text(rssItem.title),
                isThreeLine: true,
                subtitle: Text(
                  rssItem.description,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.justify,
                ),
                onTap: () => Get.toNamed(Routes.PLAYER, arguments: rssItem),
              ),
            )
            .toList(),
      ),
      // child: controller.listView,
    );
  }
}

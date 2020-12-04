import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:podcaster/app/constants/enums.dart';
import 'package:podcaster/app/modules/home/home_controller.dart';
import 'package:podcaster/app/routes/app_pages.dart';
import 'package:podcaster/app/widgets/state_widgets.dart';
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
              return EpisodeListView(rssFeed: controller.rssFeed);
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
  });

  final RssFeed rssFeed;

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
    );
  }
}

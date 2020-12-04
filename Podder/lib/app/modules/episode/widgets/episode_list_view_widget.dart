import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webfeed/domain/rss_feed.dart';

import '../../../../routes/app_pages.dart';

class EpisodeListView extends StatelessWidget {
  const EpisodeListView({
    @required this.rssFeed,
  });

  final RssFeed rssFeed;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop:  () async => true,
          child: ListView(
        children: rssFeed.items
            .map(
              (i) => ListTile(
                title: Text(i.title),
                subtitle: Text(
                  i.description,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                onTap: () {
                  Get.toNamed(Routes.player, arguments: i);
                },
              ),
            )
            .toList()
            .reversed
            .toList(),
      ),
    );
  }
}

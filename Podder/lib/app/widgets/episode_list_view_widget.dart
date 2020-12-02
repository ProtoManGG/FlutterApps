import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:webfeed/domain/rss_feed.dart';

import '../data/models/rss_feed_model.dart';
import '../routes/app_pages.dart';

class EpisodeListView extends StatelessWidget {
  const EpisodeListView({
    @required this.rssFeed,
  });

  final RssFeed rssFeed;

  @override
  Widget build(BuildContext context) {
    return ListView(
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
                Provider.of<Podcast>(context).selectedItem = i;
                Get.toNamed(Routes.player);
              },
            ),
          )
          .toList(),
    );
  }
}

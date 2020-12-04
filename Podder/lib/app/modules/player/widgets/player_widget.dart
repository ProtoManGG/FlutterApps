import 'package:flutter/material.dart';
import 'package:webfeed/domain/rss_feed.dart';
import 'package:webfeed/domain/rss_item.dart';

import 'playback_button_widget.dart';

class Player extends StatelessWidget {
  final RssFeed rssFeed;
  final RssItem rssItem;

  const Player({
    @required this.rssFeed,
    @required this.rssItem,
  })  : assert(rssFeed != null),
        assert(rssItem != null);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flexible(
          flex: 5,
          child: Image.network(rssFeed.image.url),
        ),
        Flexible(
          flex: 5,
          child: SingleChildScrollView(
            child: Text(rssItem.description),
          ),
        ),
        Flexible(
          flex: 2,
          child: PlaybackButtonBar(guid: rssItem.guid),
        ),
      ],
    );
  }
}

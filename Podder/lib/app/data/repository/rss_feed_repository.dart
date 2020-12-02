import 'package:flutter/foundation.dart';
import 'package:webfeed/webfeed.dart';

import '../providers/rss_feed_provider.dart';

class RssFeedRepository {
  final RssFeedApiClient rssFeedApiClient;
  RssFeedRepository({@required this.rssFeedApiClient})
      : assert(rssFeedApiClient != null);

  Future<RssFeed> getRssFeed() async => rssFeedApiClient.getRssFeed();
}

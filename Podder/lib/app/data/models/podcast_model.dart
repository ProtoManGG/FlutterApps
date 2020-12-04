import 'package:webfeed/webfeed.dart';

class PodcastModel {
  RssItem selectedItem;
  RssFeed _feed;
  RssFeed get feed => _feed;
}

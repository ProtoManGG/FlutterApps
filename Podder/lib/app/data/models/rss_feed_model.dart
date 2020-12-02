import 'package:flutter/material.dart';
import 'package:webfeed/domain/rss_item.dart';
import 'package:webfeed/webfeed.dart';

class Podcast with ChangeNotifier {
  RssFeed _feed;
  RssItem _selectedItem;

  RssFeed get feed => _feed;

  RssItem get selectedItem => _selectedItem;

  set selectedItem(RssItem value) {
    _selectedItem = value;
    notifyListeners();
  }
}

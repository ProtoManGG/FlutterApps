import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:webfeed/domain/rss_feed.dart';

import '../../data/repository/rss_feed_repository.dart';

class HomeController extends GetxController {
  final RssFeedRepository rssFeedRepository;
  HomeController({@required this.rssFeedRepository});
  Future<RssFeed> getRssFeed() async => rssFeedRepository.getRssFeed();

  RssFeed rssFeed;

  @override
  Future<void> onInit() async {
    rssFeed = await getRssFeed();
    super.onInit();
  }
}

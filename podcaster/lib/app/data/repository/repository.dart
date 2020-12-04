import 'package:flutter/foundation.dart';
import 'package:webfeed/webfeed.dart';

import '../providers/api_client.dart';

class Repository {
  final ApiClient apiClient;
  Repository({@required this.apiClient}) : assert(apiClient != null);
  Future<RssFeed> getRssFeed() async => apiClient.getRssFeed();
}

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:webfeed/webfeed.dart';

import '../../constants/api_constants.dart';
import '../models/failure_model.dart';

class RssFeedApiClient {
  final Dio dioClient;
  RssFeedApiClient({@required this.dioClient});

  Future<RssFeed> getRssFeed() async {
    try {
      final response = await dioClient.get(baseUrl);
      return RssFeed.parse(response.data as String);
    } on DioError catch (e) {
      if (e.response != null) {
        throw Failure(
          statusCode: e.response.statusCode,
          message: e.response.statusMessage,
        );
      } else {
        throw Failure(message: e.message);
      }
    }
  }
}

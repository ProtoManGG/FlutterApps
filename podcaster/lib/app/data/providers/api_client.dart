import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../constants/api_constants.dart';
import 'package:webfeed/webfeed.dart';

import '../models/failure_model.dart';

class ApiClient {
  final Dio dioClient;
  ApiClient({@required this.dioClient}) : assert(dioClient != null);

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

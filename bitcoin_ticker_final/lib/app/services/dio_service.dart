import 'package:bitcoin_ticker/app/services/services.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ApiService extends GetxService {
  ApiService get instance => Get.find();

  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://apiv2.bitcoinaverage.com/indices/global/ticker',
      connectTimeout: 5000,
      receiveTimeout: 3000,
      headers: {
        'x-ba-key': 'ZTM4MjYxMDNjMTY3NDMyNGFjZTI4YmU2ZjVlZWJhMTYY',
      },
    ),
  );
}

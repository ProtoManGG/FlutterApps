import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:podder/app/constants/api_constants.dart';

Future<void> initServices() async {
  await Get.putAsync(() => DioService().init());
}

class DioService extends GetxService {
  Future<Dio> init() async => Dio(
        BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: 100,
          sendTimeout: 100,
          receiveTimeout: 100,
        ),
      );
}

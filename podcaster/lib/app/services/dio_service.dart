import 'package:dio/dio.dart';
import 'package:get/get.dart';

Future<void> initServices() async {
  await Get.putAsync(() => DioService().init());
}

class DioService extends GetxService {
  Future<Dio> init() async => Dio(BaseOptions(connectTimeout: 10000));
}

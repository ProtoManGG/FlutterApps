import 'package:aud_bot/modules/home/home_binding.dart';
import 'package:aud_bot/modules/home/home_page.dart';
import 'package:get/get.dart';
part './app_routes.dart';

abstract class AppPages {
  static const INITIAL = Routes.HOME;
  static final pages = [
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    )
  ];
}

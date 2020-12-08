import 'package:audio_bot/logic/home_binding.dart';
import 'package:audio_bot/pages/home_page.dart';
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

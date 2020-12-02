import 'package:get/get.dart';

import '../logic/bindings/home_binding.dart';
import '../pages/episode_page.dart';
import '../pages/home_view.dart';
import '../pages/pages.dart';

part 'app_routes.dart';

const initial = Routes.episode;

final routes = [
  GetPage(
    name: Routes.home,
    page: () => HomeView(),
    binding: HomeBinding(),
  ),
  GetPage(
    name: Routes.episode,
    page: () => EpisodesPage(),
    binding: HomeBinding(),
  ),
  GetPage(
    name: Routes.player,
    page: () => PlayerPage(),
    binding: HomeBinding(),
  ),
];

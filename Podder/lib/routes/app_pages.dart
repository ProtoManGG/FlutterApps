import 'package:get/get.dart';

import '../app/modules/episode/episode_binding.dart';
import '../app/modules/episode/episode_view.dart';
import '../app/modules/player/player_binding.dart';
import '../app/modules/player/player_view.dart';

part 'app_routes.dart';

const initial = Routes.episode;

final routes = [
  GetPage(
    name: Routes.episode,
    page: () => EpisodeView(),
    binding: EpisodeBinding(),
  ),
  GetPage(
    name: Routes.player,
    page: () => PlayerView(),
    binding: PlayerBinding(),
  ),
];

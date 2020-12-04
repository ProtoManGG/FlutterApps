import 'package:podcaster/app/modules/player/player_view.dart';
import 'package:podcaster/app/modules/player/player_binding.dart';
import 'package:podcaster/app/modules/home/home_view.dart';
import 'package:podcaster/app/modules/home/home_binding.dart';
import 'package:get/get.dart';
part 'app_routes.dart';

class AppPages {
  
static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: Routes.HOME, 
      page:()=> HomeView(), 
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.PLAYER, 
      page:()=> PlayerView(), 
      binding: PlayerBinding(),
    ),
  ];
}
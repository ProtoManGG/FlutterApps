import 'package:attendance_keeper/app/data/provider/user_provider.dart';
import 'package:attendance_keeper/app/data/repository/user_repository.dart';
import 'package:get/get.dart';

import 'package:attendance_keeper/app/modules/home/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(UserRepository(apiClient: UserApiClient())),
    );
  }
}

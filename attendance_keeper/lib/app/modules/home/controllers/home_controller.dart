import 'package:attendance_keeper/app/data/models/user_model.dart';
import 'package:attendance_keeper/app/data/repository/user_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final UserRepository _userRepository;
  HomeController(this._userRepository);

  List<User> getUserList() => _userRepository.getUsers();
}

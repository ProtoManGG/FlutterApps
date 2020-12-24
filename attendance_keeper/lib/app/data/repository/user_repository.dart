import 'package:attendance_keeper/app/data/models/user_model.dart';
import 'package:attendance_keeper/app/data/provider/user_provider.dart';
import 'package:meta/meta.dart';

class UserRepository {
  final UserApiClient apiClient;

  UserRepository({@required this.apiClient}) : assert(apiClient != null);

  List<User> getUsers() => apiClient.getUsers();
}

import 'package:attendance_keeper/app/data/models/user_model.dart';

class UserApiClient {
  List<User> getUsers() {
    return userList;
  }
}

List<User> userList = [
  User(name: "Preeti", joiningDate: DateTime(2020)),
  User(name: "Kunal", joiningDate: DateTime(2019)),
  User(name: "Luv", joiningDate: DateTime(2020)),
];

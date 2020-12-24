import 'package:get/get.dart';
import 'package:meta/meta.dart';

class User {
  final String name;
  final DateTime joiningDate;
  final RxBool isPresent = false.obs;
  final Package package;
  final bool isFeesPaid;

  User({
    @required this.name,
    @required this.joiningDate,
    this.package = Package.basic,
    this.isFeesPaid = false,
  }) : assert(name != null, joiningDate != null);
}

enum Package {
  basic,
  middle,
  superPack,
}

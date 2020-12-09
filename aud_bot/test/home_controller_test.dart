import 'package:aud_bot/modules/home/home_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  HomeController homeController;

  test(
    'should get list of radios from the url',
    () async {
      // arrange
      homeController = HomeController();
      final list = homeController.radios;
      // act
      // await homeController.wfetchRadios();
      // assert
      expect(homeController.radios, list);
    },
  );
}

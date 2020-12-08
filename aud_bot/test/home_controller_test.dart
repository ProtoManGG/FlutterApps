import 'package:aud_bot/logic/home_controller.dart';
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
      await homeController.fetchRadios();
      // assert
      expect(homeController.radios, list);
    },
  );
}

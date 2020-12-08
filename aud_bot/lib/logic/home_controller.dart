import 'package:aud_bot/models/radio_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxList radios = <RadioModel>[].obs;

  @override
  Future<void> onReady() async {
    await fetchRadios();
    super.onReady();
  }

  Future<void> fetchRadios() async {
    final radioJson = await rootBundle.loadString("assets/radio.json");
    radios.assignAll(RadioList.fromJson(radioJson).radios);
  }
}

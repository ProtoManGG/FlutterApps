import 'package:audio_bot/models/radio_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxBool isLoaded = false.obs;
  List<RadioModel> radios;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    await fetchRadios();
    print(radios.length);
    isLoaded.value = true;

    super.onReady();
  }

  Future<void> fetchRadios() async {
    final radioJson = await rootBundle.loadString("assets/radio.json");
    radios = RadioList.fromJson(radioJson).radios;
  }
}

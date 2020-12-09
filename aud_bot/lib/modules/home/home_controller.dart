import 'package:alan_voice/alan_voice.dart';
import 'package:aud_bot/models/radio_model.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxList<RadioModel> radios = <RadioModel>[].obs;
  final Rx<RadioModel> selectedRadioModel = Rx<RadioModel>();
  Rx<Color> selectedColor = Rx<Color>();
  RxBool isPlaying = false.obs;

  final sugg = [
    "Play",
    "Stop",
    "Play rock music",
    "Play 107 FM",
    "Play next",
    "Play 104 FM",
    "Pause",
    "Play previous",
    "Play pop music"
  ];

  final AudioPlayer audioPlayer = AudioPlayer();
  @override
  Future<void> onInit() async {
    await DotEnv().load('.env');

    setupAlan();
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    await _fetchRadios();
    audioPlayer.onPlayerStateChanged.listen((event) {
      if (event == AudioPlayerState.PLAYING) {
        isPlaying.value = true;
      } else {
        isPlaying.value = false;
      }
    });
  }

  Future<void> _fetchRadios() async {
    final radioJson = await rootBundle.loadString("assets/radio.json");
    radios.assignAll(RadioList.fromJson(radioJson).radios);
    selectedRadioModel.value = radios.first;
    selectedColor.value = Color(int.tryParse(selectedRadioModel.value.color));
  }

  void playMusic(String url) {
    audioPlayer.play(url);
    selectedRadioModel.value =
        radios.firstWhere((element) => element.url == url);
  }

  void setupAlan() {
    AlanVoice.addButton("${DotEnv().env['TOKEN']}/stage/stage",
        buttonAlign: AlanVoice.BUTTON_ALIGN_LEFT);

    AlanVoice.callbacks.add((command) => _handleCommands(command.data));
  }

  _handleCommands(Map<String, dynamic> response) {
    switch (response["command"]) {
      case "play":
        playMusic(selectedRadioModel.value.url);
        break;
      case "play_channel":
        final id = response["id"];
        audioPlayer.pause();
        RadioModel newRadio = radios.firstWhere((element) => element.id == id);
        radios.remove(newRadio);
        radios.insert(0, newRadio);
        playMusic(newRadio.url);
        break;
      case "stop":
        audioPlayer.stop();
        break;
      case "next":
        final int index = selectedRadioModel.value.id;
        RadioModel newRadio;
        if (index + 1 > radios.length) {
          newRadio = radios.firstWhere((element) => element.id == 1);
          radios.remove(newRadio);
          radios.insert(0, newRadio);
        } else {
          newRadio = radios.firstWhere((element) => element.id == index + 1);
          radios.remove(newRadio);
          radios.insert(0, newRadio);
        }
        playMusic(newRadio.url);
        break;
      case "prev":
        final int index = selectedRadioModel.value.id;
        RadioModel newRadio;
        if (index - 1 <= 0) {
          newRadio = radios.firstWhere((element) => element.id == 1);
          radios.remove(newRadio);
          radios.insert(0, newRadio);
        } else {
          newRadio = radios.firstWhere((element) => element.id == index - 1);
          radios.remove(newRadio);
          radios.insert(0, newRadio);
        }
        playMusic(newRadio.url);
        break;
      default:
    }
  }
}

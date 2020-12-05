import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webfeed/domain/rss_item.dart';

import '../../data/models/failure_model.dart';
import 'player_controller.dart';

class PlaybackButtonBar extends StatelessWidget {
  final RssItem rssItem;
  const PlaybackButtonBar({@required this.rssItem}) : assert(rssItem != null);

  @override
  Widget build(BuildContext context) {
    final PlayerController controller = Get.find();
    final _player = controller.player;

    final RxDouble _playPosition = 0.0.obs;
    final maxDuration = rssItem.itunes.duration.inSeconds.toDouble();

    final isPlaying = _player.isPlaying.obs;

    _player.onProgress.listen((event) {
      print("hello");
      _playPosition.value = event.position.inSeconds.toDouble();
    });

    Future<void> _play(String guid) async {
      try {
        await _player.startPlayer(
          fromURI: guid,
          whenFinished: () async {
            await _player.stopPlayer();
            isPlaying.value = _player.isPlaying;
            _playPosition.value = 0.0;
          },
        );
        isPlaying.value = _player.isPlaying;
      } catch (e) {
        await _player.stopPlayer();
        isPlaying.value = _player.isPlaying;
        throw Failure(message: e.toString());
      }
    }

    Future<void> _stop() async {
      await _player.stopPlayer();
      isPlaying.value = _player.isPlaying;
      _playPosition.value = 0.0;
    }

    Future<void> _forward() async {
      await _player
          .seekToPlayer(Duration(seconds: _playPosition.value.toInt() + 5));
      _playPosition.value = _playPosition.value + 5;
    }

    Future<void> _rewind() async {
      await _player
          .seekToPlayer(Duration(seconds: _playPosition.value.toInt() - 5));
      _playPosition.value = _playPosition.value - 5;
    }

    return Column(
      children: <Widget>[
        Obx(() => Slider(
              max: maxDuration,
              value: _playPosition.value,
              onChanged: (value) {
                _playPosition.value = value;
                return _player.seekToPlayer(Duration(seconds: value.toInt()));
              },
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.fast_rewind),
              onPressed: _rewind,
            ),
            Obx(() => IconButton(
                  icon: isPlaying.value
                      ? const Icon(Icons.stop)
                      : const Icon(Icons.play_arrow),
                  onPressed: () =>
                      isPlaying.value ? _stop() : _play(rssItem.guid),
                )),
            IconButton(
              icon: const Icon(Icons.fast_forward),
              onPressed: _forward,
            ),
          ],
        ),
      ],
    );
  }
}

// while (_player.isPlaying) {
//     _playPosition.value =
//         _player.playerState.index.seconds.inSeconds.toDouble();
//   }

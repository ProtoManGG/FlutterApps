import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:podcaster/app/constants/enums.dart';
import 'package:podcaster/app/modules/player/player_controller.dart';
import 'package:podcaster/app/widgets/state_widgets.dart';
import 'package:webfeed/domain/rss_item.dart';

class PlayerView extends GetView<PlayerController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () {
            if (controller.appState.value == AppState.loading) {
              return buildLoadingWidget();
            } else if (controller.appState.value == AppState.failure) {
              return buildFailureWidget(controller.failure);
            } else {
              return Player(rssItem: controller.rssItem);
            }
          },
        ),
      ),
    );
  }
}

class Player extends StatelessWidget {
  final RssItem rssItem;
  const Player({@required this.rssItem}) : assert(rssItem != null);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Flexible(
          flex: 5,
          // child: Image.network(rssItem.media.thumbnails.first.url),
          //TODO: Get Album Image Here (Maybe Hero)
          child: Placeholder(),
        ),
        Flexible(
          flex: 5,
          child: SingleChildScrollView(
            child: Text(rssItem.description),
          ),
        ),
        Flexible(
          flex: 2,
          child: PlaybackButtonBar(guid: rssItem.guid),
        ),
      ],
    );
  }
}

class PlaybackButtonBar extends StatelessWidget {
  final String guid;
  const PlaybackButtonBar({@required this.guid}) : assert(guid != null);

  @override
  Widget build(BuildContext context) {
    final RxDouble _playPosition = 0.0.obs;
    final RxBool _isPlaying = false.obs;

    void _play(String guid) {
      _isPlaying.value = true;
    }

    void _stop() {
      _isPlaying.value = false;
    }

    void _forward() {
      print("Forward");
    }

    void _rewind() {
      print("Rewind");
    }

    return Column(
      children: <Widget>[
        Obx(() => Slider(
              onChanged: (value) => _playPosition.value = value,
              value: _playPosition.value,
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.fast_rewind),
              onPressed: _rewind,
            ),
            Obx(() => IconButton(
                  icon: _isPlaying.value
                      ? const Icon(Icons.stop)
                      : const Icon(Icons.play_arrow),
                  onPressed: () => _isPlaying.value ? _stop() : _play(guid),
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

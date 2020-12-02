
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:provider/provider.dart';

import '../data/models/rss_feed_model.dart';


class PlaybackButton extends StatefulWidget {
  @override
  _PlaybackButtonState createState() => _PlaybackButtonState();
}

class _PlaybackButtonState extends State<PlaybackButton> {
  bool _isPlaying = false;
  FlutterSound _sound;
  double _playPosition;
  Stream<PlayStatus> _playerSubscription;

  @override
  void initState() {
    _sound = FlutterSound();
    _playPosition = 0;
    super.initState();
  }

  Future<void> _stop() async {
    await _sound.stopPlayer();
    setState(() => _isPlaying = false);
  }

  Future<void> _play(String url) async {
    await _sound.startPlayer(url);
    _playerSubscription = _sound.onPlayerStateChanged
      ..listen(
        (e) {
          setState(
            () => _playPosition = e.currentPosition / e.duration,
          );
        },
      );
    setState(
      () => _isPlaying = true,
    );
  }

  Future<void> _forward() async {
    if (_isPlaying) {
      setState(
        () async {
          await _sound.seekToPlayer(-50);
        },
      );
    }
  }

  Future<void> _rewind() async {
    if (_isPlaying) {
      setState(
        () async {
          await _sound.seekToPlayer(50);
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final item = Provider.of<Podcast>(context).selectedItem;
    return Column(
      children: <Widget>[
        Slider(
          onChanged: (value) {},
          value: _playPosition,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.fast_rewind),
              onPressed: _rewind,
            ),
            IconButton(
              icon: _isPlaying
                  ? const Icon(Icons.stop)
                  : const Icon(Icons.play_arrow),
              onPressed: () {
                if (_isPlaying) {
                  _stop();
                } else {
                  _play(item.guid);
                }
              },
            ),
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
